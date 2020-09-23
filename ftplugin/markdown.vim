" display the rendered markdown in your browser
if executable('grip')
  nnoremap <buffer><leader>m :T grip -b %<cr>
endif
