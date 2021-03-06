" lua/init.lua
lua require 'init'

" Mouse support
set mouse=a

" Ignore case and smart case in ex mode
set ignorecase
set smartcase

" fold method
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Line numbers
set number
set relativenumber

" completion
set shortmess+=c
set completeopt=menuone,noselect

" don't abandon buffers
set hidden

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

" Additional keybindings
"
nnoremap <silent> <c-p> :Files<CR>

nnoremap <silent> <leader>bu :Buffers<CR>
nnoremap <silent> <leader>li :Lines<CR>
nnoremap <silent> <leader>ta :Tags<CR>
nnoremap <silent> <leader>bt :BTags<CR>
nnoremap <silent> <leader>rg :Rg<CR>

" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Fix spelling
nnoremap <leader>fs 1z=

" indent_blankline
let g:indent_blankline_space_char = '.'

