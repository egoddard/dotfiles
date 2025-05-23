-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local LazyGit = require("snacks.lazygit")
local Util = require("lazyvim.util")
local set = vim.keymap.set

-- Make resizing splits easier
set("n", "<M-,>", "<c-w>2<")
set("n", "<M-.>", "<c-w>2>")
set("n", "<M-t>", "<c-w>2+")
set("n", "<M-s>", "<c-w>2-")

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

-- Easily hit escape in terminal mode.
set("t", "<esc><esc>", "<c-\\><c-n>")

-- floating terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end

set("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })

set("n", "<leader>fT", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })

-- Open a terminal at the bottom of the screen with a fixed height
set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
-- lazygit
set("n", "<leader>gg", function()
  LazyGit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
set("n", "<leader>gG", function()
  LazyGit()
end, { desc = "Lazygit (cwd)" })

-- Remove keymaps that interfere with git history
--vim.keymap.del({ "n" }, "<leader>gl")
--vim.keymap.del({ "n" }, "<leader>gL")

set("n", "<leader>gLf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyGit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })
--
set("n", "<leader>gLp", function()
  LazyGit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log (Project)" })
--
-- lazydocker
set("n", "<leader>dd", function()
  Util.terminal({ "lazydocker" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "LazyDocker" })

-- Disable lazyvim move lines bindings as they dont work well with my moonlander mappings
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
