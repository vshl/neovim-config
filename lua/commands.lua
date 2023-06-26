vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
  desc = "Highlight yank",
})

-- terminal.nvim
vim.api.nvim_create_autocmd("TermOpen", {
  command = [[setlocal nonumber norelativenumber]]
})

local lazygit = require("terminal").terminal:new({
  layout = { open_cmd = "float", height = 0.9, width = 0.9 },
  cmd = { "lazygit" },
  autoclose = true,
})
vim.env["GIT_EDITOR"] = "nvr -cc close -cc split --remote-wait +'set bufhidden=wipe'"
vim.api.nvim_create_user_command("Lazygit", function(args)
  lazygit.cwd = args.args and vim.fn.expand(args.args)
  lazygit:toggle(nil, true)
end, { nargs = "?" })

local acuity_run = require("terminal").terminal:new({
  cmd = { "scripts/bootstrap.sh" },
  autoclose = true,
})
vim.api.nvim_create_user_command("AcuityRun", function()
  acuity_run:toggle(nil, true)
end, { nargs = "?" })

local acuity_debug = require("terminal").terminal:new({
  cmd = { "scripts/bootstrap.sh", "--debug" },
  autoclose = true,
})
vim.api.nvim_create_user_command("AcuityDebug", function()
  acuity_debug:toggle(nil, true)
end, { nargs = "?" })

local rebuild_views = require("terminal").terminal:new({
  layout = { open_cmd = "float" },
  cmd = { "scripts/exec.sh", "bundle exec rails db:rebuild_views[all]" },
  autoclose = true,
})
vim.api.nvim_create_user_command("RebuildViews", function()
  rebuild_views:toggle(nil, true)
end, { nargs = "?" })

local dbmigrate = require("terminal").terminal:new({
  layout = { open_cmd = "float" },
  cmd = { "scripts/exec.sh", "bundle exec rails db:alter[db:migrate,all]" },
  autoclose = true,
})
vim.api.nvim_create_user_command("DbMigrateAll", function()
  dbmigrate:toggle(nil, true)
end, { nargs = "?" })
