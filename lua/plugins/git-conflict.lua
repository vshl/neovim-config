require('packer').use({
  'akinsho/git-conflict.nvim',
  config = function ()
    require('git-conflict').setup()
  end
})
