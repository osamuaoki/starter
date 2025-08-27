-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN HERE!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- Easy ESC-key.  (simpler than "max397574/better-escape.nvim")
-- Ensure vim.opt.timeoutlen to be 200 (QMK-like) - 300 (LazyVim-default) to be responsive
map("i", "jk", "<esc>", { desc = "Exit insert-mode", remap = true })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit term-mode", remap = true })
map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit term-mode", remap = true })
