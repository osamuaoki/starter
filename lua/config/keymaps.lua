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

-- update which-key description with function (no icon change)
local wk_update_desc = function(lhs, desc_fn)
  local ok, wk = pcall(require, "which-key")
  if ok then
    wk.add({
      {
        lhs,
        desc = desc_fn,
      },
    })
  end
end

-- Disable accidental execution of 'u' in normal mode after '<leader>u'
map("n", "<leader>uu", function() end, { desc = "which_key_ignore" }) -- hidden

-- LazyExtras '<leader>uX' make these accessible without dashboard screen
map("n", "<leader>uX", "<cmd> LazyExtras <cr>", { desc = "Lazy Extras †" })
