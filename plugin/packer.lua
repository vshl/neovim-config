-- packer plugins list
local packer = require('packer')
local use = packer.use

return packer.startup({function()
  use 'wbthomason/packer.nvim'

  -- lua plugins
  require('plugins.base16')
  require('plugins.colorizer')
  require('plugins.gitsigns')
  require('plugins.git-conflict')
  require('plugins.bufferline')
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.statusline')
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    after = 'nvim-lspconfig',
    config = function()
      require('plugins.treesitter').config()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    after = 'nvim-treesitter'
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    after = 'nvim-treesitter'
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }
  use {
    'SmiteshP/nvim-gps',
    after = 'nvim-treesitter',
    config = function()
      require('nvim-gps').setup()
    end
  }
  use {
    'neovim/nvim-lspconfig',
    after = { 'cmp-nvim-lsp', 'nvim-lsp-installer' },
    config = function()
      require('plugins.lsp').config()
    end
  }
  use { 'williamboman/nvim-lsp-installer', event = 'BufRead' }
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
      require('plugins.completion').autopairs()
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
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
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    event = 'BufRead'
  }
  use {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    config = function()
      require('plugins.telescope').config()
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'sudormrfbin/cheatsheet.nvim', after = 'telescope.nvim' }
  use { 'stevearc/aerial.nvim' }
  use {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle' },
    config = function()
      require('trouble').setup()
    end
  }
  use {
    'rcarriga/nvim-notify',
    event = 'BufRead',
    config = function()
      require('notify').setup()
      vim.notify = require('notify') 
    end
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
    'jamessan/vim-gnupg'
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
