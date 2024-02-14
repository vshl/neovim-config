return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = 'VeryLazy',
    opts = {
        disabled_filetypes = {
            "qf",
            "netrw",
            "lazy",
            "mason",
            "FZF",
            "harpoon",
            "dashboard",
            "oil",
            "toggleterm"
        },
    }
}
