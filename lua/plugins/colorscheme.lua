return {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('bamboo').setup {
            dim_inactive = true
        }
        require('bamboo').load()
    end,
}
