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
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  --vim.g.neovide_cursor_vfx_mode = "pixiedust"


  -- Add copy/past keybindings
  vim.keymap.set('n', '<C-S-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode
  -- Set Ctrl+Shift+V to paste from system clipboard
  --vim.keymap.set('n', '<C-S-v>', '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
  --vim.keymap.set('i', '<C-S-v>', '<C-r>+', { noremap = true, silent = true, desc = "Paste from system clipboard" })
  --vim.keymap.set('v', '<C-S-v>', '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})

