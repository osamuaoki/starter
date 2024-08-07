-- change lualine to show code point
return {
  -- Initializable notify delay --- read it via `<leader>snh` if you miss
  -- Cool menu animation slide out
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.timeout = vim.g.notify_timeout and vim.g.notify_timeout or 3000
      opts.stages = "fade_in_slide_out"
    end,
  },
}
