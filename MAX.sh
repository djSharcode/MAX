#!/bin/bash  
setfont ter-124b 
A='\e[1;31m' ; B='\e[0m' 
C='name,size -e 7,11' ; lsblk -do ${C}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Mozart - Moonlight Sonata  ||  A='\e[1;31m' | B='\e[0m' | C="name,size -e 7,11" | read -r D | E="/dev/${D}"
#  0:35 ━❍──────── -5:32     ||  F='btrfs su cr @' | G='mount -o noatime,compress=zstd,discard=async,subvol=@'
#       ↻     ⊲  Ⅱ  ⊳     ↺       ||  H='pacman' | I='TotalDownload' | J='MODULES=' | K='/etc/mkinitcpio.conf'
#    VOLUME: ▁▂▃▄▅▆▇ 100%   ||  L='xf86-video-' | M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" | N="intel/amd-ucode"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
printf "${A}Device name: ${B}" ; read -r D ; E="/dev/${D}" ; sgdisk ${E} -Z -o -n 1::+512M -t 1:EF00 -n -i -v -p 
E1="$(ls /dev/* | grep -E "^${E}p?1$")" ; E2="$(ls /dev/* | grep -E "^${E}p?2$")" ; mkfs.vfat "${E1}" ; mkfs.btrfs -fq "${E2}"
F='btrfs su cr @' ; G='mount -o noatime,compress=zstd,discard=async,subvol=@'
mount "${E2}" /mnt ; cd /mnt ; ${F} ; ${F}home ; ${F}snapshots ; ${F}var_log ; ${F}usr ; ${F}lib ; ${F}opt 
${F}etc ; ${F}bin ; ${F}dev ; ${F}srv ; ${F}tmp ; ${F}media ; cd ; umount /mnt ; ${G} "${E2}" /mnt 
mkdir /mnt/{boot,home,.snapshots,var_log,usr,lib,opt,etc,bin,dev,srv,tmp,media} 
${G}home "${E2}" /mnt/home ; ${G}snapshot "${E2}" /mnt/.snapshots ; ${G}var_log "${E2}" /mnt/var/log ; ${G}usr "${E2}" /mnt/usr 
${G}lib "${E2}" /mnt/lib ; ${G}lib "${E2}" /mnt/lib ; ${G}opt "${E2}" /mnt/opt ; ${G}etc "${E2}" /mnt/etc 
${G}bin "${E2}" /mnt/bin ; ${G}dev "${E2}" /mnt/dev ; ${G}srv "${E2}" /mnt/srv ; ${G}tmp "${E2}" /mnt/tmp 
${G}media "${E2}" /mnt/media ; mount "${E1}" /mnt/boot ; lsblk -o ${C} ; curl -sL https://git.io/JGWKK > /mnt/install.sh
H='pacman' ; I='TotalDownload' ; sed -i "s/#${I}/${I}/" /etc/${H}.conf ; gpg -k ; ${H}-key --init ; ${H}-key --populate archlinux >/dev/null
reflector -p https -c "$(curl -s https://ipapi.co/country_name)" -f 2 --save /etc/${H}.d/mirrorlist
J='MODULES=' ; K='/etc/mkinitcpio.conf' ; L='xf86-video-' ; M="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)"
if [[ "${M}" == "Intel" ]] ; then N="intel-ucode ${L}intel" && sed -i "s/${J}()/${J}(i915 btrfs)/" ${K}
elif [[ "${M}" == "AMD" ]] ; then N="amd-ucode ${L}amdgpu" && sed -i "s/${J}()/${J}(amdgpu btrfs)/" ${K} ; fi
#lspci -k | grep -A 2 -E "(VGA|3D)" ; echo "Sectoion "Module" \nLoad "modesetting" \nEndSection" >> /etc/X11/xorg.conf
#echo "Section "OutputClass" \n Identifer "intel"\n"MatchDriver "i915" \nDriver "modesetting"\n EndSection"
#echo "Section "OutputClass" \n Identifer "nvidia"\n"MatchDriver "nvidia-drm" \nDriver "nvidia"\nOption "PrimaryGPU" "yes"\n
#echo "ModulePath"/usr/lib/nvidia/xorg" \nModulePath "/usr/lib/xorg/modles"\n EndSection\n\nSection "Device""
#echo "Identifer "nvidia" \nBusID "<BusID for NVIDIA device>" \nOption "AllowEMptyInitialConfiguration"\nEndSection"
#/etc/X11/xorg.conf.d/nvidia-drm-outputclass.conf cp /usr/share/X11/xorg.conf.d/nvidia-drm-outputclass.conf
pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware networkmanager efibootmgr grub vim ${N}
genfstab -U /mnt >> /mnt/etc/fstab ; arch-chroot /mnt sh ./install.sh
