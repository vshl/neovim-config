-- other plugins
return {
        {
                'tpope/vim-sleuth',
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
                'jamessan/vim-gnupg',
                event = 'VeryLazy'
        },
        {
                'kkoomen/vim-doge',
                event = 'VeryLazy',
                build = function() vim.fn['doge#install']() end
        },
        {
                'ludovicchabant/vim-gutentags',
                ft = { 'ruby', 'python', 'javascript' }
        }
}
