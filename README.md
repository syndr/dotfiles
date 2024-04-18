# dotfiles

This repository encompasses my general workstation setup, and is meant to contain the full working configuration from new install to production machine.

It makes use of the versioning strategy outlined [here](https://www.atlassian.com/git/tutorials/dotfiles). If you use a different application/method for managing your dotfiles, the configuration stored in this repository should be fairly adaptable.

# Installation

Create yourself a custom `config` command:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Configure your custom `config` command:
```
config config --local status.showUntrackedFiles no
```

Make sure we avoid death by recursion:
```
echo ".cfg" >> .gitignore
```

And clone this repo into a bare repository:
```
git clone --bare git@github.com:syndr/dotfiles.git $HOME/.cfg
```

You can now checkout the actual content with:
```
config checkout
```

**Profit!**


