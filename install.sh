#!/bin/bash

set +e
trap '' SIGTSTP
trap '' SIGINT

if [ "$EUID" -eq 0 ]; then
    echo "Please run this script as a normal user with sudo privileges."
    echo "This script will not correctly with the root user."
    exit
else
    echo ""
fi

sudo apt update

echo "Welcome to the Scarlet Linux Installer"
echo "This installer requires root priveleges to work correctly."
echo "Please enter password if prompted to do so."

sudo apt install figlet -y
figlet "SCARLET   LINUX"

echo "Welcome to the Scarlet Linux Installer!"
echo "What should this installer do?"
echo ""
echo "1) Install Scarlet Linux on Your Hard Drive."
echo "2) Quit and do nothing."

read -p ">>> " choice

if [ "$choice" == "1" ]; then
    echo ""
else
    echo "Reverting changes"
    sudo apt remove figlet -y
    echo "Exiting installer..."
    exit
fi

sudo apt install kde-plasma-desktop -y
sudo apt install plasma-discover -y
sudo apt install sddm -y
sudo apt install dolphin -y
sudo apt install konsole -y
sudo apt install libreoffice -y
sudo apt install neovim -y
sudo apt install dnf -y
sudo apt install gedit -y
sudo apt install zsh -y
curl -fsS https://dl.brave.com/install.sh | sh
sudo apt install python3 python3-pip -y
sudo apt install ruby -y
sudo apt install vlc -y
sudo apt install figlet -y
sudo apt install flatpak -y
sudo apt install htop -y

sudo add-apt-repository ppa:elementary-os/stable -y
sudo apt install appcenter -y

chsh -s $(which zsh)

sudo systemctl enable sddm
sudo systemctl set-default graphical.target

> ~/.zshrc
echo 'figlet -f small "SCARLET"' >> ~/.zshrc

echo "scarlet" | sudo tee /etc/hostname

figlet "SCARLET  LINUX"

echo "Scarlet Linux has now been installed on your system."

read -p "Press enter to reboot. " entering

sudo reboot
