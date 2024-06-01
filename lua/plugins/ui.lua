-- uncomment to do nothing here and return an empty spec
-- stylua: ignore
--if true then return {} end

-- change lualine to show code point
return {
  -- lualine: lualine.nvim/lua/lualine/config.lua config
  -- lazyvim: LazyVim/lua/lazyvim/plugins/ui.lua
  -- override lualine_z for a clock display with unicode display
  -- statusline with unicode
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- tighter status line than default
      opts.options.section_separators = ""
      opts.sections.lualine_z = {
        function()
          -- return " " .. os.date("%R")
          -- This is replaced with below
          return "[+U%02B]"
        end,
      }
    end,
  },
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
