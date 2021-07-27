local ts = {}

ts.config = function()
  local tsconfig = require('nvim-treesitter.configs')
  tsconfig.setup {
    ensure_installed = { 'ruby', 'lua', 'bash', 'javascript', 'json', 'yaml', 'python', 'scss', 'html', 'comment' },
    ignore_install = {},
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  }
end

return ts
