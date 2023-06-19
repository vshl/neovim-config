return {
  'NvChad/nvim-colorizer.lua',
  ft = { 'haml', 'css', 'scss', 'javascript' },
  config = function()
    require('colorizer').setup {
      filetypes = {
        'haml',
        'scss',
        'css',
        'javascript',
        html = {
          names = false,
        }
      }
    }
  end
}
