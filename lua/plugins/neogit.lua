return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ibhagwan/fzf-lua',
        'sindrets/diffview.nvim'
    },
    cmd = { 'Neogit' },
    config = true,
    init = function()
        require('neogit').setup {
            integrations = {
                telescope = false,
                diffview = true,
                fzf_lua = true
            }
        }
    end
}
