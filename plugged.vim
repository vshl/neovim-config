call plug#begin('~/.config/nvim/plugged')

Plug 'vim-scripts/IndentTab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-slash'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lervag/vimtex', { 'for': 'tex'}
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-lion'
Plug 'justinmk/vim-dirvish'
Plug 'kchmck/vim-coffee-script', { 'for' : 'coffee' }
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'jamessan/vim-gnupg'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim', { 'for' : 'vim' }
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/float-preview.nvim'
Plug 'wellle/tmux-complete.vim'

" lua plugins
Plug 'norcalli/nvim.lua'
Plug 'norcalli/nvim-base16.lua'
Plug 'norcalli/nvim-colorizer.lua'

" neovim specific
Plug 'kassio/neoterm'

" Colorschemes
Plug 'daviesjamie/vim-base16-lightline'

call plug#end()

