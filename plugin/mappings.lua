---@diagnostic disable: undefined-global

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- nvim-tree
map('n', '<C-n>', [[<Cmd> :NvimTreeToggle<CR>]], opt)
map('n', '<leader>r', [[<Cmd> :NvimTreeRefresh<CR>]], opt)
map('n', '<leader>n', [[<Cmd> :NvimTreeFindFile<CR>]], opt)

-- Telescope

map('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]], opt)
map('n', '<leader>fg', [[<cmd>Telescope live_grep<CR>]], opt)
map('n', '<leader>fb', [[<cmd>Telescope buffers<CR>]], opt)
map('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]], opt)
map('n', '<leader>ds', [[<cmd>Telescope lsp_document_symbols<CR>]], opt)
map('n', '<leader>ws', [[<cmd>Telescope lsp_workspace_symbols<CR>]], opt)
map('n', '<leader>ld', [[<cmd>Telescope lsp_document_diagnostics<CR>]], opt)
map('n', '<leader>cm', [[<cmd>Telescope commands<CR>]], opt)
map('n', '<leader>km', [[<cmd>Telescope keymaps<CR>]], opt)

-- nvim-dap
-- map('n', '<F5>', [[<Cmd> lua require'dap'.continue()<CR>]], opt)
-- map('n', '<F10>', [[<Cmd> lua require'dap'.step_over()<CR>]], opt)
-- map('n', '<F11>', [[<Cmd> lua require'dap'.step_into()<CR>]], opt)
-- map('n', '<F12>', [[<Cmd> lua require'dap'.step_out()<CR>]], opt)
-- map('n', '<leader>b', [[<Cmd> lua require'dap'.toggle_breakpoint()<CR>]], opt)
-- map('n', '<leader>B', [[<Cmd> lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], opt)
-- map('n', '<leader>lp', [[<Cmd> lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], opt)
-- map('n', '<leader>dr', [[<Cmd> lua require'dap'.repl.open()<CR>]], opt)
-- map('n', '<leader>dl', [[<Cmd> lua require'dap'.run_last()<CR>]], opt)

-- ZenMode
map('n', '<leader>z', [[<Cmd> ZenMode<CR>]], opt)

-- nvim-toggleterm
map('t', '<Esc>', [[<C-\><C-n>]], opt)
map('n', '<C-t>', [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)
map('i', '<C-t>', [[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)
vim.cmd[[ command! -nargs=1 TE TermExec cmd=<q-args> ]]

-- Misc
map('n', '<leader>s', [[<Cmd>set spell!<CR>]], opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<Esc>', [[<Cmd>:nohlsearch<CR>]], opt)
