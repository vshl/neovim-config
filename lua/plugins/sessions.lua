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
                vim.cmd("Neotree close")
                -- Get visible buffers
                local visible_buffers = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    visible_buffers[vim.api.nvim_win_get_buf(win)] = true
                end

                local buflist = vim.api.nvim_list_bufs()
                for _, bufnr in ipairs(buflist) do
                    if visible_buffers[bufnr] == nil then -- Delete buffer if not visible
                        vim.cmd("bd " .. bufnr)
                    end
                end
            end
        })
    end,
}
