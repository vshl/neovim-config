require('packer').use({
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle' },
        config = function()
                require('trouble').setup()
        end
})
