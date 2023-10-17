return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local db = require('dashboard')
        db.setup({
            theme = 'hyper',
            config = {
                project = { action = 'FzfLua files cwd='},
                week_header = {
                    enable = true,
                },
                shortcut = {
                    { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'FzfLua files',
                        key = 'f',
                    },
                    {
                        desc = ' Sessions',
                        group = 'DiagnosticHint',
                        action = "lua require('nvim-possession').list()",
                        key = 's'
                    }
                },
            },
        })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
