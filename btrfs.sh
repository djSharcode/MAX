#!/usr/bin/env bash
# GPT.efi.BTRFS
# (╯°□°)╯︵ ┻━┻
# Tips                  || Change /dev/sda to /dev/nvme0n1 or what ever the...            #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates       || #Blue                                                          #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do name,size -e 7,11 ; read -r -p "$(tput setaf 6)$(tput bold)Device name: $(tput sgr0)" sda ;
BT="/dev/${sda}" ;sgdisk -o -n 1::+512M -t 1:EF00 -n -i -p /dev/$sda ; PB="$(ls /dev/* | grep -E "^${BT}p?1$")" 
PR="$(ls /dev/* | grep -E "^${BT}p?2$")" ;mkfs.vfat "${PB}" ; mkfs.btrfs -fq "${PR}" ; mount "${PR}" /mnt ; cd /mnt ;
BSC="btrfs subvolume create @" ;MNT="mount -o noatime,compress=zstd,discard=async,subvol=@" PMT="${PR} /mnt"
$BSC ; {$BSC}usr ; {$BSC}var ; {$BSC}lib ; {$BSC}opt ; {$BSC}etc ;{$BSC}home ; {$BSC}bin ; {$BSC}dev ;{$BSC}srv ;
{$BSC}tmp ; {$BSC}media ; cd ; umount /mnt ; ${MNT} {PMT} ; mkdir /mnt/{boot,home,usr,var,lib,opt,etc,sbin,bin,dev,srv,tmp,media}
${MNT}home {PMT} ;${MNT}usr {PMT} ;${MNT}var {PMT} ;${MNT}lib {PMT} ;${MNT}opt {PMT} ; ${MNT}etc {PMT} ;
${MNT}bin {PMT} ;${MNT}dev {PMT} ;${MNT}srv {PMT} ;${MNT}tmp {PMT}; ${MNT}media {PMT} ;mount "${PB}" /mnt/boot  
lsblk -o name,size,type,mountpoint -e 7,11 
#curl -sL https://git.io/Jsde3 --output install.sh ; chmod +x install.sh ;  ./install.sh
