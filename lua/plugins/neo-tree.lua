return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- cosmetic shorter
      { "<leader>e", "<leader>fe", desc = "Files (/)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Files (cwd)", remap = true },
    },
  },
}
