local use = require('packer').use

use {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' }
}
use {
  'folke/twilight.nvim',
  after = 'zen-mode.nvim'
}
