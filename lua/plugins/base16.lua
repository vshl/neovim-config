require('packer').use({
  'norcalli/nvim-base16.lua',
  requires = { 'norcalli/nvim.lua' },
  config = function()
    local nvim = require 'nvim'
    local base16 = require 'base16'
    base16(base16.themes[nvim.env.BASE16_THEME or '3024'], true)
  end
})
