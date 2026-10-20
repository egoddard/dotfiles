-- Clipboard for sessions whose yanks may need to reach another machine:
-- every copy is emitted as OSC 52 (inside tmux this becomes a tmux buffer,
-- rebroadcast to every attached client, local or SSH). Copy and paste also
-- use the local clipboard (Wayland, or pbcopy/pbpaste on macOS) when one is
-- available, so content copied in other apps remains pasteable; without one,
-- paste is an OSC 52 query that tmux (or the terminal) answers.
local M = {}

local function proc_lines(pid, file)
  local ok, lines = pcall(vim.fn.readfile, "/proc/" .. pid .. "/" .. file)
  return ok and lines or {}
end

local function proc_ppid(pid)
  for _, line in ipairs(proc_lines(pid, "status")) do
    local ppid = line:match("^PPid:%s+(%d+)")
    if ppid then
      return tonumber(ppid)
    end
  end
end

local function ancestor_process_named(name)
  local pid = vim.fn.getpid()

  for _ = 1, 16 do
    local ppid = proc_ppid(pid)
    if not ppid or ppid <= 1 then
      return false
    end

    local comm = proc_lines(ppid, "comm")[1] or ""
    if comm:find(name, 1, true) then
      return true
    end

    pid = ppid
  end

  return false
end

function M.setup()
  local in_tmux = vim.env.TMUX ~= nil
  local in_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil
  local in_herdr = vim.env.HERDR_PANE_ID ~= nil or ancestor_process_named("herdr")

  if not (in_tmux or in_ssh or in_herdr) then
    return
  end

  local osc52 = require("vim.ui.clipboard.osc52")
  local local_copy, local_paste
  if vim.env.WAYLAND_DISPLAY ~= nil and vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1 then
    local_copy = function(register)
      local cmd = { "wl-copy", "--sensitive", "--type", "text/plain" }
      if register == "*" then
        cmd[#cmd + 1] = "--primary"
      end
      return cmd
    end
    local_paste = function(register)
      local cmd = { "wl-paste", "--no-newline" }
      if register == "*" then
        cmd[#cmd + 1] = "--primary"
      end
      return cmd
    end
  elseif vim.fn.has("mac") == 1 and vim.fn.executable("pbcopy") == 1 and vim.fn.executable("pbpaste") == 1 then
    local_copy = function()
      return { "pbcopy" }
    end
    local_paste = function()
      return { "pbpaste" }
    end
  end

  local function copy(register)
    local emit = osc52.copy(register)

    return function(lines)
      if local_copy then
        vim.fn.system(local_copy(register), lines)
      end

      emit(lines)
    end
  end

  local function paste(register)
    if not local_paste then
      return osc52.paste(register)
    end

    return function()
      local lines = vim.fn.systemlist(local_paste(register), "", 1)
      return vim.v.shell_error == 0 and lines or {}
    end
  end

  vim.g.clipboard = {
    name = "RemoteClipboard",
    copy = { ["+"] = copy("+"), ["*"] = copy("*") },
    paste = { ["+"] = paste("+"), ["*"] = paste("*") },
    cache_enabled = 0,
  }
end

return M
