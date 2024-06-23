-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN HERE!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- This is simpler than "max397574/better-escape.nvim"
-- Ensure to set vim.opt.timeoutlen to be 200 (QMK) - 300 (LazyVim) to be responsive
map("i", "jk", "<esc>", { desc = "Exit insert-mode", remap = true })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit term-mode" })

-- Location list (just like quickfix)
map("n", "[l", vim.cmd.lprev, { desc = "Previous Location Item" })
map("n", "]l", vim.cmd.lnext, { desc = "Next Location list Item" })

-- Dismiss All Notification in normal mode with '<leader>n' as quick alt keymap
-- Copied from '<leader>un' with desc = "Dismiss All Notifications"
map("n", "<leader>n", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "No notify" })

--- Change linenumber (
map("n", "<leader>ul", function()
  if vim.wo.number and vim.wo.relativenumber then
    vim.wo.number = true
    vim.wo.relativenumber = false
    vim.notify("Change Line Numbers ':set nu nornu'")
  elseif vim.wo.number and not vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = true
    vim.notify("Change Line Numbers ':set nonu rnu'")
  elseif not vim.wo.number and vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.notify("Change Line Numbers ':set nonu nornu'")
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.notify("Change Line Numbers ':set nu rnu'")
  end
end, { desc = "Change Line Numbers" })

-- Toggle List Mode
map("n", "<leader>uL", function ()
  if vim.wo.list == true then
    vim.wo.list = false
  else
    vim.wo.list = true
  end
  vim.notify(("List Mode = %s\nlistchars='%s'"):format(vim.wo.list and "on" or "off", vim.wo.listchars))
end, { desc = "Toggle List Mode" })

-- Toggle precognition
map("n", "<leader>uP", function()
  if require("precognition").toggle() then
    vim.notify("Precognition enabled")
  else
    vim.notify("Precognition disabled")
  end
end, { desc = "Toggle Precognition" })

-- Cosmetic changes for shorter <leader> menu strings
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Alt. Buf." })
map("n", "<leader>-", "<C-W>s", { desc = "H Split", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "V Split", remap = true })
map("n", "<leader>L", function() LazyVim.news.changelog() end,
  { desc = "Changelog" })
-- Clear search, diff update and redraw taken from runtime/lua/_editor.lua
map( "n", "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw (nohls, diff)" })

-- Toggle indent guides
map("n", "<leader>ug", function()
  vim.cmd([[IBLToggle]])
end, { desc = "Toggle Indent Guides" })

-- Toggle Autocomplete vs. manual <C-SPACE> complete
map("n", "<leader>um", function()
  local cmp = require('cmp')
  local current_setting = cmp.get_config().completion.autocomplete
  if current_setting and #current_setting > 0 then
    cmp.setup({ completion = { autocomplete = false } })
    vim.notify('Autocomplete disabled')
  else
    cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
    vim.notify('Autocomplete enabled')
  end
end, { desc = "Toggle Autocomplete" })

--- Set notification timeout
map("n", "<leader>uN", function()
  local ok, input = pcall(vim.fn.input, "Set Notification timeout value (ms): ")
  if ok then
    vim.g.notify_timeout = tonumber(input) or 10000 -- default 10 sec
    vim.notify(("Notification timeout=%d ms"):format(vim.g.notify_timeout))
  end
end, { desc = "Set Notification Timeout" })

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
  vim.notify(("signcolumn=%s"):format(vim.wo.signcolumn))
end, { desc = "Change signcolumn" })

--- Set the indent and tab related numbers (local to buffer)
map("n", "<leader>ut", function()
  local ok, input = pcall(vim.fn.input, "Set tabstop value (<0 expandtab, >0 noexpandtab): ")
  if ok then
    local indent = tonumber(input) or 8  -- default ts = 8 / noet
    indent = (indent == 0) and 8 or indent -- 0 not allowed for tabstop
    vim.bo.expandtab = (indent < 0)
    indent = math.abs(indent)
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.shiftwidth = indent
    vim.notify(("indent=%d %s"):format(indent, vim.bo.expandtab and "expandtab" or "noexpandtab"))
  end
end, { desc = "Set ts sts sw et" })

-- Disable accidental 'u' in normal mode after '<leader>u'
map("n", "<leader>uu", function () end, { desc = "which_key_ignore" }) -- hidden

-- LazyExtras '<leader>ux' make these accessible
map("n", "<leader>ux", "<cmd> LazyExtras <cr>", { desc = "Lazy Extras" })

