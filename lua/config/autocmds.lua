-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ===========================================================================
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_user_" .. name, { clear = true })
end
-- Setup to color READ for tailspace excluding ones before cursor
vim.cmd.highlight([[Tailspace ctermbg=red guibg=red]])
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("tailing_whitespace"),
  callback = function(event)
    local exclude = { "dashboard", "help", "lazy" , "mason", "WhichKey", "noice", "fzf" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or
        not vim.g.tailspace then
      vim.cmd.match([[Tailspace //]])
    else
      -- \s\+     1 or more whitespace character: <Space> and <Tab>
      -- \%#\@<!  Matches with zero width if the cursor position does NOT match.
      vim.cmd.match([[Tailspace /\s\+\%#\@<!$/]])
    end
  end,
})
