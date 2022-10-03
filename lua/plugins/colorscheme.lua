require('packer').use({
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup({
      dimInactive = true
    })
    vim.cmd('colorscheme kanagawa')
  end
})
