require('packer').use({
        'rcarriga/nvim-notify',
        config = function()
                require('notify').setup()
                vim.notify = require('notify')
        end,
        requires = { 'nvim-lua/plenary.nvim' }
})
