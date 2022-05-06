require('packer').use({
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
  event = 'BufRead'
})
