return {
       'marko-cerovac/material.nvim',
        config = function()
                require('material').setup({
                        plugins = {
                                'gitsigns',
                                'indent-blankline',
                                'nvim-cmp',
                                'nvim-navic',
                                'nvim-web-devicons',
                                'telescope'
                        }
                })
                vim.cmd('colorscheme material')
        end
}
