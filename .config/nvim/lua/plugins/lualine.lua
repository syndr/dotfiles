return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    local cyberdream = require("lualine.themes.cyberdream")
    require('lualine').setup({
      options = {
        theme = 'cyberdream'
      },

      -- Include name of session in lualine
      sections = {lualine_c = {require('auto-session.lib').current_session_name}}
    })
  end
}
