-- Fuzzy finder (fzf) integration

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    files = {
      path_shorten = 4,
    },
    buffers = {
      path_shorten = 4,
    },
    grep = {
      path_shorten = 4,
    },
  }
}

