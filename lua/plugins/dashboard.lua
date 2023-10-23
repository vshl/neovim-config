return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local db = require('dashboard')
        db.setup({
            config = {
                project = { action = 'FzfLua files cwd='},
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        icon = '󰊳 ',
                        desc = 'Lazy',
                        group = '@property',
                        action = 'Lazy check',
                        key = 'l'
                    },
                    {
                        icon = ' ',
                        desc = 'Files',
                        group = 'Label',
                        action = 'FzfLua files',
                        key = 'f',
                    },
                    {
                        icon = ' ',
                        desc = 'Sessions',
                        group = '@variable',
                        action = "lua require('nvim-possession').list()",
                        key = 's'
                    }
                },
            },
        })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
