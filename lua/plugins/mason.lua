local M = {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim'
  }
}

M.servers = { 'solargraph', 'sumneko_lua', 'bashls', 'jsonls', 'yamlls', 'tsserver', 'marksman', 'sqlls' }

function M.config()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensured_installed = M.servers,
    automatic_installation = true,
  })
end

return M
