-- Code completions are important!  https://github.com/hrsh7th/nvim-cmp

return {
  --{ -- use LSPs for suggestions
  --  'hrsh7th/cmp-nvim-lsp',
  --},
  {
    'github/copilot.vim',
    cmd = "Copilot",
    event = "BufWinEnter",
    init = function()
      vim.g.copilot_no_maps = true
    end,
    config = function()
      -- Block the normal Copilot suggestions
      vim.api.nvim_create_augroup("github_copilot", { clear = true })
      vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
        group = "github_copilot",
        callback = function(args)
          vim.fn["copilot#On" .. args.event]()
        end,
      })
      vim.fn["copilot#OnFileType"]()
    end,
  },
  {
    'xzbdmw/colorful-menu.nvim',

    config = function()
      require("colorful-menu").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
      })
    end,
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'fang2hou/blink-copilot',
      'xzbdmw/colorful-menu.nvim',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true
        },
        ghost_text = {
          enabled = true,
          --prefix = '󰛨 ',
          --highlight_group = 'Comment',
          show_with_menu = false,
        },
        menu = {
          auto_show = false,
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
  },
  --{ -- snippets support
  --  'L3MON4D3/LuaSnip',
  --  dependencies = {
  --    'saadparwaiz1/cmp_luasnip',
  --    'rafamadriz/friendly-snippets',
  --  }
  --},
  --{ -- the completion engine
  --  "hrsh7th/nvim-cmp",
  --  dependencies = {
  --    'neovim/nvim-lspconfig',
  --    'hrsh7th/cmp-nvim-lsp',
  --    'hrsh7th/cmp-buffer',
  --    'hrsh7th/cmp-path',
  --    'hrsh7th/cmp-cmdline',
  --    'hrsh7th/cmp-emoji',
  --    'hrsh7th/cmp-cmdline',
  --  },
  --  config = function()
  --    local cmp = require'cmp'
  --    --local cmp_action = require('lsp-zero').cmp_action()
  --    require("luasnip.loaders.from_vscode").lazy_load()

  --    -- for search commandline
  --    cmp.setup.cmdline('/', {
  --      mapping = cmp.mapping.preset.cmdline(),
  --      sources = {
  --        { name = 'buffer' }
  --      }
  --    })

  --    -- `:` cmdline setup.
  --    cmp.setup.cmdline(':', {
  --      mapping = cmp.mapping.preset.cmdline(),
  --      sources = cmp.config.sources({
  --        { name = 'path' }
  --      }, {
  --        {
  --          name = 'cmdline',
  --          option = {
  --            ignore_cmds = { 'Man', '!' }
  --          }
  --        }
  --      })
  --    })

  --    cmp.setup({
  --      snippet = {
  --        -- REQUIRED - you must specify a snippet engine
  --        expand = function(args)
  --          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --        end,
  --      },
  --      window = {
  --        completion = cmp.config.window.bordered(),
  --        documentation = cmp.config.window.bordered(),
  --      },
  --      mapping = cmp.mapping.preset.insert({
  --        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --        ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --        ['<C-Space>'] = cmp.mapping.complete(),
  --        ['<C-e>'] = cmp.mapping.abort(),
  --        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --      }),
  --      sources = cmp.config.sources({
  --        { name = 'nvim_lsp' },
  --        { name = 'luasnip' }, -- For luasnip users.
  --        { name = 'buffer' },
  --        { name = 'emoji' },
  --      })
  --    })
  --  end
  --}
}

