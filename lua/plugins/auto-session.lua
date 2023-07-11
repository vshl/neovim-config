return {
        'rmagatti/auto-session',
        config = function()
                vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
                require("auto-session").setup({
                        log_level = vim.log.levels.ERROR,
                        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                        auto_session_use_git_branch = false,

                        auto_session_enable_last_session = false,
                })
        end
}
