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

--- Set the indent and tab related numbers (local to buffer)
map("n", "<leader>u<tab>", function()
  local ok, input = pcall(vim.fn.input, "Set Tabstop Value (ts sts sw): ")
  if ok then
    local indent = tonumber(input) or 8 -- default ts = 8 / noet
    indent = math.abs((indent == 0) and 8 or indent) -- 0 not allowed for tabstop
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.shiftwidth = indent
    vim.notify(("Tabstop = %d †"):format(vim.bo.tabstop))
  end
  wk_update_desc("<leader>ut", function()
    return ("Tabstop = %d †"):format(vim.bo.tabstop)
  end)
end, { desc = ("Tabstop = %d †"):format(vim.bo.tabstop) })

-- Set completion
map(
  "n",
  "<leader>uB",
  function()
    if vim.b.completion ~= false then
      -- nil and true (active completion)
      vim.b.completion = false
    -- vim.notify("Disabled completion †")
    else
      vim.b.completion = true
      -- vim.notify("Enabled completion †")
    end
    if vim.b.completion ~= false then
      wk_update_desc("<leader>uB", function()
        return "Disable completion †"
      end)
    else
      wk_update_desc("<leader>uB", function()
        return "Enable completion †"
      end)
    end
  end,
  -- { desc = desc_cmp, icon = icon_cmp, color = color_cmp, }
  { desc = "XXXXXXX completion †" }
)
