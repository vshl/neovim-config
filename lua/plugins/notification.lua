return {
    'rcarriga/nvim-notify',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function()
        require('notify').setup()
        vim.notify = require('notify')
    end
}
