require('packer').use({
  'TimUntersberger/neogit',
  config = function()
    require('neogit').setup()
  end
})
