return {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        dependencies = 'nvim-web-devicons',
        config = function()
                require('bufferline').setup()
        end,
        event = 'BufRead'
}
