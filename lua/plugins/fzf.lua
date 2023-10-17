return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            winopts = {
                preview = {
                    default = 'bat',
                    flip_columns = 180
                }
            }
        })
    end,
    cmd = 'FzfLua'
}
