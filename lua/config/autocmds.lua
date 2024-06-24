-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ===========================================================================
-- Other setting commands
-- """ highlight tailing spaces except when typing as red
-- If colorscheme reset these, move these to autocmds
vim.cmd.highlight([[TailingWhitespaces ctermbg=red guibg=red]])
-- """ \s\+     1 or more whitespace character: <Space> and <Tab>
-- """ \%#\@<!  Matches with zero width if the cursor position does NOT match.
if vim.g.tailing_whitespace then
  vim.cmd.match([[TailingWhitespaces /\s\+\%#\@<!$/]])
end

-- Let qf.nvim take over
-- -- Display quickfix list upon its creation
-- vim.api.nvim_create_autocmd("QuickFixCmdPost", {
--   callback = function()
--     --vim.cmd([[copen]])  -- basic design
--     vim.cmd([[Trouble qflist open]])  -- with trouble (nice design)
--     --vim.cmd([[Telescope quickfix]])  -- with telescope (UI down-selectable)
--     -- nvim-bqf also provides UI down-selectable feature if installed
--   end,
-- })
