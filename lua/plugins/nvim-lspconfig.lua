--if true then return {} end
-- initial set for linlay_hints via vim.g.inlay_hint_disable
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        opts.inlay_hints.enabled = not vim.g.inlay_hint_disable
        opts.servers = {
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            -- ---@type LazyKeysSpec[]
            -- keys = {},
            settings = {
              Lua = {
                diagnostics  = {
                  globals = {"vim", "LazyVim"},
                },
              },
            },
          },
        }
    end,
  },
}
