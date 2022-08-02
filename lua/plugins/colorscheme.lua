require('packer').use({
  'EdenEast/nightfox.nvim',
  config = function()
    vim.cmd [[colorscheme nightfox]]
  end,
  run = ':NightfoxCompile'
})
