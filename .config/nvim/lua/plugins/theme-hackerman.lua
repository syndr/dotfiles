-- The Hackerman theme  https://github.com/syndr/vim-hackerman-syntax

return {
    "syndr/vim-hackerman-syntax",
    lazy = false,
    priority = 1000,

    config = function()
        vim.cmd("colorscheme hackerman") -- set the colorscheme
        -- Make background transparent by default
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
        vim.cmd("hi String guibg=#339922 ctermbg=NONE")
        vim.cmd("highlight SignColumn ctermbg=NONE")
        vim.cmd("highlight LineNr ctermbg=NONE")
    end,
}
