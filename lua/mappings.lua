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

-- Misc
map('n', '<leader>s', '<CMD>set spell!<CR>', opt)
map('n', '<leader>fs', [[1z=]], opt)
map('n', '<space>c', '<CMD>nohlsearch<CR>', opt)

-- Diffview
map('n', '<leader>do', '<CMD>DiffviewOpen<CR>', opt)
map('n', '<leader>dc', '<CMD>DiffviewClose<CR>', opt)

-- smart-splits
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
map('n', '<A-h>', require('smart-splits').resize_left, opt)
map('n', '<A-j>', require('smart-splits').resize_down, opt)
map('n', '<A-k>', require('smart-splits').resize_up, opt)
map('n', '<A-l>', require('smart-splits').resize_right, opt)
-- moving between splits
map('n', '<C-h>', require('smart-splits').move_cursor_left, opt)
map('n', '<C-j>', require('smart-splits').move_cursor_down, opt)
map('n', '<C-k>', require('smart-splits').move_cursor_up, opt)
map('n', '<C-l>', require('smart-splits').move_cursor_right, opt)
-- swapping buffers between windows
map('n', '<leader><leader>h', require('smart-splits').swap_buf_left, opt)
map('n', '<leader><leader>j', require('smart-splits').swap_buf_down, opt)
map('n', '<leader><leader>k', require('smart-splits').swap_buf_up, opt)
map('n', '<leader><leader>l', require('smart-splits').swap_buf_right, opt)

-- diagnostics
map('n', '[d', vim.diagnostic.goto_prev, opt)
map('n', ']d', vim.diagnostic.goto_next, opt)
map('n', '<space>q', vim.diagnostic.setloclist, opt)

-- bufdelete.nvim
map('n', '<space>d', '<CMD>Bdelete<CR>', opt)
map('n', '<space>w', '<CMD>Bwipeout<CR>', opt)

-- ts-node-action
map('n', '<space>n', require("ts-node-action").node_action, { desc = "Trigger Node Action" })

-- rest.nvim
map('n', '<space>r', '<Plug>RestNvim', opt)
map('n', '<leader>rp', '<Plug>RestNvim', opt)
map('n', '<leader>rl', '<Plug>RestNvimLast', opt)

-- neo-tree
map('n', '<leader>\\', '<CMD>Neotree reveal<CR>', opt)

-- session
map('n', '<C-s>', require('auto-session.session-lens').search_session, opt)

-- terminal.nvim
local term_map = require("terminal.mappings")
map({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
map("n", "<leader>to", term_map.toggle)
map("n", "<leader>tO", term_map.toggle({ open_cmd = "enew" }))
map("n", "<leader>tr", term_map.run)
map("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
map("n", "<leader>tk", term_map.kill)
map("n", "<leader>t]", term_map.cycle_next)
map("n", "<leader>t[", term_map.cycle_prev)
map("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
map("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
map("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
map("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
map("n", "<leader>tf", term_map.move({ open_cmd = "float" }))

map('n', '<A-g>', '<CMD>Lazygit<CR>')
map('n', '<A-i>', '<CMD>TermToggle<CR>')
map('t', '<C-\\>', '<C-\\><C-n>')
map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')
