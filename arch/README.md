# Notes for installation

## Helpful links for installation

- https://wiki.archlinux.org/title/Installation_guide
- https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS

Some reference YouTube videos:
- https://www.youtube.com/watch?v=cOobSmI-XgA
- https://www.youtube.com/watch?v=kXqk91R4RwU

## Setting up wifi

- For live boot (iwctl): https://www.youtube.com/watch?v=P_AJZwyoyyE
- For after installation (nmcli): https://www.youtube.com/watch?v=loJKf1zr1bU

## Other steps

- Clone this repo.
- Stow all the folders in `arch` and/or `arch-thinkpad` (depending on the device) and also `wallpapers`.
- Install [yay](https://github.com/Jguer/yay).
- Install all the packages.
```
yay -S $(cat pacman_packages.txt)
```
- Plymouth setup: https://wiki.archlinux.org/title/Plymouth. Don't forget to make edits to the theme (from `backups/plymouth`), set the correct theme in [plymouthd.conf](https://wiki.archlinux.org/title/Plymouth#Changing_the_theme), update GRUB, update `mkininitcpio.conf`, and to regenerate mkinitcpio. 
- Fingerprint setup: https://wiki.archlinux.org/title/Fprint
- For random kanji: https://github.com/tanay1337/kanji-files-generator
  - After following the repo instructions, move the generated files to `Documents/kanji`.
- Add the pacman hook (`backups/grub.hook`) for removing the boot text from GRUB.
- Set [GRUB password](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Password_protection_of_GRUB_menu) and add a [pacman hook](https://wiki.archlinux.org/title/Talk:GRUB/Tips_and_tricks#Password_protection_of_non_local_system_boot_options) for unrestricted entry to boot into Arch.
- Set BIOS password and disable booting from USB devices (if on a new device).
- Generate [device policy](https://wiki.archlinux.org/title/USBGuard) for usbguard.
- Set up [ufw](https://wiki.archlinux.org/title/Uncomplicated_Firewall). Apply [Forward Policy](https://wiki.archlinux.org/title/Uncomplicated_Firewall#Forward_policy) for using Wireguard.
- For printing, add the user to the `lp` group using the following command and reboot: 
```
sudo usermod -aG lp tanay
```
- Instructions for getting the arduino LSP to work with nvim: [general instructions](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#arduino_language_server) and [workaround](https://github.com/arduino/arduino-language-server/pull/199#issuecomment-2519818108).
- Instructions on setting up [hibernation with LUKS](https://gist.github.com/Iwwww/008ef082a52cc509d186889118412aa6).
- Add the battery check cronjob.
  - Enter the following command:
  ```
  crontab -e
  ```
  - Add the following cronjob:
  ```
  */5 * * * * /home/tanay/.local/bin/battery_check
  ```
  - Enter the following command:
  ```
  sudo crontab -e
  ```
  - Add the following cronjob:
  ```
  */5 * * * * /home/tanay/.local/bin/low_battery_hibernate
  ```
- For enabling three-finger drag:
  - Enter the following command for fusuma installation:
  ```
  sudo gpasswd -a $USER input
  ```
  - Follow the instructions to give the current user permissions to [uinput](https://stackoverflow.com/questions/11939255/writing-to-dev-uinput-on-ubuntu-12-04).
  - Follow the instructions to add a [fusuma config](https://github.com/iberianpig/fusuma/issues/173#issuecomment-2058984377) and edit the service file. The last to last command will give you the location of the service file to edit.
    - The service file exists here: `/usr/lib/systemd/user/ydotool.service`. A reference sample is in `backups/ydotool.service`.
  - Enter the following command:
  ```
  systemctl --user enable ydotool --now
  ```
- Set Alacritty as the context menu terminal in Nautilus: `gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty`
- Install Apple emojis: https://github.com/samuelngs/apple-emoji-linux (have sure the folder where you are copying exists).
- Install flatpaks.
```
flatpak install $(cat flatpak_packages.txt)
```

## Enable services

This might not be an exhaustive list:
- NetworkManager
- GDM
- `timedatectl set-ntp true`
- bluetooth
- power-profiles-daemon
- systemd-resolved
- usbguard-dbus
- ufw
- cups.service
- avahi-daemon.service
- cronie.service

