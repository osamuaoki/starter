-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE `LazyVim.safe_keymap_set` IN HERE!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- This is simpler than "max397574/better-escape.nvim"
-- Ensure to set vim.opt.timeoutlen to be 200 (QMK) - 300 (LazyVim) to be responsive
map("i", "jk", "<esc>", { desc = "Exit insert-mode †", remap = true })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit term-mode †" })

-- Location list (just like quickfix)
map("n", "[l", vim.cmd.lprev, { desc = "Previous Location Item" })
map("n", "]l", vim.cmd.lnext, { desc = "Next Location list Item" })

-- Toggle precognition
map("n", "<leader>uP", function()
  if require("precognition").toggle() then
    vim.notify("Precognition enabled")
  else
    vim.notify("Precognition disabled")
  end
end, { desc = "Toggle Precognition †" })

-- LazyExtras '<leader>ux' make these accessible
map("n", "<leader>ux", "<cmd> LazyExtras <cr>", { desc = "Lazy Extras †" })

-- Dismiss All Notification in normal mode with '<leader>n' as quick alt keymap
-- Copied from '<leader>un' with desc = "Dismiss All Notifications"
map("n", "<leader>n", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "No notify" })

-- Disable accidental 'u' in normal mode after '<leader>u'
map("n", "<leader>uu", function () end, { desc = "which_key_ignore" }) -- hidden

-- Cosmetic changes for shorter <leader> menu strings
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Alt. Buf." })
map("n", "<leader>-", "<C-W>s", { desc = "H Split", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "V Split", remap = true })
map("n", "<leader>L", function() LazyVim.news.changelog() end,
  { desc = "Changelog" })
-- Clear search, diff update and redraw taken from runtime/lua/_editor.lua
map( "n", "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw (nohls, diff) †" })

