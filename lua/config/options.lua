-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set starting mode of modified LazyVim (overriding upstream LazyVim defaults)

vim.opt.timeoutlen = 200 -- Timeoutlen (default 1000, AstroNvim 500, LazyVim 300) (:h 'tm)

-- native Nvim options
vim.opt.number = false -- Relative line numbers (:h 'number)
vim.opt.relativenumber = false -- Relative line numbers (:h 'relativenumber)
vim.opt.background = dark -- To be safe side

-- conform.nvim plugin global variable (module provided)
vim.g.autoformat = false -- no autoformat on save
--   * false: Disable
--   * true:  Enable

-- mini.pairs plugin global variable (module provided)
--   * true:  Disable
--   * false: Enable
vim.g.minipairs_disable = true -- no input pairs '' "" () [] {} ``

-- disable editorconfig (Last resort, use .editorconfig instead)
--vim.g.editorconfig = false

-- diagonostic disabled
vim.diagnostic.enable(false)
-- diagonostic enabled
--vim.diagnostic.enable(true)

-- ===========================================================================
-- global variables introduced by osamu to set initial behavior
-- ===========================================================================
-- use g:*_disable if possible
--   * true:  Disable functionality
--   * false: Enable functionality (nil=false)

-- nvim-cmp plugin (via lua/plugins/coding.lua) state variable
vim.g.cmp_disable = true -- No complete
vim.g.cmp_disable_alt = true -- No complete (Alt)

-- notification
vim.g.notify_timeout = 5000

-- Search INITIALIZER in plugins/*
