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
                        format = function(entry, vim_item)
                                if vim.tbl_contains({ 'path' }, entry.source.name) then
                                        local icon, hl_group = require('nvim-web-devicons').get_icon(entry
                                        :get_completion_item().label)
                                        if icon then
                                                vim_item.kind = icon
                                                vim_item.kind_hl_group = hl_group
                                                return vim_item
                                        end
                                end
                                return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
                        end
                }
        }
end

return M
