return {
    'akinsho/nvim-toggleterm.lua',
    version = '*',
    config = true,
    cmd = { 'ToggleTerm' },
    keys = {
        { '<A-i>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>',      mode = { 'n' } },
        { '<A-i>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', mode = { 'i', 't' } },
    }
}
