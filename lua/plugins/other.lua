-- other plugins
return {
        {
                'tpope/vim-sleuth',
                event = 'BufRead'
        },
        {
                'tpope/vim-repeat',
                event = 'BufRead'
        },
        {
                'tmux-plugins/vim-tmux',
                ft = { 'tmux' }
        },
        {
                'lervag/vimtex',
                ft = { 'tex' },
        },
        {
                'jamessan/vim-gnupg'
        },
        {
                'kkoomen/vim-doge',
                event = 'BufRead',
                build = function() vim.fn['doge#install']() end
        },
        {
                'ludovicchabant/vim-gutentags',
                ft = { 'ruby', 'python', 'javascript' }
        }
}
