-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = "_"
vim.g.python3_host_prog = vim.fn.expand("~") .. "/.virtualenvs/py3nvim/bin/python"
vim.opt.inccommand = "nosplit"
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.root_spec = { "cwd" }

-- these options are needed for allowing line numbers to function as diagnostic indicators
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:1"
vim.opt.statuscolumn = "%l%s"
