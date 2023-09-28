local M = {
    'VonHeikemen/lsp-zero.nvim'
}

M.branch = 'v3.x'

M.dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    {
        'L3MON4D3/LuaSnip',
        version = "1.*",
        dependencies = { 'rafamadriz/friendly-snippets' }
    }, -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind.nvim' },
    {
        'hrsh7th/cmp-nvim-lua',
        ft = 'lua'
    }
}

function M.config()
    require('mason').setup({})
    local lsp_zero = require('lsp-zero')

    local prettier_fmt = {
        formatCommand = 'prettierd "${INPUT}"',
        formatStdin = true,
        env = {
            string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.prettierrc')),
        },
    }

    local erb_fmt = {
        formatCommand = 'htmlbeautifier',
        lintDebounce = '2s',
        lintCommand = 'erb -x -T - | ruby -c',
        lintStdin = true,
        lintOffset = 1,
        formatStdin = true
    }

    local efm_languages = {
        markdown = { prettier_fmt },
        json = { prettier_fmt },
        eruby = { erb_fmt },
        scss = { prettier_fmt },
    }

    require('mason-lspconfig').setup({
        ensure_installed = {
            'solargraph',
            'lua_ls',
            'bashls',
            'jsonls',
            'marksman',
            'tailwindcss',
            'tsserver',
            'efm'
        },

        handlers = {
            lsp_zero.default_setup,
            efm = function()
                require('lspconfig').efm.setup({
                    init_options = {
                        documentFormatting = true,
                    },
                    filetypes = vim.tbl_keys(efm_languages),
                    settings = {
                        rootMarkers = { ".git/" },
                        languages = efm_languages
                    },
                })
            end,
            tailwindcss = function()
                require('lspconfig').tailwindcss.setup({
                    filetypes = { 'css', 'sass', 'scss' }
                })
            end,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end
        }
    })

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    lsp_zero.set_sign_icons(
        {
            error = "",
            warn = "",
            hint = "",
            info = ""
        }
    )

    local cmp = require('cmp')

    local cmp_action = lsp_zero.cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip').filetype_extend('ruby', { 'rails' })

    cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            ['<Tab>'] = cmp_action.luasnip_supertab(),
            ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        },
        sources = {
            { name = 'buffer',                 keyword_length = 3 },
            { name = 'nvim_lsp' },
            { name = 'luasnip',                keyword_length = 2 },
            { name = 'path' },
            { name = 'nvim_lua' },
            { name = 'nvim_lsp_signature_help' }
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = { 'abbr', 'kind', 'menu' },
            format = require('lspkind').cmp_format({
                mode = 'symbol',       -- show only symbol annotations
                maxwidth = 50,         -- prevent the popup from showing more than provided characters
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
            })
        }
    })
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return M
