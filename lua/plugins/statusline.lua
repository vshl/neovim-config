local M = {
        'nvim-lualine/lualine.nvim',
        dependencies = {
                'kyazdani42/nvim-web-devicons',
                'nord.nvim'
        }
}

M.priority = 100

M.config = function()
        local navic = require('nvim-navic')
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
                        theme = 'auto',
                        component_separators = '|',
                        section_separators = { left = '', right = '' },
                        disabled_filetypes = {}
                },
                sections = {
                        lualine_a = { 'mode' },
                        lualine_b = {
                                {
                                        'filename',
                                        path = 1,
                                        symbols = {
                                                modified = '●',
                                                readonly = ''
                                        },
                                }
                        },
                        lualine_c = {
                                {
                                        'filetype',
                                        icon_only = true
                                },
                                {
                                        'diagnostics',
                                        sources = { 'nvim_lsp' },
                                        symbols = { error = ' ', warn = ' ', info = ' ' },
                                        on_click = function()
                                                vim.cmd('Telescope diagnostics buffnr=0')
                                        end
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
                        lualine_z = { 'location', 'progress', 'branch' }
                },
                inactive_sections = {
                        lualine_a = {},
                        lualine_b = {
                                {
                                        'filename',
                                        path = 1,
                                        symbols = {
                                                modified = '●',
                                                readonly = ''
                                        }
                                }
                        },
                        lualine_c = {}
                },
                extensions = { 'quickfix' }
        }
end

return M
