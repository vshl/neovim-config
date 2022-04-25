vim.api.nvim_create_autocmd( { "FileType" }, {
  pattern = { "*.py", "*.pyi" },
  command = "setlocal nosmartindent"
})
