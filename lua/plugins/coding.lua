-- uncomment to do nothing here and return an empty spec
-- stylua: ignore
--if true then return {} end

-- add vim.g.cmp_disable support
return {
  -- disable comple if vim.g.cmp_disable is true
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require("cmp").setup({
        -- * https://github.com/hrsh7th/nvim-cmp/issues/429
        -- * https://github.com/hrsh7th/nvim-cmp/issues/261
        -- function source copied from https://github.com/hrsh7th/nvim-cmp.git and modified
        -- path: nvim-cmp/lua/cmp/config/default.lua , section: enabled = function() ... end
        enabled = function()
          local disabled = false
          disabled = disabled or (vim.api.nvim_get_option_value("buftype", {buf=0}) == "prompt")
          disabled = disabled or (vim.fn.reg_recording() ~= '')
          disabled = disabled or (vim.fn.reg_executing() ~= '')
          -- the following is the modification to accomodate global completion toggle
          disabled = disabled or vim.g.cmp_disable
          -- if any one of the above is true, return false / otherwise return false
          return not disabled
        end,
      })
    end,
  },
}
-- approach mentioned in https://github.com/LazyVim/LazyVim/issues/2981#issuecomment-2065947275
-- requires to press <C-SPACE> everytime to get complete sugesstion
