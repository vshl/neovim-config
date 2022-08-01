require('packer').use({
  'glepnir/zephyr-nvim',
  config = function()
    require('zephyr')
  end
})
