return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            dim_nc_background = true
        })
        vim.cmd('colorscheme rose-pine')
    end
}
