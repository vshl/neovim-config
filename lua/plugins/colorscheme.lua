return {
        'marko-cerovac/material.nvim',
        lazy = false,
        priority = 1000,
        config = function()
                require('material').setup({
                        contrast = {
                                terminal = true,
                                sidebars = true,
                                floating_windows = true,
                                non_current_windows = true
                        }
                })
                vim.g.material_style = 'darker'
                vim.cmd('colorscheme material')
        end
}
