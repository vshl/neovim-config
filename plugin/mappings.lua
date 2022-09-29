local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opt = {}


-- Telescope

map('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]], opt)
map('n', '<leader>lg', [[<cmd>Telescope live_grep<CR>]], opt)
map('n', '<leader>gs', [[<cmd>Telescope grep_string<CR>]], opt)
map('n', '<leader>bf', [[<cmd>Telescope buffers<CR>]], opt)
map('n', '<leader>fb', [[<cmd>Telescope file_browser<CR>]], opt)
map('n', '<leader>fp', [[<cmd>lua require 'telescope'.extensions.file_browser.file_browser({path = vim.fn.expand('%:p:h')})<CR>]], opt)
map('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]], opt)
map('n', '<leader>ds', [[<cmd>Telescope lsp_document_symbols<CR>]], opt)
map('n', '<leader>ws', [[<cmd>Telescope lsp_workspace_symbols<CR>]], opt)
map('n', '<leader>ld', [[<cmd>Telescope diagnostics buffnr=0<CR>]], opt)
map('n', '<leader>lw', [[<cmd>Telescope diagnostics<CR>]], opt)
map('n', '<leader>cm', [[<cmd>Telescope commands<CR>]], opt)
map('n', '<leader>km', [[<cmd>Telescope keymaps<CR>]], opt)
map('n', '<leader>gc', [[<cmd>Telescope git_commits<CR>]], opt)

-- ZenMode
map('n', '<leader>z', [[<Cmd> ZenMode<CR>]], opt)

-- FTerm.nvim
map('n', '<A-i>', '<CMD>FTermToggle<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>FTermToggle<CR>')

-- Misc
map('n', '<leader>s', [[<Cmd>set spell!<CR>]], opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<Esc>', [[<Cmd>:nohlsearch<CR>]], opt)

-- Diffview
map('n', '<leader>do', '<CMD>DiffviewOpen<CR>', opt)
map('n', '<leader>dc', '<CMD>DiffviewClose<CR>', opt)

-- focus.nvim
map('n', '<c-l>', ':FocusSplitNicely<CR>', opt)
map('n', '<A-f>', ':FocusToggle<CR>', opt)
local focusmap = function(direction)
    map('n', "<A-" ..direction..">", ":lua require'focus'.split_command('"..direction.."')<CR>", opt)
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
