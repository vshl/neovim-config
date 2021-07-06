---@diagnostic disable: undefined-global
-- install packer.nvim retroactively
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require 'plugins'
require 'mappings'

-- base16.lua
local nvim = require 'nvim'
local base16 = require 'base16'
base16(base16.themes[nvim.env.BASE16_THEME or '3024'], true)
