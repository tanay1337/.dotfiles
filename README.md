# My Configuration

1. Install [Brew](https://brew.sh/) and [Ansible](https://www.ansible.com/).

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible
```

2. In the home folder, run the following command (to be replaced with ansible):

```
git clone https://github.com/tanay1337/.dotfiles.git
cd .dotfiles
stow zsh
stow nvim
stow tmux
```

## Credits

I got my config inspiration from the following sources:
- https://github.com/ThePrimeagen/.dotfiles
- https://github.com/cpow/cpow-dotfiles
- https://github.com/ParthPant/dotfiles
- https://github.com/elijahmanor/dotfiles
