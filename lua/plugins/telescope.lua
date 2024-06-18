return {
  -- Fuzzy finder.
  -- The default key bindings to find files will use Telescope's
  -- `find_files` or `git_files` depending on whether the
  -- directory is a git repo.
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- cosmetic shorter
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Buf. (Alt.)",
      },
      { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (fz)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Cmd (fz)" },
      { "<leader><space>", LazyVim.pick("auto"), desc = "Files (fz)" },
    },
  },
}
