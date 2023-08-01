return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            winopts_fn = function()
                -- smaller width if neovim win has over 80 columns
                return { width = vim.o.columns > 80 and 0.65 or 0.85 }
            end,

            winopts = {
                preview = {
                    default = 'bat',
                    layout = 'flex'
                }
            }
        })
    end,
    cmd = 'FzfLua'
}
