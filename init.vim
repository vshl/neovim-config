" lua/init.lua
lua require 'init'

" Mouse support
set mouse=a

" Ignore case and smart case in ex mode
set ignorecase
set smartcase

" fold method
set foldmethod=indent
set foldlevelstart=99

" Background
set background=dark

" GUI options
" if has('gui_running')
"   :set guifont=Monaco:h11
" endif

" Line numbers
set number
set relativenumber

" completion
set shortmess+=c
set completeopt=menuone,noselect

augroup markdown
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Highlight the current line
set cursorline

" Column wrap at column 80
set colorcolumn=+1

" Show whitespaces
if &encoding == 'utf-8'
  set list listchars=tab:▸\ ,eol:¬,trail:.
endif

" Set clipboard
set clipboard=unnamed

" Identation

set expandtab shiftwidth=2 softtabstop=2 tabstop=4 textwidth=120
set modeline

" Set inccommand
set inccommand=nosplit

" Set nvim to true color
if has('termguicolors')
  set termguicolors
endif

"################################
" Plugins start here
"################################

" Ultisnips
let g:UltiSnipsJumpForwardTrigger	= "<c-b>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-z>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Neoterm
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '20'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f11> :TREPLSendLine<cr>
vnoremap <silent> <f11> :TREPLSendSelection<cr>

" open and hide/close all terminals
nnoremap <silent> ,to :Ttoggle<CR>
" clear terminal
nnoremap <silent> ,tl :Tclear!<CR>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :Tkill<CR>

" Additional keybindings
"
nnoremap <silent> <leader>dv :Dirvish<CR>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Git commands
command! -nargs=+ Tg :T git <args>

tnoremap <Esc> <C-\><C-n>
" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Fix spelling
nnoremap <leader>fs 1z=

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * call system(s:clip, join(v:event.regcontents, "\<CR>"))
  augroup END
end

" indent_blankline
let g:indent_blankline_space_char = '.'

