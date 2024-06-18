-- shorter menu
--
return {
  -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  -- Replace or add "+..." entries
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        mode = { "n", "v" },
        ["<leader>t"] = { name = "+terminal" }, -- cosmetic (consolidate)
        ["<leader>q"] = { name = "+quit/rest" }, -- cosmetic (explicit)
        ["<leader>x"] = { name = "+quickfix" }, -- cosmetic (shorter)
        ["g"] = { name = "+goto/mod" }, -- cosmetic (explicit)
      },
    },
  },
}
