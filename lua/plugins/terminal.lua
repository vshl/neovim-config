return {
  'numToStr/Fterm.nvim',
  config = function()
    local fterm = require("FTerm")

    local lazygit = fterm:new({
      ft = 'fterm_lazygit', -- You can also override the default filetype, if you want
      cmd = "lazygit",
      dimensions = {
        height = 0.9,
        width = 0.9
      }
    })

    vim.keymap.set('n', '<A-g>', function()
      lazygit:toggle()
    end)
  end
}
