-- Toggle autocomplete vs. <C-SPACE> complete
return {
  -- disable comple if vim.g.cmp_disable is true
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require("cmp").setup({
        completion = { autocomplete = not vim.g.autocomplete_disable }
      })
    end,
  },
}
-- * https://github.com/hrsh7th/nvim-cmp/issues/429
-- * https://github.com/hrsh7th/nvim-cmp/issues/261
-- * https://github.com/LazyVim/LazyVim/issues/2981#issuecomment-2065947275
