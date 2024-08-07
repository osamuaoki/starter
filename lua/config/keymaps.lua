-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN HERE!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set
local wk_update_desc = function(lhs, desc_fn)
  local ok, wk = pcall(require, "which-key")
  if ok then
    wk.add({
      {
        lhs,
        desc = desc_fn,
        icon = "",
      },
    })
  end
end

-- This should be minimal deviation

-- This is simpler than "max397574/better-escape.nvim"
-- Ensure to set vim.opt.timeoutlen to be 200 (QMK) - 300 (LazyVim) to be responsive
map("i", "jk", "<esc>", { desc = "Exit insert-mode", remap = true })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit term-mode", remap = true })

-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
map(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr>" .. '<cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr><esc>',
  { desc = "Escape and Clear hlsearch" }
)

-- Toggle List Mode for Whitespaces (NL/TAB/...)
LazyVim.toggle.map("<leader>uM", LazyVim.toggle("list", { name = "List Mode †" }))

-- Toggle expandtab
LazyVim.toggle.map("<leader>ux", LazyVim.toggle("expandtab", { name = "Expand Tab †" }))

-- -- Toggle precognition
-- map("n", "<leader>uP", function()
--   if require("precognition").toggle() then
--     vim.notify("Precognition enabled")
--   else
--     vim.notify("Precognition disabled")
--   end
-- end, { desc = "Toggle Precognition" })
--
-- Toggle Auto/manual pop-up for autocomplete (<C-SPACE> : manual)
local cmp = require("cmp")
LazyVim.toggle.map(
  "<leader>ua",
  LazyVim.toggle.wrap({
    name = "Autocomplete †",
    get = function()
      return cmp.get_config().completion.autocomplete == false
    end,
    set = function(state)
      if state then
        cmp.setup({ completion = { autocomplete = false } })
      else
        cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
      end
    end,
  })
)

--- Set notification timeout
map("n", "<leader>uN", function()
  local ok, input = pcall(vim.fn.input, "Set Notification timeout value (ms): ")
  if ok then
    vim.g.notify_timeout = tonumber(input) or 10000 -- default 10 sec
    vim.notify(("Notification timeout = %d ms"):format(vim.g.notify_timeout))
  end
  wk_update_desc("<leader>uN", function()
    return ("Notification Timeout = %d ms †"):format(vim.g.notify_timeout)
  end)
end, { desc = ("Notification Timeout = %d ms †"):format(vim.g.notify_timeout) })
-- wk_update_desc("<leader>uN", function()
--   return ("Notification Timeout = %d ms †"):format(vim.g.notify_timeout)
-- end)

--- Set the indent and tab related numbers (local to buffer)
map("n", "<leader>ut", function()
  local ok, input = pcall(vim.fn.input, "Set tabstop value (ts sts sw): ")
  if ok then
    local indent = tonumber(input) or 8 -- default ts = 8 / noet
    indent = math.abs((indent == 0) and 8 or indent) -- 0 not allowed for tabstop
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.shiftwidth = indent
    vim.notify(("tabstop = %d †"):format(vim.bo.tabstop))
  end
  wk_update_desc("<leader>ut", function()
    return ("tabstop = %d †"):format(vim.bo.tabstop)
  end)
end, { desc = ("tabstop = %d †"):format(vim.bo.tabstop) })
-- wk_update_desc("<leader>ut", function()
--   return ("tabstop = %d †"):format(vim.bo.tabstop)
-- end)

-- Disable accidental 'u' in normal mode after '<leader>u'
map("n", "<leader>uu", function() end, { desc = "which_key_ignore" }) -- hidden

-- LazyExtras '<leader>uX' make these accessible
map("n", "<leader>uX", "<cmd> LazyExtras <cr>", { desc = "Lazy Extras †" })

