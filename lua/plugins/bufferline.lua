return {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        requires = 'nvim-web-devicons',
        config = function()
                require('bufferline').setup()
        end
}