-- Toggle Whitespace_check
map("n", "<leader>uw", function()
  local tailing_whitespace0 = [[TailingWhitespaces //]]
  local tailing_whitespace1 = [[TailingWhitespaces /\s\+\%#\@<!$/]]
  if vim.g.tailing_whitespace then
    vim.g.tailing_whitespace = false
    vim.cmd.match(tailing_whitespace0)
    vim.notify("Whitespace check = off")
  else
    -- default
    vim.g.tailing_whitespace = true
    vim.cmd.match(tailing_whitespace1)
    vim.notify("Whitespace check = on")
  end
end, { desc = "Toggle Whitespace chack" })

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
  vim.notify(("foldcolumn=%s"):format(vim.wo.foldcolumn))
end, { desc = "Change foldcolumn" })

-- Enable all auto-input features with '<leader>ua'
map("n", "<leader>uQ", function()
  local cmp = require('cmp')
  cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
  vim.g.minipairs_disable = false
  vim.g.autoformat = true
  vim.diagnostic.enable(true)
  require("precognition").show()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.notify("Non-quiet UI forced")
  vim.wo.foldcolumn = "auto"
end, { desc = "Force Non-quiet UI" })

-- Disable all auto-input features with '<leader>uA'
map("n", "<leader>uq", function()
  local cmp = require('cmp')
  cmp.setup({ completion = { autocomplete = false } })
  vim.g.minipairs_disable = true
  vim.g.autoformat = false
  vim.diagnostic.enable(false)
  require("precognition").hide()
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.notify("Quiet UI forced")
  vim.wo.foldcolumn = "0"
end, { desc = "Force Quiet UI" })

-- Consolidate floating terminal (cosmetic)
map("n", "<leader>ft", function() end, { desc = "which_key_ignore" })
map("n", "<leader>fT", function() end, { desc = "which_key_ignore" })
map("n", "<leader>tt", function()
  LazyVim.terminal( nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (/)" })
map("n", "<leader>tT", function()
  LazyVim.terminal()
end, { desc = "Terminal (.)" })

map("n", "<leader>td", function()
  LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" }, { cwd = LazyVim.root() })
end, { desc = "Dash (/)" })
map("n", "<leader>tD", function()
  LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" })
end, { desc = "Dash (.)" })

map("n", "<leader>tl", function()
  LazyVim.terminal({ "lua" }, { cwd = LazyVim.root() })
end, { desc = "Lua REPL (/)" })
map("n", "<leader>tL", function()
  LazyVim.terminal({ "lua" })
end, { desc = "Lua REPL (.)" })

map("n", "<leader>tl", function()
  LazyVim.terminal({ "reply" }, { cwd = LazyVim.root() })
end, { desc = "Perl REPL (/)" })
map("n", "<leader>tL", function()
  LazyVim.terminal({ "reply" })
end, { desc = "Perl REPL (.)" })

map("n", "<leader>ty", function()
  LazyVim.terminal({ "python3" }, { cwd = LazyVim.root() })
end, { desc = "Python REPL (/)" })
map("n", "<leader>tY", function()
  LazyVim.terminal({ "python3" })
end, { desc = "Python REPL (.)" })

-- quickfix/Location List history picker is missing
-- https://github.com/nvim-telescope/telescope.nvim/issues/1739
-- https://github.com/kevinhwang91/nvim-bqf (No recent updates)
-- https://vimways.org/2018/colder-quickfix-lists/ (Vim)
-- https://github.com/stefandtw/quickfix-reflector.vim
-- https://github.com/romainl/vim-qf (vim)
-- https://github.com/bfrg/vim-qf-history (vim9 2 yr old)
--
-- Telescope quickfix can perform down-selection.
-- Until proper solution is found, I will use the folowing
map("n", "<leader>xt", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix pick" }) -- same as <leader>sq
map("n", "<leader>xT", "<cmd>Telescope locfix<cr>", { desc = "Location pick" })   -- same as <leader>sl
-- map("n", "<leader>xi", vim.cmd.chistory, { desc = "Quickfix older" })  -- odd output
-- map("n", "<leader>xj", function() vim.cmd.chistory() end, { desc = "Quickfix older" })  -- odd output
map("n", "<leader>x/", "<cmd>chistory<cr>", {  desc = "Quickfix history" })
map("n", "<leader>x,", function() vim.cmd.colder() end, { desc = "Quickfix older" })
map("n", "<leader>x.", function() vim.cmd.cnewer() end, { desc = "Quickfix newer" })
map("n", "<leader>x?", "<cmd>lhistory<cr>", { desc = "Location history" })
map("n", "<leader>x<lt>", function() vim.cmd.lolder() end, { desc = "Location older" }) -- < is not enough
map("n", "<leader>x>", function() vim.cmd.lnewer() end, { desc = "Location newer" })
