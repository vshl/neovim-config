require('packer').use({
  'akinsho/nvim-toggleterm.lua',
  cmd = { 'ToggleTerm', 'TermExec' },
  config = function()
    require('toggleterm').setup {
      direction = 'float'
    }
  end
})
