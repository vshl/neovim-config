---@diagnostic disable: undefined-global

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- compe

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})
map('i', '<C-Space>', [[<Cmd> compe#complete()]], {expr = true})
map('i', '<CR>', [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {expr = true})
map('i', '<C-e>', [[compe#close('<C-e>')]], {expr = true})
map('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], {expr = true})
map('i', '<C-d>', [[compe#scroll({ 'delta': -4 })]], {expr = true})

-- nvim-tree
map('n', '<C-n>', [[<Cmd> :NvimTreeToggle<CR>]], opt)
map('n', '<leader>r', [[<Cmd> :NvimTreeRefresh<CR>]], opt)
map('n', '<leader>n', [[<Cmd> :NvimTreeFindFile<CR>]], opt)

-- Telescope

-- map("n", "<leader>ff", [[<cmd> Telescope find_files <CR>]], opt)
-- map("n", "<leader>fg", [[<cmd> Telescope live_grep <CR>]], opt)
-- map("n", "<leader>fb", [[<cmd>Telescope buffers<CR>]], opt)
-- map("n", "<leader>fh", [[<cmd>Telescope help_tags<CR>]], opt)
-- map("n", "<leader>ta", [[<cmd>Telescope tags<CR>]], opt)
-- map("n", "<leader>co", [[<cmd> Telescope git_commits <CR>]], opt)

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
