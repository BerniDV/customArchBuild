loadkeys es
ping -q -c1 google.com &>/dev/null && echo online || return 1
echo
echo "Now I will let you create your partitions, just remember you need 3 partitions, 1- minimum 500M, 2- core store partition with your sistem, 3- swap partition to complement ram (minimimum half of your RAM)"
echo
sleep 10
cfdisk
echo
echo "Good Partition"
echo
lsblk
echo
echo "I will let you 10s to see if the partitions are as you wanted, otherwise press Ctrl + C"
echo
sleep 10s
mkfs.vfat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
mount /dev/sda2 /mnt
mount --mkdir /dev/sd1 /mnt/boot
swapon /dev/sda3
pacstrap -K /mnt linux-zen linux-zen-headers linux-firmware networkmanager grub wpa_supplicant base base-devel vim sof-firmware man-pages
genfstab -U /mnt >> /mnt/etc/fstab
echo
echo "Now execute chrootScript"
echo
mkdir /mnt/customArchBuild
cp customArchBuild/chrootScript.sh /mnt/customArchBuild/
arch-chroot /mnt