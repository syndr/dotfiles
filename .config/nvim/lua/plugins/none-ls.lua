-- Community maintainted fork of Null-ls   https://github.com/nvimtools/none-ls.nvim
--   Runs non-integrated language/syntax stuff

return {
  "nvimtools/none-ls.nvim",

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
