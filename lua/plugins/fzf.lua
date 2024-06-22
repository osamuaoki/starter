---@class FzfLuaOpts: lazyvim.util.pick.Opts
---@field cmd string?

return {
  "ibhagwan/fzf-lua",
    -- cosmetic shorter
  keys = {
    {
      "<leader>,",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buf.",
    },
    { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (/)" },
    { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Cmd Hist." },
    { "<leader><space>", LazyVim.pick("auto"), desc = "Files (/)" },
    -- find
    { "<leader>xf", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List (FzfLua)" },
    { "<leader>xF", "<cmd>FzfLua loclist<cr>", desc = "Location List (FzfLua)" },
    { "<leader>xh", "<cmd>FzfLua quickfix_stack<cr>", desc = "Quickfix Stack (FzfLua)" },
  },
}
