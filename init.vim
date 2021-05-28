" vim-plug
if has('win32')
  source $HOME/appdata/local/nvim/plugged.vim
else
  source $HOME/.config/nvim/plugged.vim
endif

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

" omnicompletion
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
" for lightline
set laststatus=2
set ttimeoutlen=50
" This is regular lightline configuration, we just added
" 'linter_warnings', 'linter_errors' and 'linter_ok' to
" the active right panel. Feel free to move it anywhere.
" `component_expand' and `component_type' are required.
"
" for more info on how this works, see lightline documentation.
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

" delimitMate
let g:delimitMate_expand_cr = 1

" Ultisnips
let g:UltiSnipsJumpForwardTrigger	= "<c-b>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-z>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" tmuxline preset
let g:tmuxline_preset = {
      \'a'    : '#I',
      \'win'  : '#W',
      \'cwin' : '#W',
      \'z'    : '#{battery_icon} #{battery_percentage}' }
let g:tmuxline_powerline_separators=0

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

" LanguageClient (Language Server Protocol)
" Required for operations modifying multiple buffers like rename.

" vim-lsp
set hidden
let g:lsp_virtual_text_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>df <plug>(lsp-document-format)
    vmap <buffer> <leader>df <plug>(lsp-document-format)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" ncm2
set shortmess+=c
inoremap <c-c> <ESC>
autocmd BufEnter * call ncm2#enable_for_buffer()
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
" auto-close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
let g:float_preview#docked = 0

" FZF
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

function! FloatingFZF(width, height, border_highlight)
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  " Size and position
  let width = float2nr(&columns * a:width)
  let height = float2nr(&lines * a:height)
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  " Border
  let top = '╭' . repeat('─', width - 2) . '╮'
  let mid = '│' . repeat(' ', width - 2) . '│'
  let bot = '╰' . repeat('─', width - 2) . '╯'
  let border = [top] + repeat([mid], height - 2) + [bot]

  " Draw frame
  let s:frame = s:create_float(a:border_highlight, {'row': row, 'col': col, 'width': width, 'height': height})
  call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

  " Draw viewport
  call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
  autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF(0.9, 0.6, "Comment")' }

" vim-gitgutter
let g:gitgutter_preview_win_floating = 1

" Additional keybindings
"
nnoremap <silent> <c-p> :Files<CR>

nnoremap <silent> <leader>bu :Buffers<CR>
nnoremap <silent> <leader>li :Lines<CR>
nnoremap <silent> <leader>ta :Tags<CR>
nnoremap <silent> <leader>bt :BTags<CR>
nnoremap <silent> <leader>rg :Rg<CR>
nnoremap <silent> <leader>dv :Dirvish<CR>

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


" lua/init.lua
lua require 'init'
