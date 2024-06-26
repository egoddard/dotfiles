local M = {}

local hostname = nil
M.hostname = function()
  if not hostname then
    hostname = vim.loop.os_gethostname()
  end
  return hostname
end

M.wants_transparent_background = function()
  return os.getenv 'NVIM_TRANSPARENT_BACKGROUND' == '1'
end

M.is_wsl = function()
  return vim.fn.executable 'wsl.exe' == 1
end

M.is_executable = function(cmd)
  return vim.fn.executable(cmd) == 1
end

return M
