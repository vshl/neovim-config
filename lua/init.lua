-- nvim-colorizer
require 'colorizer'.setup {
  'haml';
  'css';
  'scss';
  'javascript';
  html = { names = false; }
}

-- base16.lua
nvim = require 'nvim'
local base16 = require 'base16'
base16(base16.themes[nvim.env.BASE16_THEME or '3024'], true)
