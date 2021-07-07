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
    requires = {
      'nvim-lua/plenary.nvim',
      opt = true
    },
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
      require('treesitter').config()
    end
  }
  use {
    'kabouzeid/nvim-lspinstall',
    requires = {
      'neovim/nvim-lspconfig',
      event = 'BufRead',
    },
    config = function()
      require('lsp').config()
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead'
  }
  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    config = function()
      require('completion').config()
    end,
    wants = { "LuaSnip" },
    requires = {
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        event = "InsertCharPre",
        config = function()
          require("completion").snippets()
        end
      },
      "rafamadriz/friendly-snippets"
    }
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-compe',
    config = function()
      require('nvim-autopairs').setup()
      require("nvim-autopairs.completion.compe").setup(
        {
          map_cr = true,
          map_complete = true -- insert () func completion
        }
      )
    end
  }
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init()
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    requires = {
      'nvim-lua/popup.nvim'
    },
    config = function ()
      require('telescope-nvim').config()
    end
  }

  -- other plugins
  use 'junegunn/vim-slash'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'tmux-plugins/vim-tmux'
  use {
    'lervag/vimtex',
    ft = { 'tex' },
  }
  use 'tommcdo/vim-lion'
  use 'justinmk/vim-dirvish'
  use 'jamessan/vim-gnupg'
  use 'kassio/neoterm'
end)
