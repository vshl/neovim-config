local M = {
    'nvim-lualine/lualine.nvim'
}

M.dependencies = {
    'nvim-tree/nvim-web-devicons',
    'arkav/lualine-lsp-progress'
}

M.priority = 100

M.opts = function()
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

    return {
        options = {
            icons_enabled = true,
            theme = 'gruvbox-material',
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {'dashboard'}
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
                {
                    require("nvim-possession").status,
                    cond = function()
                        return require("nvim-possession").status() ~= nil
                    end,
                },
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
                    'lsp_progress'
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
            'neo-tree',
            'fzf',
            'mason'
        }
    }
end

return M
