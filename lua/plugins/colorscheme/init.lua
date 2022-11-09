require('packer').use({
  'catppuccin/nvim',
  as = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavor = 'mocha',
      dim_inactive = {
        enabled = true
      },
      integrations = {
        treesitter_context = true,
        ts_rainbow = true,
        navic = {
          enabled = true
        }
      }
    }
    vim.cmd('colorscheme catppuccin')
  end
})
