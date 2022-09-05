require('packer').use({
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup {
      options = {
        dim_inactive = true
      }
    }
    vim.cmd [[colorscheme nordfox]]
  end,
  run = ':NightfoxCompile'
})
