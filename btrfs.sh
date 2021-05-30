PMT="${PR} /mnt"
 ; cd ; umount /mnt ; ${MNT} {PMT} ; mkdir /mnt/{boot,home,usr,var,lib,opt,etc,sbin,bin,dev,srv,tmp,media}
${MNT}home {PMT} ;${MNT}usr {PMT} ;${MNT}var {PMT} ;${MNT}lib {PMT} ;${MNT}opt {PMT} ; ${MNT}etc {PMT} ;
${MNT}bin {PMT} ;${MNT}dev {PMT} ;${MNT}srv {PMT} ;${MNT}tmp {PMT}; ${MNT}media {PMT} ;mount "${PB}" /mnt/boot  
lsblk -o name,size,type,mountpoint -e 7,11 
#curl -sL https://git.io/Jsde3 --output install.sh ; chmod +x install.sh ;  ./install.sh
#!/bin/bash  
set -euo pipefail 
setfont ter-120b 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#    Tom Holkenborg a.k.a. Junkie XL.   #                                                                                                                     ||
#           13:37 ━━━━❍━ -15:38         #                                                                                                                            ||
#            ↻     ⊲  Ⅱ  ⊳     ↺          #                                                                                                                           ||
#           VOLUME: ▁▂▃▄▅▆▇ 100%        #                                                                                                                       ||
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
lsblk -do name,size -e 7,11 ; RED='\033[1;31m' ; NOC='\033[0m'; printf "${RED}Device name: ${NOC}" ; read SDA 
sgdisk -Z /dev/$SDA ; sgdisk -o -n 1::+512M -t 1:EF00 -n -i -p /dev/$SDA ; BT="/dev/$SDA" ; BC="btrfs su cr @" 
PB="$(ls /dev/* | grep -E "^${BT}p?1$")" ; PR="$(ls /dev/* | grep -E "^${BT}p?2$")" 
MU="mount -o noatime,compress=zstd,discard=async,subvol=@" ; mkfs.vfat "${PB}" ; mkfs.btrfs -fq "${PR}" 
mount "${PR}" /mnt ; cd /mnt ; ${BC} ; ${BC}home ; ${BC}snapshots ; ${BC}var_log ; ${BC}usr ; ${BC}lib ; ${BC}opt 
${BC}etc ; ${BC}bin ; ${BC}dev ; ${BC}srv ; ${BC}tmp ; ${BC}media ; cd ; umount /mnt ; ${MU} "${PR}" /mnt  
mkdir /mnt/{boot,home,.snapshots,var_log,usr,lib,opt,etc,bin,dev,srv,tmp,media} ; ${MU}home "${PR}" /mnt/home
${MU}snapshot "${PR}" /mnt/.snapshots ; ${MU}var_log "${PR}" /mnt/var/log ; ${MU}usr "${PR}" /mnt/usr 
${MU}lib "${PR}" /mnt/lib ; ${MU}lib "${PR}" /mnt/lib ; ${MU}opt "${PR}" /mnt/opt ; ${MU}etc "${PR}" /mnt/etc 
${MU}bin "${PR}" /mnt/bin ; ${MU}dev "${PR}" /mnt/dev ; ${MU}srv "${PR}" /mnt/srv ; ${MU}tmp "${PR}" /mnt/tmp 
${MU}media "${PR}" /mnt/media ; mount "${PB}" /mnt/boot ; lsblk -o name,size,type,mountpoint -e 7,11 ; sleep 5
curl -sL https://git.io/JGWKK > install.sh ; cp install.sh /mnt/install.sh ; chmod +x /mnt/install.sh 
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/pacman.d/mirrorlist
sed -i 's/#Color/Color/' /etc/pacman.conf ; sed -i 's/#TotalDownload/TotalDownload/' /etc/pacman.conf
gpg -k ; pacman-key --init ; pacman-key --populate archlinux >/dev/null
pacstrap -i /mnt base-devel git ; genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
