return {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        dependencies = {
                'plenary.nvim',
                'nvim-web-devicons',
                'MunifTanjim/nui.nvim'
        },
        config = function()
                vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
        cmd = 'Neotree'
}
