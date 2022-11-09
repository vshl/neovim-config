require('packer').use({
  'kylechui/nvim-surround',
  config = function()
    require('nvim-surround').setup()
  end,
  event = 'BufRead'
})
