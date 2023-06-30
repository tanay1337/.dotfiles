# My Configuration ✨

1. Install [Brew](https://brew.sh/) and `xcode-select`.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
xcode-select --install
```

2. In the home folder, run the following command (to be replaced with ansible):

```
git clone https://github.com/tanay1337/.dotfiles.git
cd .dotfiles
brew bundle install
stow zsh bin nvim tmux mutt khard
```

3. Generate a new [application password](https://support.google.com/accounts/answer/185833?hl=en#zippy=%2Cwhy-you-may-need-an-app-password) for Gmail. Run the following command:
```
security add-generic-password -U -a EMAIL -s mutt -w APP_PASSWORD
```

4. Export contacts from emails. If they are in a single `.vcf` file, use [this tool](https://github.com/jakeogh/vcardtool).
```
take .contacts
git clone https://github.com/jakeogh/vcardtool.git
cd vcardtool
python3 setup.py install
cd .. && rm -rf vcardtool
mkdir proton
vcardtool split proton.vcf proton/
```

## Credits

I got my config inspiration from the following repositories:
- https://github.com/ThePrimeagen/.dotfiles
- https://github.com/cpow/cpow-dotfiles
- https://github.com/ParthPant/dotfiles
- https://github.com/elijahmanor/dotfiles
- https://github.com/nikolovlazar/dotfiles
