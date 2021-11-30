---@diagnostic disable: undefined-global
-- install packer.nvim retroactively
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers
vim.o.hidden = true

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

-- Identation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 4
vim.o.textwidth = 120
vim.o.modeline = true

-- ColorColumn
vim.opt.colorcolumn:append('+1')

-- colorscheme
vim.cmd [[colorscheme catppuccin]]
