-- Language server configuration!

return {
  --{
  --  "williamboman/mason.nvim",

  --  config = function()
  --    require("mason").setup()
  --  end
  --},
  --{
  --  "williamboman/mason-lspconfig.nvim",

  --  config = function()
  --    require("mason-lspconfig").setup({
  --      ensure_installed = {
  --        "lua_ls",
  --        "ansiblels",
  --        "bashls",
  --        "gopls",
  --        "jsonls",
  --        "jqls",
  --        "powershell_es",
  --        "sourcery", -- python
  --        "terraformls",
  --        "hydra_lsp" -- yaml
  --      }
  --  })
  --  end
  --},
  -- {
  --   "neovim/nvim-lspconfig",

  --   config = function()
  --     local capabilities = require('cmp_nvim_lsp').default_capabilities()

  --     -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  --     -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  --     -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
  --   end
  -- },
  {
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip'
    },

    config = function()
      local lsp_zero = require('lsp-zero')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason').setup({})
      require('mason-lspconfig').setup({
        capabilities = capabilities,
        ensure_installed = { "ansiblels" },
        handlers = {
          lsp_zero.default_setup,
        },
      })


      -- default keybindings, only setup when language server is active in the current file
      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
    
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}


