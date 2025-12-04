-- Treesiter  Syntax highlighting and more!  https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",

  dependencies = {
    -- We want to load Markfiew before Treesitter
    "OXY2DEV/markview.nvim",
  },

  build = ":TSUpdate",
  branch = "main",
  -- Lazy loading is not supported for this plugin
  lazy = false,

  config = function()
    require('nvim-treesitter').install({
        "awk",
        "bash",
        "c",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitattributes",
        "gitignore",
        "go",
        "helm",
        "html",
        "javascript",
        "jinja",
        "jinja_inline",
        "jq",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "passwd",
        "powershell",
        "python",
        "regex",
        "ruby",
        "rust",
        "sql",
        "terraform",
        "tmux",
        "toml",
        "todotxt",
        "tsv",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    })
  end
}

