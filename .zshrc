#export TERM='screen-256color'

PATH=$PATH:$HOME/.local/bin:$HOME/bin
alias ll='exa -lhgum --git'

# For git dotfiles configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Use exa for ll, as it's super nice (you have to install exa)
alias ll='exa -lhgum --git'

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundled plugins from the default repo (robbyrussell's oh-my-zsh)
# see https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins for other ones
antigen bundle colored-man-pages
#antigen bundle docker
#antigen bundle gem
antigen bundle git
antigen bundle git-extras
antigen bundle httpie
#antigen bundle jsontools
antigen bundle pep8
antigen bundle pip
antigen bundle pylint
antigen bundle ruby
antigen bundle sudo
antigen bundle vagrant
antigen bundle virtualenv

# use the agnoster theme from oh-my-zsh
#antigen theme agnoster

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# pure theme (minimalistic and pretty)
#antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure

# powerlevel9k theme
#antigen theme bhilburn/powerlevel9k powerlevel9k

# bullet train theme
#antigen theme caiogondim/bullet-train.zsh bullet-train

# use gallois theme
#antigen theme gallois

# Show inline autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Tell antigen that you're done.
antigen apply

eval "$(starship init zsh)"

eval "$(mcfly init zsh)"
