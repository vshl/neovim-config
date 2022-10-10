local use = require('packer').use

use {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup()
  end
}

use {
  'williamboman/mason-lspconfig.nvim'
}

use {
  'SmiteshP/nvim-navic',
}

use {
  'neovim/nvim-lspconfig',
  after = { 'cmp-nvim-lsp' },
  config = function()
    local on_attach = function(client, buffnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(buffnr, ...) end

      local function buf_set_option(...) vim.api.nvim_buf_set_option(buffnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = false
      })

      local navic = require('nvim-navic')
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, buffnr)
      end
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local servers = { 'solargraph', 'sumneko_lua', 'bashls', 'jsonls', 'yamlls', 'pyright', 'tsserver' }
    require('mason-lspconfig').setup {
      ensured_installed = servers,
      automatic_installation = true
    }

    for _, server in ipairs(servers) do
      require('lspconfig')[server].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 500,
        }
      }
    end
  end
}
