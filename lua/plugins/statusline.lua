require('packer').use({
  'nvim-lualine/lualine.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons'
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '' }, right_padding = 2
          }
        },
        lualine_b = { 'branch',
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' }
          }
        },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = {
          {
            'location',
            separator = { right = '', left_padding = 2 }
          }
        }
      },
      inactive_sections = {
        lualine_c = {}
      },
      winbar = {
        lualine_b = {
          {
            'filetype',
            icon_only = true
          }
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '●',
              readonly = ''
            }
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            symbols = { error = ' ', warn = ' ', info = ' ' }
          }
        }
      },
      inactive_winbar = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        }
      },
      extensions = { 'quickfix' }
    }
  end
})
