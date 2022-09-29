require('packer').use({
  'nvim-lualine/lualine.nvim',
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
        lualine_a = { 'mode' },
        lualine_b = { 'branch',
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' }
          }
        },
        lualine_c = {
          {
            'filename',
            symbols = {
              modified = '●',
              readonly = ''
            },
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            symbols = { error = ' ', warn = ' ', info = ' ' }
          }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '●',
              readonly = ''
            },
          }
        }
      },
      extensions = { 'quickfix' }
    }
  end
})
