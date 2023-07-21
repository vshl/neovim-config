return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'plenary.nvim',
        'nvim-web-devicons',
        'MunifTanjim/nui.nvim'
    },
    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        require('neo-tree').setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                }
            }
        })
    end,
    cmd = 'Neotree'
}
