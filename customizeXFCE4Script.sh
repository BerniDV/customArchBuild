#We can test with lightdm

sudo su

pacman -S iwl

timedatectl set-timezone Europe/Madrid
pacman -S open-vm-tools
pacman -S xf86-video-vmware xf86-input-vmmouse
systemctl enable vmtoolsd

#install opera and configure it (https://wiki.archlinux.org/title/opera)
pacman -S opera

echo
echo "Change resolution under settings -> aparence"
echo
read -n 1 -p "Press any key when ready:"


reboot