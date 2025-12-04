-- Keymappings general configuration

vim.keymap.set('n', '<C-S-s>', ':w<CR>', { noremap = true, silent = true, desc = "Save file" }) -- Save
vim.keymap.set('v', '<C-S-c>', '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" }) -- Copy
vim.keymap.set('n', '<C-S-v>', '"+P', { noremap = true, silent = true, desc = "Paste from system clipboard" }) -- Paste normal mode
vim.keymap.set('v', '<C-S-v>', '"+P', { noremap = true, silent = true, desc = "Paste from system clipboard" }) -- Paste visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+', { noremap = true, silent = true, desc = "Paste from system clipboard" }) -- Paste command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli', { noremap = true, silent = true, desc = "Paste from system clipboard" }) -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})

-- Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
vim.keymap.set("n", "<esc>", function()
    if not require('copilot-lsp.nes').clear() then
        -- fallback to other functionality
    end
end, { desc = "Clear Copilot suggestion or fallback" })

-- CodeCompanion Keybindings
vim.keymap.set('n', '<leader>cc', ':CodeCompanionActions<CR>', { noremap = true, silent = true, desc = "Code Companion" })

-- Show diagnostics in location list
vim.keymap.set('n', '<leader>dl', function()
  vim.diagnostic.setloclist()
end, { desc = 'Open diagnostics in location list' })
