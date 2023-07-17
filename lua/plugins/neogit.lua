return {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = { 'Neogit' },
    config = true,
    init = function()
        require('neogit').setup {}
    end
}
