local M = {}

M.config = function()
  require('colorizer').setup {
    'haml';
    'css';
    'scss';
    'javascript';
    html = {
      names = false;
    }
  }
end

return M
