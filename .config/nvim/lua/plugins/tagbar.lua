-- Show tag layout sidebar (class layout)  https://github.com/preservim/tagbar

return {
  "preservim/tagbar",

  config = function()
    vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>")
  end
}

