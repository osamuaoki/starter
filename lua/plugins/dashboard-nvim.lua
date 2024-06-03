-- dummy plugin spec, do nothing here and return an empty spec
-- stylua: ignore
if true then return {} end

-- deactivate dashboard-nvim normally installed by LazyVim for opening display
-- https://github.com/LazyVim/LazyVim/issues/1946
-- https://github.com/folke/lazy.nvim/issues/1038
return {
  -- disable dashboard-nvim
  { "nvimdev/dashboard-nvim", enabled = false },
  {
    "LazyVim/LazyVim",
    init = function()
      -- override lazyvim.config.options, the it empties the startscreen:
      vim.opt.shortmess:append({ W = true, I = false, c = true })
    end,
  },
  -- After some experiments, I droped entry for modules containing event=...
  -- which use UIEnter to prevent complication.  So far, no issues encountered.
}
