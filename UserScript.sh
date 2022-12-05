systemctl start NetworkManager
systemctl enable NetworkManager
ping -c 4 google.com
mkdir repos
cd repos
pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
pacman -Sy
pacman -S wget
chgrp wheel yay/
chmod g+x yay/
cd yay
echo
echo "If there is any build error download Go v.17, with:"
echo
echo "wget https://dl.google.com/go/go1.17.7.linux-amd64.tar.gz"
echo "sudo tar -xvf go1.17.7.linux-amd64.tar.gz"   
echo "sudo mv go /usr/local"
echo
echo "And set GOPATH and GOROOT in ./bashrc file, don't forget to append it to the PATH"
echo
echo "export GOROOT=/usr/local/go"
echo "export GOPATH=$HOME"
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH"
echo
echo "After that you must restart your machine to take effect and restart this script"
makepkg -si
sudo su
pacman -S xorg xorg-server
pacman -S xorg-xinit
pacman -S install xfce4
echo 
echo "----------------------------------------------------------"
echo "to start the desktop envirorment type:"
echo
echo "startxfce4"
echo "----------------------------------------------------------"