---@diagnostic disable: undefined-global

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true

-- Clipboard
if vim.fn.has('unix') then
  vim.o.clipboard = 'unnamedplus'
else
  vim.o.clipboard = 'unnamed'
end

-- Completion
vim.opt.shortmess:append('c')
vim.opt.completeopt= { 'menu', 'menuone', 'noselect' }

-- Cursorline
vim.o.cursorline = true

-- Formatting
vim.o.expandtab = true
vim.o.textwidth = 120

-- ColorColumn
vim.opt.colorcolumn:append('+1')
