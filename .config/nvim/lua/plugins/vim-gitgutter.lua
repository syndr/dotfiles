-- Git status in side column  https://github.com/airblade/vim-gitgutter

return {
  'airblade/vim-gitgutter',

  config = function()
    vim.g.gitgutter_set_sign_backgrounds = 1
  end
}

