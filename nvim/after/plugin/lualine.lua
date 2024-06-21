local lualine = require('lualine')

lualine.setup {
  options = {
    theme = 'tokyonight',
    section_separators = { left = '', right = '' },
    -- theme = 'catppuccin',
    -- theme = 'ayu_mirage',
  },
  sections = {
    -- lualine_a = {},
    lualine_a = { 'branch' },
    lualine_b = {
      {
        function()
          local key = require("grapple").name_or_index()
          return "  [" .. key .. "]"
        end,
        cond = require("grapple").exists,
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },

    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      -- 'encoding',
      'filetype'
    },
    -- lualine_y = {},
    lualine_z = {}
  },
}
