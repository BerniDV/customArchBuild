pacman -Sy git
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo \n
echo "--------------  uncoment your localization  -----------------" 
echo \n
sleep 5s
cd /mnt
sudo su
vim /etc/locale.gen
locale-gen
cat LANG=en_US.UTF-8 > /etc/locale.conf
cat KEYMAP=es > /etc/vconsole.conf
cat BD.OS > /etc/hostname
echo \n
echo "--------------------- set root password --------------------"
echo \n
sleep 3s
passwd
useradd -m berni
echo \n
echo "-------------- set user password --------------------"
echo \n
passwd berni
echo \n
echo "---------------- uncoment wheel group ---------------"
echo \n
usermod -aG wheel berni
groups berni
pacman -S sudo
echo \n
echo "uncoment group wheel can be root"
echo \n
vim /etc/sudoers
echo \n
echo "create your own dns to LAN -> IP  NAMEHOST"
echo \n
sleep 3
vim /etc/hosts
pacman -S neofetch
neofetch

echo "The computer will restart in 10s"
echo "You will want to use systemctl start networkmanager followed by systemctl enable networkmanager to have ethernet conexion"
echo "as with wpa_supplicant to have wifi connection"
sleep 10s
reboot