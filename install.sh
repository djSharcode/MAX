#!/bin/bash   
head -n 35 install.sh | tail -n 33
#....................................                  ....     .:::::::::::::::::::::::::::::::::..............................
#...........................:::.....            .....:::::::::.::::::::::::::::::::::::::::::::::::::...........................
#..................:..:::::::::::::.            ..:::::::::::::::.:::::::::::::::::::::::::::::::::::::........::::.:::.........
#.................::::::::::::::::::             .::::::::::::::::::::::::::::::::::::::::::::::::::::::...:::::::::::::::.::..:
#::::::::::...::::::::::::::::::::::             ..:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::.:
#.::::::::::::::::::::::::::::::::::.        .....::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#...::::::::::::::::::::::::::::::::...      ........   ...:::....::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::        .......  .:....::  ...::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::..      ....::::....:::::....:xxxxxx::::::::::::::::::::::::..::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::: ...    .....:::::::::::::::::xxxxxxxxxxxx::::::::::::.         ..:::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::x::         ......:::...:::::::::::xxxxxxx::x::xx:::::.               .:::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::x           .......:.   ..::::::::xxxxx:xxxxxx:::::.     ....... .  . ::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::.             ......... .   ..:::::::::::xxxxxxxx:::.     . ..:.:.. .... :::::::::::::::::::::
#::::::::::::::::::::::::::::::.             .    ...    .......:x::::::::::xxxxxx::::       .. ......  .. :::::::::::::::::::::
#::::::::::::::::::::::::::::::..:..                  .........:xxxxxxxxxxxxxxxxxx::::            ...      :::::::::::::::::::::
#:::::::::::::::::::xx::::::::. ..                   .........:::::xxxxxxxxxxx:::xx:::..                   .::::::::::::::::::::
#:::::::::::.         ..:::::..:.:.                  . .......:::::::::::xxxx::::::::: .  ..  ::. .:.....  .::::::::::::::::::::
#:::::::::.         . .::::::::..::::...              ..    .::::::::::::x::::::::::::.....::::x:::::::::....:::::::::::::::::::
#:::::::.            .:::::::::::....::::..             ..  .::::::::::::::::::::::::::::::::.::::::::::.:::::::::::::::::::::::
#:::::::              ...................::...            .. .::::::::::::::::::::::::::..:::....:::::..::::::::::::::::::::::::
#::::::.             ....            ......::..             ..:::::::::::::::::::::::::::..:.....:::::..:.::::::::::::::::::::::
#:::::....            ...                .........           :::::::::::::::::::::::::::::....:::::::....:::::::::::::::::::::::
#::::...                                   .......:           ......:::::::::::::::::::::::....:::::...:::::::::::::::xxxx::::::
#::::..                                     .........         .   ..:xx::::::::::::::::::::::.:::...  .:::::::::::::xxxxxxxxxxxx
#::::.                                          ......            ...:x::::::::::::::::::::::.........::::::::::::::xxxxxxxxxxxx
#:::..                  .                          ...            ......x::::::::::::::::::::.......:::::::::::::::xxxxxxxxxxxx:
#::..                   .                                          ..::::::::::::::::::::::::.......::::..   ... ....:xxxxxxxxxx
#::.                    . .                                         ...:::xx::::::::::::x::.......:::..:::..... ....:::::xxxxx::
#::.  .                  .                                          ...:xxxxx:xx:::::....   .....:::.   .:.. ........     ::::::
#::  .                 ..                     .                     ...:xxxxxxxx:::..... .......::.        .       ...   ...::::
#::..                                          .                    ...::xxxxxxx::.. .........:::.                    .. .::::::
#::..                .  .                     ..  ..     . . ..      ..:.xxxxxx::............:::::.                     ..::::::
#::.                    .                   ....             .       ..:.xxxxxx:..... .....::::..  .                    ..::::::
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#A='\e[1;31m' ; B='\e[0m' ; C='printf' ; D='en_US.UTF-8' ; E='GRUB_GFXMODE=' ; F='/etc/pacman.conf' 
#G='TotalDownload' ; H='/etc/locale.' ; I='/etc/host' ; J='echo "Try again"' ; W='%wheel ALL=(ALL) ALL' ; P='passwd' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
#sed -i 's/#Color/Color/' ${F} ; sed -i "s/#${G}/${G}/" ${F} ; pacman -S --needed git cmake freetype2 fontconfig pkg-config  
#${C} "${A}Enter Root Password: ${B}\n" ; until ${P}  ; do ${J} ; done ; ${C} "${A}Enter User Name: ${B}" ;  read -r U 
#
#useradd -m -G wheel ${U} ; until ${P} ${U} ; do ${J} ; done ; sed -i "s/# ${W}/ ${W}/" /etc/sudoers 
#curl -sL https://git.io/JGlvv > /home/${U}/installMAX.sh
#ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
#echo "LC_ALL=${D}" >> /etc/environment ; echo "${D} UTF-8" >> ${H}gen ; echo "LANG=${D}" >> ${H}conf ; locale-gen ${D} 
#echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> ${I}s ; echo "${U}pc" >> ${I}name
#${C} "${A}GRUB INSTALL ${B}\n" ; sed -i 's/'${E}'auto/'${E}'1920x1080,auto/' /etc/default/grub 
#sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=""/${}loglevel=3 quiet splash nvidia-drm.modeset=1/' /etc/default/grub 
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
#cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command 'sh ~/installMAX.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
