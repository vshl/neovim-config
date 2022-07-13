-- packer plugins list
local packer = require('packer')
local use = packer.use

return packer.startup({function()
  use 'wbthomason/packer.nvim'

  -- lua plugins
  require('plugins.notification')
  require('plugins.base16')
  require('plugins.colorizer')
  require('plugins.gitsigns')
  require('plugins.git-conflict')
  require('plugins.bufferline')
  require('plugins.statusline')
  require('plugins.treesitter')
  require('plugins.lsp')
  require('plugins.completion')
  require('plugins.indent-blankline')
  require('plugins.zen-mode')
  require('plugins.terminal')
  require('plugins.comment')
  require('plugins.telescope')
  require('plugins.trouble')
  require('plugins.aerial')
  require('plugins.surround')

  -- other plugins
  require('plugins.other')
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({border = 'single'})
      end
    }
}})
