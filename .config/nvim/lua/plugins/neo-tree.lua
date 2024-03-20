-- Filesystem sidebar  https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
    's1n7ax/nvim-window-picker',
  },

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      auto_clean_after_session_restore = true,    -- Remove broken neo-tree buffers after session restore
      window = {
        position = "left",
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
                          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      source_selector = {
        winbar = true
      }
    })

    -- Toggle the filesystem view
    vim.keymap.set('n', '<F1>', ':Neotree filesystem toggle<CR>')

    -- Show the open buffers
    vim.keymap.set('n', '<leader><C-I>', ':Neotree float buffers<CR>')

    -- Show git status
    vim.keymap.set('n', '<C-b>', ':Neotree float git_status<CR>')

    -- Show on launch
    --vim.cmd("Neotree filesystem show")
  end
}
