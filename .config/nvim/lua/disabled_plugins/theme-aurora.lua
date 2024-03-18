-- The Aurora theme  https://github.com/ray-x/aurora

return {
  'ray-x/aurora',
  name = 'aurora',
  priority = 1000,

  config = function()
    vim.g.aurora_transparent = 0

    -- Make background transparent by default
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi String guibg=#339922 ctermbg=NONE")

    vim.cmd.colorscheme "aurora"
  end
}
