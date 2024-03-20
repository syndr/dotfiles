-- Session saving based on current directory  https://github.com/rmagatti/auto-session

return {
  'rmagatti/auto-session',

  config = function()
    require('auto-session').setup {
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
      auto_session_enabled = true,
      auto_save_interval = 30000,
      auto_restore_host = true,
      auto_session_suppress_dirs = nil,
      auto_session_use_git_branch = true,

      bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types

      -- Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
      cwd_change_handling = {
        restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
        pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
        post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
      },

      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = true,
      },

      vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
      })
    }
  end,
}
