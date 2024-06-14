-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set starting mode of modified LazyVim (overriding upstream LazyVim defaults)

vim.opt.timeoutlen = 200 -- Timeoutlen (default 1000, AstroNvim 500, LazyVim 300) (:h 'tm)

-- native Nvim options
vim.opt.number = false -- Relative line numbers (:h 'number)
vim.opt.relativenumber = false -- Relative line numbers (:h 'relativenumber)
vim.opt.background = "dark" -- To be safe side

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
--vim.diagnostic.enable(false)
-- diagonostic enabled
vim.diagnostic.enable(true)

-- ===========================================================================
-- global variables introduced by osamu to set initial behavior
-- ===========================================================================
-- use g:*_disable if possible
--   * true:  Disable functionality
--   * false: Enable functionality (nil=false)

-- nvim-cmp plugin (via lua/plugins/coding.lua) state variable
vim.g.autocomplete_disable = true -- No Autocomplete

-- notification
vim.g.notify_timeout = 3000

vim.g.inlay_hint_disable = true

-- ===========================================================================
-- global variables introduced by osamu to set initial behavior
-- -- ===========================================================================
vim.opt.list = true
vim.opt.listchars = { eol = "¶", tab = "⇄ ", extends = "↦", precedes = "↤", nbsp = "␣" }
--vim.o.listchars = "eol:¶,tab:⇄ ,extends:↦,precedes:↤,nbsp:␣"
vim.opt.viminfo = "!,'100,<5000,s100,h" -- :h 'vi -- bigger copy buffer etc.
vim.opt.spell = true -- :h 'spell
vim.opt.spelllang = "en_us,cjk" -- :h 'spl -- english spell, ignore CJK
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.errorbells = false -- :h 'eb
vim.opt.visualbell = false -- :h 'vb

-- """ Pick "colorscheme" from blue darkblue default delek desert elflord evening
-- """ habamax industry koehler lunaperche morning murphy pablo peachpuff quiet ron
-- """ shine slate torte zellner
-- "colorscheme industry
