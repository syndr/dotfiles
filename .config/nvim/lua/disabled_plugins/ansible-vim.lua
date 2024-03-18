-- Ansible and jinja syntax highlighting  https://github.com/pearofducks/ansible-vim

return {
  'pearofducks/ansible-vim',

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
  end
}

