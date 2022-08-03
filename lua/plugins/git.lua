require('packer').use({
  'TimUntersberger/neogit',
  cmd = { 'Neogit' },
  config = function()
    require('neogit').setup()
  end
})
