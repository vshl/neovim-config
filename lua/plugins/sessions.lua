return {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = true,
    init = function()
        local possession = require("nvim-possession")
        vim.keymap.set("n", "<C-s>", function()
            possession.list()
        end)
        vim.keymap.set("n", "<leader>sn", function()
            possession.new()
        end)
        vim.keymap.set("n", "<leader>su", function()
            possession.update()
        end)
        vim.keymap.set("n", "<leader>sd", function()
            possession.delete()
        end)
        require("nvim-possession").setup({
            save_hook = function()
                vim.cmd("Neotree toggle")
            end,
        })
    end,
}
