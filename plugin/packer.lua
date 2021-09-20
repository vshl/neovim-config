-- packer plugins list
local packer = require('packer')
local use = packer.use

return packer.startup({function()
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
    event = 'BufRead',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
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
    'shadmansaleh/lualine.nvim',
    config = function()
      require('plugins.statusline').config()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    after = 'nvim-lspconfig',
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
    'neovim/nvim-lspconfig',
    after = { 'cmp-nvim-lsp', 'nvim-lspinstall' },
    config = function()
      require('plugins.lsp').config()
    end
  }
  use { 'kabouzeid/nvim-lspinstall', after = 'nvim-cmp' }
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    wants = { 'LuaSnip', 'lspkind-nvim' },
    config = function()
      require('plugins.completion').config()
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        opt = true,
        wants = { 'friendly-snippets' },
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
        requires =  { 'rafamadriz/friendly-snippets', opt = true }
      },
      {
        'onsails/lspkind-nvim',
        opt = true,
        config = function()
          require('lspkind').init()
        end
      }
    }
  }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-calc', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua', ft = 'lua', after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } }
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
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      vim.g.indent_blankline_space_char = '.'
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
    after = 'telescope.nvim'
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
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({border = 'single'})
      end
    }
}})
