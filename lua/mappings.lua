local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opt = {}


-- Telescope

map('n', '<c-p>', '<CMD>Telescope find_files<CR>', opt)
map('n', '<leader>lg', '<CMD>Telescope live_grep<CR>', opt)
map('n', '<leader>gs', '<CMD>Telescope grep_string<CR>', opt)
map('n', '<leader>bf', '<CMD>Telescope buffers<CR>', opt)
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>', opt)
map('n', '<leader>fp',
  "<CMD>lua require 'telescope'.extensions.file_browser.file_browser({path = vim.fn.expand('%:p:h')})<CR>", opt)
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opt)
map('n', '<leader>ds', '<CMD>Telescope lsp_document_symbols<CR>', opt)
map('n', '<leader>ws', '<CMD>Telescope lsp_workspace_symbols<CR>', opt)
map('n', '<leader>ld', '<CMD>Telescope diagnostics buffnr=0<CR>', opt)
map('n', '<leader>lw', '<CMD>Telescope diagnostics<CR>', opt)
map('n', '<leader>cm', '<CMD>Telescope commands<CR>', opt)
map('n', '<leader>km', '<CMD>Telescope keymaps<CR>', opt)
map('n', '<leader>gc', '<CMD>Telescope git_commits<CR>', opt)

-- ZenMode
map('n', '<leader>z', '<CMD>ZenMode<CR>', opt)
map('n', '<leader>zt', '<CMD>Twilight<CR>', opt)

-- FTerm.nvim
map('n', '<A-i>', '<CMD>FTermToggle<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>FTermToggle<CR>')

-- Misc
map('n', '<leader>s', '<CMD>set spell!<CR>', opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<space>c', '<CMD>nohlsearch<CR>', opt)

-- Diffview
map('n', '<leader>do', '<CMD>DiffviewOpen<CR>', opt)
map('n', '<leader>dc', '<CMD>DiffviewClose<CR>', opt)

-- focus.nvim
map('n', '<c-l>', '<CMD>FocusSplitNicely<CR>', opt)
map('n', '<A-f>', '<CMD>FocusToggle<CR>', opt)
local focusmap = function(direction)
  map('n', "<A-" .. direction .. ">", ":lua require'focus'.split_command('" .. direction .. "')<CR>", opt)
end
-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')

-- diagnostics
map('n', '[d', vim.diagnostic.goto_prev, opt)
map('n', ']d', vim.diagnostic.goto_next, opt)
map('n', '<space>q', vim.diagnostic.setloclist, opt)

-- bufdelete.nvim
map('n', '<space>d', '<CMD>Bdelete<CR>', opt)
map('n', '<space>w', '<CMD>Bwipeout<CR>', opt)

-- ts-node-action
map('n', '<space>n', require("ts-node-action").node_action, { desc = "Trigger Node Action" })
