return {
        'shortcuts/no-neck-pain.nvim',
        cmd = 'NoNeckPain',
        version = '*',
        config = function()
                require('no-neck-pain').setup({
                        width = 140
                })
        end
}
