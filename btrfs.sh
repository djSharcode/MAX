#!/usr/bin/env bash
# GPT.efi.BTRFS
# (╯°□°)╯︵ ┻━┻
# Tips                  || Change /dev/sda to /dev/nvme0n1 or what ever the...            #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates       || #Blue                                                          #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sgdisk -Z /dev/sda
sgdisk -n 0:0:+512M -t 1:ef00 -n 0:0:+0 -t 2:8300 /dev/sda
mkfs.vfat /dev/sda1 ; mkfs.btrfs -f /dev/sda2
mount /dev/sda2 /mnt ; cd /mnt
btrfs subvolume create @ ; btrfs subvolume create @usr ; btrfs subvolume create @var
btrfs subvolume create @lib ; btrfs subvolume create @opt ; btrfs subvolume create @etc
btrfs subvolume create @home ; btrfs subvolume create @bin ; btrfs subvolume create @dev
btrfs subvolume create @srv ; btrfs subvolume create @tmp ; btrfs subvolume create @media
cd ; umount /mnt
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@ /dev/sda2 /mnt
mkdir /mnt/{boot,home,usr,var,lib,opt,etc,sbin,bin,dev,srv,tmp,media}
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@home /dev/sda2 /mnt/home
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@usr /dev/sda2 /mnt/usr
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@var /dev/sda2 /mnt/var
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@lib /dev/sda2 /mnt/lib
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@opt /dev/sda2 /mnt/opt
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@etc /dev/sda2 /mnt/etc
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@bin /dev/sda2 /mnt/bin
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@dev /dev/sda2 /mnt/dev
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@srv /dev/sda2 /mnt/srv
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@tmp /dev/sda2 /mnt/tmp
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@media /dev/sda2 /mnt/media
mount /dev/sda1 /mnt/boot
# Tips                  || Yeah, this thing down here is gona' take a while                   #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates       || #Patience                                                          #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
reflector --completion-percent 50 --download-timeout 21 -f 5 --save /etc/pacman.d/mirrorlist >/dev/null 2>&1
timedatectl set-ntp true ; pacman -Syy >/dev/null 2>&1
pacman-key –-init ; pacman-key –-populate archlinux ; pacman-key -–refresh-keys >/dev/null 2>&1
