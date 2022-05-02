require('packer').use({
  'norcalli/nvim-colorizer.lua',
  ft = { 'haml', 'css', 'scss', 'javascript' },
  config = function()
    require('colorizer').setup {
      'haml';
      'css';
      'scss';
      'javascript';
      html = {
        names = false;
      }
    }
  end
})
