loadkeys es
ping -q -c1 google.com &>/dev/null && echo online || return 1
echo "Now I will let you create your partitions, just remember you need 3 partitions, 1- minimum 500M, 2- core store partition with your sistem, 3- swap partition to complement ram (minimimum half of your RAM)"
sleep 10
cfdisk
echo "Good Partition"
lsblk
echo "I will let you 10s to see if the partitions are as you wanted, otherwise press Ctrl + C"
sleep 10s
mkfs.vfat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
mount /dev/sda2 /mnt
mount --mkdir /dev/sd1 /mnt/boot
swapon /dev/sda3
pacstrap -K /mnt linux-zen linux-zen-headers linux-firmware networkmanager grub wpa_supplicant base base-devel vim sof-firmware man-pages
genfstab -U /mnt >> /mnt/etc/fstab
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
echo \n
echo "------------------------- type grub-install /dev/sda -----------------------------"
echo "-----------------type grub-mkconfig -o /boot/grub/grub.cfg -----------------------"
echo \n
arch-chroot /mnt
reboot