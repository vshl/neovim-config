-- packer plugins list
local packer = require('packer')
local use = packer.use

return packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- lua plugins
  use {
    'norcalli/nvim-base16.lua',
    requires = { 'norcalli/nvim.lua' },
    config = function()
      local nvim = require 'nvim'
      local base16 = require 'base16'
      base16(base16.themes[nvim.env.BASE16_THEME or '3024'], true)
    end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'haml', 'css', 'scss', 'javascript' },
    config = function()
      require('plugins.colorizer').config()
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require('bufferline').setup()
    end
  }
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require('plugins.statusline').config()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    event = 'BufRead',
    config = function()
      require('plugins.treesitter').config()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat',
    after = 'nvim-treesitter'
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    after = 'nvim-treesitter'
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }
  use {
    'kabouzeid/nvim-lspinstall',
    requires = {
      'neovim/nvim-lspconfig',
      event = 'BufRead',
    },
    config = function()
      require('plugins.lsp').config()
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      vim.g.indent_blankline_space_char = '.'
    end
  }
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init()
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.completion').config()
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-nvim-lua', ft = 'lua' },
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
    }
  }
  use {
    'L3MON4D3/LuaSnip',
    requires =  { 'rafamadriz/friendly-snippets', opt = true }
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require('nvim-autopairs').setup()
      require('nvim-autopairs.completion.cmp').setup(
        {
          map_cr = true,
          map_complete = true -- insert () func completion
        }
      )
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' }
  }
  use {
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' }
  }
  use {
    'folke/twilight.nvim',
    after = 'zen-mode.nvim'
  }
  use {
    'akinsho/nvim-toggleterm.lua',
    cmd = { 'ToggleTerm', 'TermExec' },
    config = function()
      require('toggleterm').setup {
        direction = 'float'
      }
    end
  }
  use {
    'b3nj5m1n/kommentary',
    event = 'BufRead'
  }
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires =  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    config = function()
      require('plugins.telescope').config()
    end
  }
  use {
  'sudormrfbin/cheatsheet.nvim',
  after = 'telescope.nvim',
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
  }
}

  -- other plugins
  use {
    'tpope/vim-sleuth',
    event = 'BufRead'
  }
  use {
    'tpope/vim-surround',
    event = 'BufRead'
  }
  use {
    'tpope/vim-repeat',
    event = 'BufRead'
  }
  use {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiff', 'Gclog' }
  }
  use {
    'tmux-plugins/vim-tmux',
    ft = { 'tmux' }
  }
  use {
    'lervag/vimtex',
    ft = { 'tex' },
  }
  use {
    'tommcdo/vim-lion',
    event = 'BufRead'
  }
  use {
    'jamessan/vim-gnupg',
    event = 'BufRead'
  }
  use {
    'kkoomen/vim-doge',
    event = 'BufRead',
    run = function() vim.fn['doge#install']() end
  }
  use {
    'ludovicchabant/vim-gutentags',
    ft = { 'ruby', 'python', 'javascript' }
  }
end)
