local M = {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-emoji',
                'hrsh7th/cmp-path',
                'saadparwaiz1/cmp_luasnip',
                'onsails/lspkind.nvim',
                { 'hrsh7th/cmp-nvim-lua', ft = 'lua' }
        }
}

function M.config()
        -- nvim-cmp setup
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local kind = require('lspkind')
        kind.init()


        cmp.setup {
                snippet = {
                        expand = function(args)
                                luasnip.lsp_expand(args.body)
                        end,
                },
                mapping = cmp.mapping.preset.insert {
                        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<CR>'] = cmp.mapping.confirm {
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true,
                        },
                        ['<Tab>'] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_next_item()
                                elseif luasnip.expand_or_jumpable() then
                                        luasnip.expand_or_jump()
                                else
                                        fallback()
                                end
                        end, { 'i', 's' }),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                        luasnip.jump(-1)
                                else
                                        fallback()
                                end
                        end, { 'i', 's' }),
                },
                sources = {
                        { name = 'buffer' },
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'path' },
                        { name = 'emoji' },
                        { name = 'nvim_lua' }
                },
                formatting = {
                        format = function(_entry, vim_item)
                                vim_item.kind = kind.presets.default[vim_item.kind]
                                return vim_item
                        end
                }
        }
end

return M
