-- packer plugins list
local packer = require('packer')
local use = packer.use

return packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- lua plugins
  use 'norcalli/nvim.lua'
  use 'norcalli/nvim-base16.lua'
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'haml', 'css', 'scss', 'javascript' },
    config = [[ require('colorizer').setup { 'haml', 'css', 'scss', 'javascript', html = { names = false} }]],
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
    'famiu/feline.nvim',
    config = function()
      require('feline').setup()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = function()
      require('plugins.treesitter').config()
    end
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
    event = 'BufRead'
  }
  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    wants = 'LuaSnip',
    config = function()
      require('plugins.completion').config()
    end,
    requires = {
      {
        'L3MON4D3/LuaSnip',
        event = 'InsertCharPre',
        wants = 'friendly-snippets',
        config = function()
          require("plugins.completion").snippets()
        end
      },
      {
        'rafamadriz/friendly-snippets',
        after = 'LuaSnip'
      }
    }
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-compe',
    config = function()
      require('nvim-autopairs').setup()
      require('nvim-autopairs.completion.compe').setup(
        {
          map_cr = true,
          map_complete = true -- insert () func completion
        }
      )
    end
  }
  use {
    'onsails/lspkind-nvim',
    event = 'InsertCharPre',
    config = function()
      require('lspkind').init()
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

  -- other plugins
  use {
    'junegunn/fzf.vim',
    cmd = { 'Files', 'Buffers', 'Tags', 'Lines', 'BTags', 'Rg' },
    opt = true,
    requires = {
      {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
      }
    }
  }
  use 'junegunn/vim-slash'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiff', 'Gclog' }
  }
  use 'tmux-plugins/vim-tmux'
  use {
    'lervag/vimtex',
    ft = { 'tex' },
  }
  use 'tommcdo/vim-lion'
  use 'jamessan/vim-gnupg'
  -- use 'kassio/neoterm'
end)
