---@diagnostic disable: undefined-global

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
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
map('n', '<leader>ld', [[<cmd>Telescope lsp_document_diagnostics<CR>]], opt)
map('n', '<leader>cm', [[<cmd>Telescope commands<CR>]], opt)
map('n', '<leader>km', [[<cmd>Telescope keymaps<CR>]], opt)

-- ZenMode
map('n', '<leader>z', [[<Cmd> ZenMode<CR>]], opt)

-- nvim-toggleterm
map('t', '<Esc>', [[<C-\><C-n>]], opt)
map('n', '<C-t>', [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)
map('i', '<C-t>', [[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)
vim.cmd[[ command! -nargs=1 TE TermExec cmd=<q-args> ]]

-- trouble.nvim
map('n', '<leader>dw', [[<cmd>TroubleToggle workspace_diagnostics<CR>]], opt)
map('n', '<leader>dd', [[<cmd>TroubleToggle document_diagnostics<CR>]], opt)

-- Misc
map('n', '<leader>s', [[<Cmd>set spell!<CR>]], opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<Esc>', [[<Cmd>:nohlsearch<CR>]], opt)
map('n', '<F10>', [[<Cmd>SymbolsOutline<CR>]], opt)
