return {
        'shaunsingh/nord.nvim',
        config = function()
                vim.g.nord_contrast = true
                vim.g.nord_borders = true
                require('nord').set()
        end
}
