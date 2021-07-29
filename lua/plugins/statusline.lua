local M = {}

M.config = function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch',
        {
          'diff',
          symbols = {added = ' ', modified = ' ', removed = ' '}
        }
      },
      lualine_c = { 'filename',
        {
          'diagnostics',
          sources = {'nvim_lsp'},
          symbols = {error = ' ', warn = ' ', info = ' '}
        }
      },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    extensions = { 'quickfix', 'fugitive', 'nvim-tree' }
  }
end

return M
