-- uncomment to do nothing here and return an empty spec
-- stylua: ignore
--if true then return {} end

-- change lualine to show code point
return {
  -- lualine: lualine.nvim/lua/lualine/config.lua config
  -- lazyvim: LazyVim/lua/lazyvim/plugins/ui.lua
  -- override lualine_z for a clock display with [filetype][unicode] display
  -- statusline with unicode
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- tighter status line than default
      opts.options.section_separators = ""
      opts.sections.lualine_z = {
        function()
          -- original code
          ---- return " " .. os.date("%R")
          -- osamu's mod to diaplay [filetype][unicode]
          return "%y[+U%02B]"
        end,
      }
    end,
  },
}
