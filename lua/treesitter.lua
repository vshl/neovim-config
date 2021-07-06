local ts = {}

ts.config = function()
  local tsconfig = require('nvim-treesitter.configs')
  tsconfig.setup {
    ensure_installed = { 'ruby', 'lua', 'bash', 'javascript', 'json', 'yaml', 'python' },
    ignore_install = { 'html' },
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  }
end

return ts
