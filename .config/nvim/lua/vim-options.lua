-- Vim configuration commands

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

if vim.g.neovide then
  -- Set opacity
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8

  -- Set cursor FX
  --vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

-- Use treesitter for syntax highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- Enable treesitter folding
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Use experimental indentation from treesitter
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Store undo history in a file
vim.opt.undofile = true

-- Mode is shown in the statusline, so we don't need to show it in the command line
vim.opt.showmode = false

-- Indent wrapped lines to match the start of the line
vim.opt.breakindent = true

-- Search configuration
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5
