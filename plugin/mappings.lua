---@diagnostic disable: undefined-global

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
map('n', '<leader>ld', [[<cmd>Telescope lsp_document_diagnostics<CR>]], opt)
map('n', '<leader>cm', [[<cmd>Telescope commands<CR>]], opt)
map('n', '<leader>km', [[<cmd>Telescope keymaps<CR>]], opt)
map('n', '<leader>co', [[<cmd>Telescope git_commits<CR>]], opt)

-- ZenMode
map('n', '<leader>z', [[<Cmd> ZenMode<CR>]], opt)

-- nvim-toggleterm
map('t', '<Esc>', [[<C-\><C-n>]], opt)
map('n', '<C-t>', [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)
map('i', '<C-t>', [[<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]], opt)

-- trouble.nvim
map('n', '<leader>dw', [[<cmd>TroubleToggle workspace_diagnostics<CR>]], opt)
map('n', '<leader>dd', [[<cmd>TroubleToggle document_diagnostics<CR>]], opt)

-- Misc
map('n', '<leader>s', [[<Cmd>set spell!<CR>]], opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<Esc>', [[<Cmd>:nohlsearch<CR>]], opt)

-- lspsaga
map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opt)
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
map('v', '<leader>ca', '<cmd>Lspsaga range_code_action<CR>', opt)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
map('n', '<C-f>', function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
map('n', '<C-b>', function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
map('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', opt)
map('n', 'gr', '<Cmd>Lspsaga rename<CR>', opt)
-- map('n', 'gd', '<Cmd>Lspsaga preview_definition<CR>', { silent = true })
map('n', '<leader>e', '<Cmd>Lspsaga show_line_diagnostics<CR>', opt)
map('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opt)
map('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opt)
map('n', '<F10>', '<Cmd>LSoutlineToggle<CR>', opt)
