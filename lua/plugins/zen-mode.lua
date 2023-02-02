local M = {
        'folke/zen-mode.nvim',
        dependencies = {
                'folke/twilight.nvim'
        },
        cmd = 'ZenMode'
}

M.config = function()
        require('zen-mode').setup {
                window = {
                        width = 0.40
                },
                plugins = {
                        twilight = false,
                }
        }
end

return M
