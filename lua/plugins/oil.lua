return {
    'stevearc/oil.nvim',
    config = true,
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { '<leader>o', '<CMD>Oil<CR>', mode = { 'n' } }
    }
}
