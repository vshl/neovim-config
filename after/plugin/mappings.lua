local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opt = {}


-- Fzf-lua

map('n', '<c-p>', "<CMD>lua require('fzf-lua').files()<CR>", opt)
map('n', '<leader>lg', "<CMD>lua require('fzf-lua').live_grep_native({ continue_last_search = true })<CR>", opt)
map('n', '<leader>lb', "<CMD>lua require('fzf-lua').live_grep_glob({ continue_last_search = true })<CR>", opt)
map('n', '<leader>gs', "<CMD>lua require('fzf-lua').grep()<CR>", opt)
map('n', '<leader>gw', "<CMD>lua require('fzf-lua').grep_cword()<CR>", opt)
map('n', '<leader>bf', "<CMD>lua require('fzf-lua').buffers()<CR>", opt)
map('n', '<leader>ds', "<CMD>lua require('fzf-lua').lsp_document_symbols()<CR>", opt)
map('n', '<leader>ws', "<CMD>lua require('fzf-lua').lsp_workspace_symbols()<CR>", opt)
map('n', '<leader>ld', "<CMD>lua require('fzf-lua').diagnostics_document()<CR>", opt)
map('n', '<leader>lw', "<CMD>lua require('fzf-lua').diagnostics_workspace()<CR>", opt)
map('n', '<leader>cm', "<CMD>lua require('fzf-lua').autocmds()<CR>", opt)
map('n', '<leader>km', "<CMD>lua require('fzf-lua').keymaps()<CR>", opt)
map({ "n", "v", "i" }, "<C-x><C-f>",
  function() require("fzf-lua").complete_path() end,
  { silent = true, desc = "Fuzzy complete path" })

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

-- nvim-toggleterm
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  map('t', '<C-w>', [[<C-\><C-n><C-w><C-c>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

-- toggleterm lazygit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

map('n', '<A-g>', '<cmd>lua _lazygit_toggle()<CR>')

-- harpoon
local harpoon = require('harpoon')
harpoon:setup()

map("n", "<leader>ha", function() harpoon:list():append() end)
map("n", "<leader>gh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", '<space>j', function() harpoon:list():prev() end)
map("n", '<space>k', function() harpoon:list():next() end)

-- oil.nvim
map('n', '<A-->', '<CMD>Oil<CR>')
