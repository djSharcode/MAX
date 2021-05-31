#!/bin/bash                                                                                                                
set -euo pipefail            
head -n 17 install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
sed -i 's/#Color/Color/' /etc/pacman.conf ; sed -i 's/#TotalDownload/TotalDownload/' /etc/pacman.conf
RED='\033[1;31m' ; NOC='\033[0m' ; printf "${RED}Enter Root Password: ${NOC}\n"
passwd ; printf "${RED}Enter User Name: ${NOC}" ; read -r ; USN useradd -m -G wheel ${USN} 
passwd "${USN}" ; mkdir /home/${USN}/.config/
sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers
ln -sf /share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc
echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n'  >> /etc/locale.conf 
echo "LC_ALL=en_US.UTF-8" >> /etc/environment ; echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "KEYMAP=us" >> /etc/vconsole.conf ; locale-gen en_US.UTF-8 ; echo "${USN}pc" >> /etc/hostname
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
cd / ; chown root:root /home ; chmod 755 /home ; su ${USN} -c "cd ~" 
su ${USN} -c "curl -sL https://git.io/https://git.io/JGlvv -o /home/${USN}/installMAX.sh" 
su ${USN} -c "sh ~/installMAX.sh"
