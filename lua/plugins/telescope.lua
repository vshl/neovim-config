local use = require('packer').use

use {
  'nvim-telescope/telescope.nvim',
  config = function()
    require('telescope').setup {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = 'top'
          }
        }
      },
      pickers = {
        live_grep = {
          theme = "ivy"
        },
        grep_string = {
          theme = "ivy"
        },
        buffers = {
          theme = "dropdown"
        },
        lsp_document_symbols = {
          theme = "dropdown"
        },
        lsp_workspace_symbols = {
          theme = "dropdown"
        },
        diagnostics = {
          theme = "dropdown"
        },
        keymaps = {
          theme = "dropdown"
        }
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
  end
}
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use { 'nvim-telescope/telescope-file-browser.nvim' }
use { 'sudormrfbin/cheatsheet.nvim', after = 'telescope.nvim' }
