return {
  'rest-nvim/rest.nvim',
  dependencies = 'plenary.nvim',
  ft = 'http',
  config = function()
    require('rest-nvim').setup()
  end
}
