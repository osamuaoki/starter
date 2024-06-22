-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set starting mode of modified LazyVim (overriding upstream LazyVim defaults)

-- ===========================================================================
-- Restore defaults for Vim options (may have be overridden by LazyVim)
-- ===========================================================================
vim.opt.background = "dark" -- To be safe side
vim.opt.number = false -- Relative line numbers (:h 'number)
vim.opt.relativenumber = false -- Relative line numbers (:h 'relativenumber)

-- ===========================================================================
-- Initialize via Vim options with optimized values
-- ===========================================================================
vim.opt.errorbells = false -- :h 'eb
vim.opt.ignorecase = true -- h: 'ic
vim.opt.list = true -- h: 'list
vim.opt.listchars = { eol = "¶", tab = "⇄ ", extends = "↦", precedes = "↤", nbsp = "␣" }
vim.opt.smartcase = true -- :h 'sc (see h: 'ic)
vim.opt.spell = true -- :h 'spell
vim.opt.spelllang = "en_us,cjk" -- :h 'spl -- english spell, ignore CJK
vim.opt.timeoutlen = 200 -- Timeoutlen (default 1000, AstroNvim 500, LazyVim 300) (:h 'tm)
vim.opt.viminfo = "!,'100,<5000,s100,h" -- :h 'vi -- bigger copy buffer etc.
vim.opt.visualbell = false -- :h 'vb
vim.opt.wrap = false -- :h 'wrap

-- ===========================================================================
-- Initialize via means introduced by nvim and external plugin packages
-- ===========================================================================
vim.diagnostic.enable(true)
vim.g.autoformat = false -- conform.nvim: no autoformat on save
vim.g.minipairs_disable = true -- mini.pair: no input pairs '' "" () [] {} ``

-- ===========================================================================
-- Initialize via means introduced by local configuration
-- ===========================================================================
vim.g.autocomplete_disable = true -- lua/plugins/nvim-cmp.lua
vim.g.inlay_hint_disable = true -- lua/plugins/nvim-lspconfig.lua
vim.g.notify_timeout = 3000 -- lua/plugins/nvim-notify.lua
vim.g.tailing_whitespace=true -- lua/config/{autocmds,keymap}.lua

