return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup({
      theme = 'tokyonight'
    })
  end,
  event = 'BufRead'
}
