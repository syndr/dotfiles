-- Highlight important comments

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require('todo-comments').setup({
      signs = true,
      sign_priority = 8,
      gui_style = {
        fg = "BOLD",
        bg = "NONE",
      },

      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "#6c1717", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", color = "info", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },

      -- list of named colors where we try to extract the guifg from the
      -- list of hilight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "#DC2626" },
        warning = { "#650075" },
        info = { "#12423a" },
        hint = { "#03620e" },
        default = { "#7C3AED" },
        test = { "#202f1e" },
      },
    })
  end
}

