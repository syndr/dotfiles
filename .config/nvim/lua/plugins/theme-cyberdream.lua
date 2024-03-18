-- The Cyberdream theme  https://github.com/scottmckendry/cyberdream.nvim

return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            hide_fillchars = false,
            borderless_telescope = false,
            terminal_colors = true,

            theme = {
              colors = {
                fg = "#00a595",
                grey = "#3f444d",
              },
            }
        })

        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
}
