return {
        'rcarriga/nvim-notify',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
                require('notify').setup()
                vim.notify = require('notify')
        end
}
