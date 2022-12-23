return {
  'beauwilliams/focus.nvim',
  cmd = { 'FocusSplitNicely', 'FocusSplitCycle' },
  name = 'focus',
  config = function()
    require('focus').setup({hybridnumber = true})
  end
}
