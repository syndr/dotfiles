-- Install vim-polyglot for additional language support  https://github.com/sheerun/vim-polyglot

return {
  "sheerun/vim-polyglot",
  -- lazy = false,

  config = function()
    -- brighten the name: key
    vim.g.ansible_name_highlight = 'b'

    -- highlight additional keywords
    vim.g.ansible_extra_keyworkds_highlight = 1

    -- template language
    vim.g.ansible_template_syntaxes = {
      ["*.sh.j2"] = "sh",
      ["*.yml.j2"] = "yaml",
      ["*.yaml.j2"] = "yaml"
    }

    -- set filetype on common file paths
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile"}, {
      pattern = {
        "*/roles/*.yml",
        "*/playbooks/*.yml",
        "*/tasks/*.yml"
      },
      command = "set filetype=yaml.ansible",
    })
  end
}

