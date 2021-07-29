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
    event = 'VimEnter',
    opt = true,
    requires = { { 'junegunn/fzf' } }
  }
  use {
    'tpope/vim-sleuth',
    event = 'BufRead'
  }
  use {
    'tpope/vim-commentary',
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
  use 'tmux-plugins/vim-tmux'
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
end)
