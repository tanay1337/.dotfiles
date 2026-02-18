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
- Stow all the folders in `arch` and also `wallpapers`.
- Install [yay](https://github.com/Jguer/yay).
- Install all the packages.
```
yay -S $(cat pacman_packages_DEVICE.txt)
```
- Fingerprint setup: https://wiki.archlinux.org/title/Fprint
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
- Set Alacritty as the context menu terminal in Nautilus: `gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty`
- Install Apple emojis: https://github.com/samuelngs/apple-emoji-linux (have sure the folder where you are copying exists).

## Enable services

This might not be an exhaustive list:
- NetworkManager
- `timedatectl set-ntp true`
- bluetooth
- power-profiles-daemon
- systemd-resolved
- usbguard-dbus
- ufw
- cups.service
- avahi-daemon.service
- cronie.service

