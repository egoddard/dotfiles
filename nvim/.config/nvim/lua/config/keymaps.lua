-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<M-,>", "<c-w>2<")
set("n", "<M-.>", "<c-w>2>")
set("n", "<M-t>", "<c-w>2+")
set("n", "<M-s>", "<c-w>2-")
