require('packer').use ({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  config = function()
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }
  end
})