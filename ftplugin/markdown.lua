-- display the rendered markdown in your browser
if vim.fn.executable('grip') == 1 then
  vim.api.nvim_buf_set_keymap(0, 'n', '<leader>m', ':TermExec cmd="grip -b %"<CR>', { noremap = true })
end
