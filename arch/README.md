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
- Install all the packages.
- SDDM instructions here: https://github.com/JaKooLit/simple-sddm (if not using GDM) 
  - Edited theme file in `backups`. Needs to be moved to the right location.
  - The Tokyo Pink wallpaper needs to be copied to the correct location.
- Plymouth setup: https://wiki.archlinux.org/title/Plymouth along with the SDDM instructions.
- Fingerprint setup: https://wiki.archlinux.org/title/Fprint
- For random kanji: https://github.com/tanay1337/kanji-files-generator
  - After following the repo instructions, move the generated files to `Documents/kanji`.
- Set [GRUB password](https://wiki.archlinux.org/title/GRUB/Tips_and_tricks#Password_protection_of_GRUB_menu) and add a [pacman hook](https://wiki.archlinux.org/title/Talk:GRUB/Tips_and_tricks#Password_protection_of_non_local_system_boot_options) for unrestricted entry to boot into Arch.
- Set BIOS password and disable booting from USB devices (if on a new device).
- Generate [device policy](https://wiki.archlinux.org/title/USBGuard) for usbguard.

## Enable services

This might not be an exhaustive list:
- NetworkManager
- SDDM/GDM
- `timectl set-ntp true`
- bluetooth
- power-profiles-daemon
- systemd-resolved
- usbguard-dbus

