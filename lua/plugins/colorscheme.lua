return {
        'folke/tokyonight.nvim',
        config = function()
                require('tokyonight').setup({
                        dim_inactive = true
                })
                vim.cmd('colorscheme tokyonight')
        end
}
