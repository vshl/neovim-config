---@diagnostic disable: undefined-global
local completion = {}

completion.config = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    -- You should specify your *installed* sources.
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'luasnip'},
      { name = 'path' },
      { name = 'calc' },
      { name = 'nvim_lua' }
    },

    -- Replace text with lspkind
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = require('lspkind').presets.default[vim_item.kind]
        return vim_item
      end
    }
  }
end

completion.autopairs = function()
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end

return completion
