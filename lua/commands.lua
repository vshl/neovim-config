vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
  desc = "Highlight yank",
})

-- FTerm.nvim
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

vim.api.nvim_create_user_command('AcuityRun', function()
    require('FTerm').run('scripts/bootstrap.sh')
end, { bang = true })

vim.api.nvim_create_user_command('DbMigrateAll', function()
    require('FTerm').scratch({ cmd = {'scripts/exec.sh', 'bundle exec rails devops:db_alter[db:migrate,all]'} })
end, { bang = true })
