return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'nvim-navic',
    'nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup()
  end
}
