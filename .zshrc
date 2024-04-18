export TERM='xterm-256color'
export EDITOR='/usr/bin/nvim'

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/linuxbrew/.linuxbrew/bin

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundled plugins from the default repo (robbyrussell's oh-my-zsh)
# see https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins for other ones
antigen bundle colored-man-pages
#antigen bundle docker
#antigen bundle gem
#antigen bundle git
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

# Use asdf version manager completions
antigen bundle kiurchv/asdf.plugin.zsh

# Tell antigen that you're done.
antigen apply

# Set GOROOT to work with asdf versions
#. ~/.asdf/plugins/golang/set-env.zsh

# For git dotfiles configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Use exa for ll, as it's super nice (you have to install exa)
alias ll='exa -lhgum --git'

# Kubernetes things
alias k='kubectl'

# Run things on the nvidia gpu
alias nvexec='__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia'

# Use a commonly known shell for SSH
alias ssh='TERM=xterm-256color ssh'

eval "$(starship init zsh)"

# MCFly shell history management: https://github.com/cantino/mcfly
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=3
export MCFLY_RESULTS=100
export MCFLY_PROMPT="❯"
eval "$(mcfly init zsh)"

# Shell colors for dark backgrounds
LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export RANGER_DEVICONS_SEPARATOR='  '

# Command completion settings
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
unsetopt completealiases

