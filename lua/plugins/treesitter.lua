local ts = {}

ts.config = function()
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
    }
  }
end

return ts
