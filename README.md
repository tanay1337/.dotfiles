# My Configuration ✨

Preview of my setup on Arch.

<img src="https://i.imgur.com/2M3PGeS.jpeg" width="500" />
<img src="https://i.imgur.com/Q0fB7MC.jpeg" width="500" />
<img src="https://i.imgur.com/AKgZTO5.jpeg" width="500" />

Preview of my setup on macOS.

<img src="https://i.imgur.com/aGJecUZ.png" width="500" />

## Setup 

### macOS

1. Install [Brew](https://brew.sh/) and [Oh My Zsh](https://ohmyz.sh/).

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
```

2. In the home folder, run the following command (to be replaced with ansible):

```
git clone https://github.com/tanay1337/.dotfiles.git
cd .dotfiles/macOS
brew bundle install
stow alacritty zsh bin nvim tmux mutt khard
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
- https://github.com/josean-dev/dev-environment-files
- https://github.com/joshmedeski
- https://gitlab.com/stephan-raabe/dotfiles
