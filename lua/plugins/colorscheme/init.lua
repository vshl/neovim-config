require('packer').use({
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').load()
  end
})