-- Toggle Tailspace check
local tailspace0 = [[Tailspace //]]
local tailspace1 = [[Tailspace /\s\+\%#\@<!$/]]
LazyVim.toggle.map(
  "<leader>uW",
  LazyVim.toggle.wrap({
    name = "Check Tailspace †",
    get = function()
      return vim.g.tailspace
    end,
    set = function(state)
      if state then
        vim.g.tailspace = true
        vim.cmd.match(tailspace1)
      else
        vim.g.tailspace = false
        vim.cmd.match(tailspace0)
      end
    end,
  })
)

--- Change signcolumn
map("n", "<leader>uS", function()
  if vim.wo.signcolumn == "auto" then
    vim.wo.signcolumn = "yes"
  elseif vim.wo.signcolumn == "yes" then
    vim.wo.signcolumn = "no"
  else
    -- default
    vim.wo.signcolumn = "auto"
  end
  vim.notify(("signcolumn = %s †"):format(vim.wo.signcolumn))
  wk_update_desc("<leader>uS", function()
    return ("signcolumn = %s †"):format(vim.wo.signcolumn)
  end)
end, { desc = ("signcolumn = %s †"):format(vim.wo.signcolumn) })
-- wk_update_desc("<leader>uS", function()
--   return ("signcolumn = %s †"):format(vim.wo.signcolumn)
-- end)

-- Change spelloptions
map("n", "<leader>uo", function()
  if vim.bo.spelloptions == "" then
    vim.bo.spelloptions = "camel"
  elseif vim.bo.spelloptions == "camel" then
    vim.bo.spelloptions = "noplainbuffer"
  else
    -- default
    vim.bo.spelloptions = ""
  end
  vim.notify(("spelloptions = %s †"):format(vim.bo.spelloptions))
  wk_update_desc("<leader>uo", function()
    return ("spelloptions = %s †"):format(vim.bo.spelloptions)
  end)
end, { desc = ("spelloptions = %s †"):format(vim.bo.spelloptions) })
-- wk_update_desc("<leader>uo", function()
--   return ("spelloptions = %s †"):format(vim.bo.spelloptions)
-- end)

-- Change foldcolumn
map("n", "<leader>uz", function()
  if vim.wo.foldcolumn == "0" then
    vim.wo.foldcolumn = "2"
  elseif vim.wo.foldcolumn == "2" then
    vim.wo.foldcolumn = "auto"
  else
    -- default
    vim.wo.foldcolumn = "0"
  end
  vim.notify(("foldcolumn = %s †"):format(vim.wo.foldcolumn))
  wk_update_desc("<leader>uz", function()
    return ("foldcolumn = %s †"):format(vim.wo.foldcolumn)
  end)
end, { desc = ("foldcolumn = %s †"):format(vim.wo.foldcolumn) })
-- wk_update_desc("<leader>uz", function()
--   return ("foldcolumn = %s †"):format(vim.wo.foldcolumn)
-- end)

--- -- Enable all auto-input features with '<leader>ua'
--- map("n", "<leader>uQ", function()
---   local cmp = require('cmp')
---   cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
---   vim.g.minipairs_disable = false
---   vim.g.autoformat = true
---   vim.diagnostic.enable(true)
---   require("precognition").show()
---   vim.opt.number = true
---   vim.opt.relativenumber = true
---   vim.notify("Non-quiet UI forced")
---   vim.wo.foldcolumn = "auto"
--- end, { desc = "Force Non-quiet UI" })
---
--- -- Disable all auto-input features with '<leader>uA'
--- map("n", "<leader>uq", function()
---   local cmp = require('cmp')
---   cmp.setup({ completion = { autocomplete = false } })
---   vim.g.minipairs_disable = true
---   vim.g.autoformat = false
---   vim.diagnostic.enable(false)
---   require("precognition").hide()
---   vim.opt.number = false
---   vim.opt.relativenumber = false
---   vim.notify("Quiet UI forced")
---   vim.wo.foldcolumn = "0"
--- end, { desc = "Force Quiet UI" })
---
--- -- Consolidate floating terminal (cosmetic)
--- --map("n", "<leader>ft", function() end, { desc = "which_key_ignore" })
--- --map("n", "<leader>fT", function() end, { desc = "which_key_ignore" })
--- map("n", "<leader>tt", function()
---   LazyVim.terminal( nil, { cwd = LazyVim.root() })
--- end, { desc = "Terminal (/)" })
--- map("n", "<leader>tT", function()
---   LazyVim.terminal()
--- end, { desc = "Terminal (.)" })
---
--- map("n", "<leader>td", function()
---   LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" }, { cwd = LazyVim.root() })
--- end, { desc = "Dash (/)" })
--- map("n", "<leader>tD", function()
---   LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" })
--- end, { desc = "Dash (.)" })
---
--- map("n", "<leader>tl", function()
---   LazyVim.terminal({ "lua" }, { cwd = LazyVim.root() })
--- end, { desc = "Lua REPL (/)" })
--- map("n", "<leader>tL", function()
---   LazyVim.terminal({ "lua" })
--- end, { desc = "Lua REPL (.)" })
---
--- map("n", "<leader>tl", function()
---   LazyVim.terminal({ "reply" }, { cwd = LazyVim.root() })
--- end, { desc = "Perl REPL (/)" })
--- map("n", "<leader>tL", function()
---   LazyVim.terminal({ "reply" })
--- end, { desc = "Perl REPL (.)" })
---
--- map("n", "<leader>ty", function()
---   LazyVim.terminal({ "python3" }, { cwd = LazyVim.root() })
--- end, { desc = "Python REPL (/)" })
--- map("n", "<leader>tY", function()
---   LazyVim.terminal({ "python3" })
--- end, { desc = "Python REPL (.)" })
---
-- map("n", "[l", vim.cmd.lprevious, { desc = "Previous Location List Item" })
-- map("n", "]l", vim.cmd.lnext, { desc = "Next Location List Item" })
