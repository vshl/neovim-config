return {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function()
                require('github-theme').setup({
                        options = {
                                dim_inactive = true
                        }
                })
                vim.cmd('colorscheme github_dark')
        end
}
