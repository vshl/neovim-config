require('packer').use({
  'nvim-lualine/lualine.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons'
  },
  config = function()
    local navic = require('nvim-navic')
    -- Lsp server name .
    local function server_name()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { 'buffers' },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = {}
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '●',
              readonly = ''
            },
          }
        },
        lualine_b = {
          {
            'filetype',
            icon_only = true
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            on_click = function()
              vim.cmd('Telescope diagnostics buffnr=0')
            end
          }
        },
        lualine_c = {
          { navic.get_location, cond = navic.is_available }
        },
        lualine_x = {
          {
            server_name,
            icon = { ' ', color = { gui = 'bold' } }
          }
        },
        lualine_y = {
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' }
          }
        },
        lualine_z = { 'branch' }
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
