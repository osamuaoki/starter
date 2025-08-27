-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ===========================================================================
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_user_" .. name, { clear = true })
end

-- Highlight with color RED for tailspace excluding ones before cursor
vim.cmd.highlight([[Tailspace ctermbg=red guibg=red]])
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("tailing_whitespace"),
  callback = function(event)
    local exclude = {
      "snacks_notif",
      "blink-cmp-menu",
      "blink-cmp-documentation",
      "lazy",
      "mason",
      --"fzf",
      --"noice",
    }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or not vim.g.tailspace then
      -- //            Match nothing
      vim.cmd.match([[Tailspace //]])
    else
      -- /\s\+/        1 or more whitespace character: <Space> and <Tab>
      -- /\%#\@<!/     Matches with zero width if the cursor position does NOT match.
      vim.cmd.match([[Tailspace /\s\+\%#\@<!$/]])
      if vim.g.tailspace_debug and vim.bo[buf].filetype ~= "snacks_notif" then
        vim.notify(("Filetype = %s"):format(vim.bo[buf].filetype))
      end
    end
  end,
})
