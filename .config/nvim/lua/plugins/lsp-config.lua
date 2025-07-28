-- Language server configuration!

return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ansiblels",
          "bashls",
          --"gopls",
          "jsonls",
          --"jqls",
          "powershell_es",
          "sourcery", -- python
          "terraformls",
          "hydra_lsp" -- yaml
        }
    })
    end
  },
  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
        vim.g.copilot_nes_debounce = 500
        vim.lsp.enable("copilot_ls")
        vim.keymap.set("n", "<tab>", function()
            -- Try to jump to the start of the suggestion edit.
            -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
            local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
                or (
                    require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit()
                )
        end)
    end,
  },
  {
    "neovim/nvim-lspconfig",

    --config = function()
    --  local capabilities = require('cmp_nvim_lsp').default_capabilities()

    --  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    --  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    --  -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    --end
  },
  --{
  --  'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
  --  dependencies = {
  --    "williamboman/mason.nvim",
  --    "williamboman/mason-lspconfig.nvim",
  --    'neovim/nvim-lspconfig',
  --    'hrsh7th/cmp-nvim-lsp',
  --    'hrsh7th/nvim-cmp',
  --    'L3MON4D3/LuaSnip'
  --  },

  --  config = function()
  --    local lsp_zero = require('lsp-zero')
  --    local capabilities = require('cmp_nvim_lsp').default_capabilities()

  --    require('mason').setup({})
  --    require('mason-lspconfig').setup({
  --      capabilities = capabilities,
  --      ensure_installed = { "ansiblels" },
  --      handlers = {
  --        lsp_zero.default_setup,
  --      },
  --    })


  --    -- default keybindings, only setup when language server is active in the current file
  --    lsp_zero.on_attach(function(client, bufnr)
  --      lsp_zero.default_keymaps({buffer = bufnr})
  --    end)
  --
  --    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  --    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  --    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
  --  end
  --}
}


