require('packer').use({
        'rcarriga/nvim-notify',
        event = 'BufRead',
        config = function()
                require('notify').setup()
                vim.notify = require('notify')
        end
})
