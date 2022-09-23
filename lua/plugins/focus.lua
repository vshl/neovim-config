require('packer').use {
  'beauwilliams/focus.nvim',
  cmd = { 'FocusSplitNicely', 'FocusSplitCycle' },
  module = 'focus',
  config = function()
    require('focus').setup({hybridnumber = true})
  end
}