-- Consolidate floating terminal
map("n", "<leader>ft", function() end, { desc = "which_key_ignore" })
map("n", "<leader>fT", function() end, { desc = "which_key_ignore" })
map("n", "<leader>tt", function()
  LazyVim.terminal( nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (/)" })
map("n", "<leader>tT", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })

map("n", "<leader>td", function()
  LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" }, { cwd = LazyVim.root() })
end, { desc = "Dash (/) †" })
map("n", "<leader>tD", function()
  LazyVim.terminal({ "rlwrap", "dash", "-l", "-i" })
end, { desc = "Dash (cwd) †" })

map("n", "<leader>tl", function()
  LazyVim.terminal({ "lua" }, { cwd = LazyVim.root() })
end, { desc = "Lua REPL (/) †" })
map("n", "<leader>tL", function()
  LazyVim.terminal({ "lua" })
end, { desc = "Lua REPL (cwd) †" })

map("n", "<leader>tl", function()
  LazyVim.terminal({ "reply" }, { cwd = LazyVim.root() })
end, { desc = "Perl REPL (/) †" })
map("n", "<leader>tL", function()
  LazyVim.terminal({ "reply" })
end, { desc = "Perl REPL (cwd) †" })

--map("n", "<leader>tm", function()
--  LazyVim.terminal({ "mc" }, { cwd = LazyVim.root() })
--end, { desc = "MidnightCommander (/) †" })
-- Parameter="FG,BG:" .. -- default_Value -- Description
local mc_color = "" ..
"normal=darkblue,black:" .. -- lightgray,blue: Main color ***
"reverse=white,lightgray:" .. -- black,lightgray: Inverse color
"gauge=white,black:" .. -- white,black: Progressbar indicator
"input=black,white:" .. -- ** black,cyan: Input string
"selected=black,white:" .. -- **  black,cyan: Panel: current file
"marked=yellow,blue:" .. -- yellow,blue: Panel: marked file
"markselect=yellow,cyan:" .. -- yellow,cyan: Panel: current marked file
"directory=white,blue:" .. -- white,blue: Panel: directory
"executable=brightgreen,blue:" .. -- brightgreen,blue: Panet: executable file
"link=lightgray,blue:" .. -- lightgray,blue: Panel: symlink
"stalelink=brightred,blue:" .. -- brightred,blue: Panel: stale symlink
"device=brightmagenta,blue:" .. -- brightmagenta,blue: Panel: file of device
"core=red,blue:" .. -- red,blue: Panel: core-file
"special=black,blue:" .. -- black,blue: Panel: special file
"dnormal=gray,gray:" .. -- ** black,lightgray: Dialog window: main color
"dfocus=gray,cyan:" .. -- black,cyan: Dialog window: color of focused element
"dhotnormal=gray,gray:" .. -- ** blue,lightgray: Dialog window: Color of character for hotkey
"dhotfocus=gray,cyan:" .. -- blue,cyan: Dialog window: Color of character for hotkey in focused element
"errors=white,red:" .. -- white,red: Error message: main color
"errdhotnormal=yellow,red:" .. -- yellow,red: Error message: Color of character for hotkey
"errdhotfocus=yellow,lightgray:" .. -- yellow,lightgray: Error message: Color of character for hotkey in focused element
"menu=gray,white:" .. -- white,cyan: Menu: main color
"menusel=gray,white:" .. -- white,black: Menu: selected item
"menuhot=yellow,black:" .. -- ** yellow,cyan: Menu: Color of character for hotkey
"menuhotsel=red,black:" .. -- yellow,black: Меню: Color of character for hotkey in selected item
"helpnormal=black,white:" .. -- ** black,lightgray: Help: main color
"helpitalic=red,lightgray:" .. -- red,lightgray: Help: italic text
"helpbold=blue,lightgray:" .. -- blue,lightgray: Help: bold text
"helplink=black,cyan:" .. -- black,cyan: Help: unselected text link
"helpslink=yellow,blue:" .. -- yellow,blue: Help: selected text link
"viewunderline=brightred,blue:" .. -- brightred,blue: Viewer and editor: underlined text
"editnormal=black,white:" .. -- lightgray,blue: Editor: main color
"editbold=yellow,blue:" .. -- yellow,blue: Editor: color of highlighted search results
"editmarked=black,cyan:" .. -- black,cyan: Editor: marked text
"editwhitespace=brightblue,blue:" .. -- brightblue,blue: Editor: tabs and trailing spaces
"editlinestate=white,cyan"  -- white,cyan: Editor: color of status field for lines

map("n", "<leader>tm", function()
  --LazyVim.terminal({ "mc" })  --  bad color taste
  --LazyVim.terminal({ "mc", "-b" })  --  works but B/W
  LazyVim.terminal({ "mc", "--color", "--colors=" .. mc_color }, { cwd = LazyVim.root() })
end, { desc = "MidnightCommander (/) †" })

map("n", "<leader>tM", function()
  --LazyVim.terminal({ "mc", "--colors"})
  LazyVim.terminal({ "mc", "--colors=" .. mc_color })
end, { desc = "MidnightCommander (cwd) †" })

map("n", "<leader>ty", function()
  LazyVim.terminal({ "python3" }, { cwd = LazyVim.root() })
end, { desc = "Python REPL (/) †" })
map("n", "<leader>tY", function()
  LazyVim.terminal({ "python3" })
end, { desc = "Python REPL (cwd) †" })

map("n", "<leader>um", function()
  -- vim.g.cmp_disable == nil is treated as false
  vim.g.cmp_disable = not vim.g.cmp_disable
  if vim.g.cmp_disable then
    vim.notify("Disabled Complete (Global)")
  else
    vim.notify("Enabled Complete (Global)")
  end
end, { desc = "Toggle Complete (Global) †" })

map("n", "<leader>ug", function()
  vim.cmd([[IBLToggle]])
end, { desc = "Toggle Indent Guides †" })

-- https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-1863791084
map("n", "<leader>uM", function()
  if vim.fn.exists("b:cmp_disable") == 0 then
    vim.api.nvim_buf_set_var(0, "cmp_disable", vim.g.cmp_disable)
  end
  if vim.api.nvim_buf_get_var(0, "cmp_disable") then
    vim.api.nvim_buf_set_var(0, "cmp_disable", false)
    require("cmp").setup.buffer({ enabled = true })
    vim.notify("Enabled Complete (Buffer)")
  else
    vim.api.nvim_buf_set_var(0, "cmp_disable", false)
    require("cmp").setup.buffer({ enabled = false })
    vim.notify("Disabled Complete (Buffer)")
  end
end, { desc = "Toggle Complete (Buffer) †" })

--- Set notification timeout
map("n", "<leader>uN", function()
  local ok, input = pcall(vim.fn.input, "Set Notification timeout value (ms): ")
  if ok then
    vim.g.notify_timeout = tonumber(input) or 10000 -- default 10 sec
    vim.notify(("Notification timeout=%d ms"):format(vim.g.notify_timeout))
  end
end, { desc = "Set Notification Timeout †" })

--- Set the indent and tab related numbers (local to buffer)
map("n", "<leader>ut", function()
  local ok, input = pcall(vim.fn.input, "Set tabstop value (>0 expandtab, <0 noexpandtab): ")
  if ok then
    local indent = tonumber(input) or -8  -- default ts = 8 / noet
    indent = (indent == 0) and -8 or indent -- 0 not allowed for tabstop
    vim.bo.expandtab = (indent > 0)
    indent = math.abs(indent)
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.shiftwidth = indent
    vim.notify(("indent=%d %s"):format(indent, vim.bo.expandtab and "expandtab" or "noexpandtab"))
  end
end, { desc = "Set ts sts sw et †" })

-- Change foldcolumn
local last_active_foldcolumn
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
end, { desc = "Change foldcolumn †" })

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
end, { desc = "Change signcolumn †" })

--- Change linenumber (
map("n", "<leader>ul", function()
  if vim.wo.number and vim.wo.relativenumber then
    vim.wo.number = true
    vim.wo.relativenumber = false
    vim.notify("Change Line Numbers ':set nu nornu'")
  elseif vim.wo.number and not vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.notify("Change Line Numbers ':set nonu nonrnu'")
  else -- skip nonu / rnu
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.notify("Change Line Numbers ':set nu rnu'")
  end
end, { desc = "Change Line Numbers †" })

map("n", "<leader>uL", function() end, { desc = "which_key_ignore" }) -- FIXME: repurpose

-- Enable all auto-input features with '<leader>ua'
map("n", "<leader>uQ", function()
  vim.g.cmp_disable = false
  vim.g.minipairs_disable = false
  vim.g.autoformat = true
  vim.diagnostic.enable(true)
  require("precognition").show()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.notify("Non-quiet UI forced")
end, { desc = "Force Non-quiet UI †" })

-- Disable all auto-input features with '<leader>uA'
map("n", "<leader>uq", function()
  vim.g.cmp_disable = true
  vim.g.minipairs_disable = true
  vim.g.autoformat = false
  vim.diagnostic.enable(false)
  require("precognition").hide()
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.notify("Quiet UI forced")
end, { desc = "Force Quiet UI †" })

