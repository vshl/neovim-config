require('packer').use({
  'akinsho/nvim-bufferline.lua',
  requires = {
    'kyazdani42/nvim-web-devicons',
    opt = true
  },
  config = function()
    require('bufferline').setup()
  end
})
