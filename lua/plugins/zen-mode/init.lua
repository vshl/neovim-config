local use = require('packer').use

use {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' },
  config = function()
    require('zen-mode').setup {
      plugins = {
        twilight = false,
      }
    }
  end
}
use {
  'folke/twilight.nvim',
  after = 'zen-mode.nvim'
}
