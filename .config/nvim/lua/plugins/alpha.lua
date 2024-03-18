-- Alpha greeter for nvim  https://github.com/goolord/alpha-nvim

return {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function ()
    local alpha = require("alpha")
    local dashboard = require"alpha.themes.startify"

    -- custom header
    -- dashboard.section.header.val = {
    -- [[   asdf   stuff   blah }},
    -- }

    alpha.setup(dashboard.opts)
  end
}

