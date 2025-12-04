-- Render Markdown and optionally preview it!  https://github.com/OXY2DEV/markview.nvim

return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 40,  -- Load before Treesitter

  opts = {
    preview = {
      filetypes = { "markdown", "codecompanion" },
      ignore_buftypes = {},
    },
  },
}

