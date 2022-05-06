-- other plugins
local use = require('packer').use

use {
        'tpope/vim-sleuth',
        event = 'BufRead'
}
use {
        'tpope/vim-surround',
        event = 'BufRead'
}
use {
        'tpope/vim-repeat',
        event = 'BufRead'
}
use {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'Gdiff', 'Gclog' }
}
use {
        'tmux-plugins/vim-tmux',
        ft = { 'tmux' }
}
use {
        'lervag/vimtex',
        ft = { 'tex' },
}
use {
        'jamessan/vim-gnupg'
}
use {
        'kkoomen/vim-doge',
        event = 'BufRead',
        run = function() vim.fn['doge#install']() end
}
use {
        'ludovicchabant/vim-gutentags',
        ft = { 'ruby', 'python', 'javascript' }
}
