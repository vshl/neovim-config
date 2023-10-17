return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = 'VeryLazy',
    opts = {
        disabled_filetypes = {
            "qf",
            "netrw",
            "neo-tree",
            "lazy",
            "mason",
            "NeogitStatus",
            "NeogitPopup",
            "NeogitCommitMessage",
            "FZF",
            "harpoon",
            "dashboard"
        },
    }
}
