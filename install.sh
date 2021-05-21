#!/bin/bash
set -euo pipefail
# ᶘ ᵒᴥᵒᶅ
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A                                                                 Mozart - Moonlight Sonata  #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist 2>/dev/null
pacman-key --init ; pacman-key --populate archlinux ; pacman-key --refresh-keys >/dev/null 2>&1
pacstrap  /mnt base base-devel linux-zen linux-zen-headers linux-firmware btrfs-progs efibootmgr 
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt
ln -sf "$(/usr/share/zoneinfo/"$(curl -s https://ipapi.co/timezone)")" /etc/localtime ; hwclock --systohc
locale-gen --purge en_US.UTF-8 ; echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n'  >> /etc/locale.conf 
echo "KEYMAP=us" >> /etc/vconsole.conf ; echo -n "PC Name? ; read PN ; "echo "${PN}" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts ; echo "::1 localhost" >> /etc/hosts ; echo "127.0.1.1 rproject.localdomain rproject" >> /etc/hosts
echo "Root Password: " ; passwd ; echo -n "User Name: " ;  read "USN" ; useradd -m -G wheel "${USN}" ; echo -n "$('"{USN}"'s password: ')"
passwd "${USN}" ; echo "$("${USN}" ALL=(ALL) ALL)" >> "$(/etc/sudoers.d/"$(USN)")" ; su "{USN}" ; cd $HOME
sudo pacman -S git vim ; git clone https://aur.archlinux.org/pikaur.git ; cd pikaur/ ; makepkg --fsri ; echo -n "amd or intel? " ; read PCC 
PKR="pikaur -S --noconfirm" ; ${PKR} "$("{PCC}"-ucode)" "$(xf86-video-"{PCC}")" || pikaur -S --noconfirm "$(xf86-video-"{PCC}"gpu)"
${PKR} alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack gst-plugin-pipewire libpulse volumeicon-git vlc
${PKR} networkmanager-git nm-tray-git grub-git grub-btrfs-git mkinitcpio-btrfs sddm-stellar-theme xdg-user-dirs xdg-utils xorg openbox
${PKR} tint2-git firefox-developer-edition picom-git wpgtk-git profanity-python2-git all-repository-fonts obmenu-generator obkey
${PKR} thunar-git thunar-volman-devel thunar-archive-plugin-git thunar-custom-actions gvfs-git gufw htop acpid
${PKR} alacrity-git vim-youcompleteme-git xterm-git geany-git geany-themes-git geany-plugins-git timeshift-autosnap
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
systemctl enable NetworkManager || systemctl enable avahi-daemon || systemctl enable reflector.timer || systemctl enable libvirtd
systemctl enable acpid || systemctl enable sshd || systemctl enable sddm || wpga-install.sh || echo "openbox-session" >> $HOME/.xinitrc
printf "\e[1;31mDone!\e[0m" ; exit ; umount -a ; reboot 
