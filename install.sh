#!/bin/bash

# Display a separator line
echo "----------------------------------------"

# 1. Set Timezone to Asia/Taipei
echo "Setting Timezone to Asia/Taipei..."
sudo timedatectl set-timezone Asia/Taipei
echo "Timezone set to Asia/Taipei."
echo "----------------------------------------"

# 2. APT update / upgrade
echo "Updating and upgrading APT packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
echo "APT packages updated and upgraded."
echo "----------------------------------------"

# 3. Install vmWare Tools
echo "Installing vmWare Tools..."
sudo apt-get install open-vm-tools -y && sudo apt-get install open-vm-tools-desktop -y
echo "vmWare Tools installed."
echo "----------------------------------------"

# 4. Install net-tools Package
echo "Installing net-tools package..."
sudo apt-get install net-tools -y
echo "net-tools package installed."
echo "----------------------------------------"

# 5. Install SSH service
echo "Installing SSH service..."
sudo apt-get install ssh -y
sudo systemctl restart ssh
echo "SSH service installed and restarted."
echo "----------------------------------------"

# 6. Install Brave Browser
echo "Installing Brave Browser..."
sudo apt-get install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser -y
echo "Brave Browser installed."
echo "----------------------------------------"

# 7. Install HTOP
echo "Installing HTOP..."
sudo apt-get install htop -y
echo "HTOP installed."
echo "----------------------------------------"

# 8. Install Wget
echo "Installing Wget..."
sudo apt-get install wget -y
echo "Wget installed."
echo "----------------------------------------"

# 9. Install AnyDesk
echo "Installing AnyDesk..."
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt-get update
sudo apt-get install anydesk -y
echo "AnyDesk installed."
echo "----------------------------------------"

# 10. Install VS Code
echo "Installing VS Code..."
sudo apt-get install gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update
sudo apt-get install code -y
echo "VS Code installed."
echo "----------------------------------------"

# 11. Install VLC
echo "Installing VLC..."
sudo apt-get install vlc -y
echo "VLC installed."
echo "----------------------------------------"

# 12. Install Google Chrome
echo "Installing Google Chrome..."
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y
echo "Google Chrome installed."
echo "----------------------------------------"

# Reboot the OS
echo "Rebooting the OS in 5 seconds..."
sleep 5
sudo reboot
