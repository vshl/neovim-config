local M = {
        'nvim-lualine/lualine.nvim'
}

M.dependencies = {
        'nvim-tree/nvim-web-devicons'
}

M.priority = 100

M.config = function()
        -- Lsp server name .
        local function server_name()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                        return msg
                end
                for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                        end
                end
                return msg
        end

        require('lualine').setup {
                options = {
                        icons_enabled = true,
                        theme = 'tokyonight',
                        component_separators = { left = '|', right = '|' },
                        section_separators = { left = '', right = '' },
                        disabled_filetypes = {}
                },
                sections = {
                        lualine_a = { 'branch', 'mode' },
                        lualine_b = {
                                {
                                        'filename',
                                        path = 1,
                                        symbols = {
                                                modified = '●',
                                                readonly = ''
                                        },
                                },
                                {
                                        'filetype'
                                }
                        },
                        lualine_c = {
                                { require('auto-session.lib').current_session_name },
                                {
                                        'diagnostics',
                                        sources = { 'nvim_lsp' },
                                        symbols = { error = ' ', warn = ' ', info = ' ' },
                                }
                        },
                        lualine_x = {
                                {
                                        'diff',
                                        symbols = { added = ' ', modified = ' ', removed = ' ' }
                                },
                                {
                                        server_name,
                                        icon = { ' ', color = { gui = 'bold' } }
                                }
                        },
                        lualine_y = { 'encoding', 'fileformat' },
                        lualine_z = { 'location', 'progress' }
                },
                inactive_sections = {
                        lualine_c = {},
                        lualine_b = {
                                {
                                        'filename',
                                        symbols = {
                                                modified = '●',
                                                readonly = ''
                                        }
                                }
                        },
                        lualine_x = {},
                        lualine_y = { 'location' }
                },
                extensions = {
                        'quickfix',
                        'lazy',
                        'neo-tree'
                }
        }
end

return M
