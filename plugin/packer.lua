-- packer plugins list
local packer = require('packer')
local use = packer.use

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return packer.startup({function()
  use 'wbthomason/packer.nvim'

  -- lua plugins
  require('plugins.notification')
  require('plugins.colorizer')
  require('plugins.git')
  require('plugins.statusline')
  require('plugins.treesitter')
  require('plugins.lsp')
  require('plugins.completion')
  require('plugins.indent-blankline')
  require('plugins.zen-mode')
  require('plugins.terminal')
  require('plugins.comment')
  require('plugins.telescope')
  require('plugins.surround')
  require('plugins.colorscheme')
  require('plugins.focus')
  require('plugins.hlslens')

  -- other plugins
  require('plugins.other')

  if packer_bootstrap then
    packer.sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({border = 'single'})
      end
    }
}})
