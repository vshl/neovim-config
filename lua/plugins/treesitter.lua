local use = require('packer').use

use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  after = 'nvim-lspconfig',
  config = function()
    local tsconfig = require('nvim-treesitter.configs')
    tsconfig.setup {
      ensure_installed = { 'ruby', 'lua', 'bash', 'javascript', 'json', 'yaml', 'python', 'scss', 'html', 'comment' },
      ignore_install = {},
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          }
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ["df"] = "@function.outer",
            ["dF"] = "@class.outer",
          }
        }
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
        smart_rename = {
          enable = true,
          keymaps = { smart_rename = "srn" }
        },
        navigation = {
          enable = true,
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        }
      },
      endwise = {
        enable = true,
      },
    }
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
