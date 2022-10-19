#!/bin/bashlsmod
echo ----1.Set Timezone to Asia/Taipei----
sudo timedatectl set-timezone Asia/Taipei
#確認時區 timedatectl
ehco ----------SetTimezone Finish----------

echo ----2.APT update / upgrade----
sudo apt-get update -y && apt-get upgrade -y
ehco ----------APT Update Finish----------

echo ----3.Install vmWare Tools-----
sudo apt-get install open-vm-tools -y && apt-get install open-vm-tools-desktop -y
ehco ----------Install vmWare Tools Finish----------

echo ----4.Install net-tools Package----
sudo apt-get install net-tools -y
ehco ----------Install net-tools Finish----------

echo ----5.Install SSH service----
sudo apt-get install ssh -y
sudo ./etc/init.d/ssh restart
#config File > vi /etc/ssh/sshd_config
#Check service ssh status
ehco ----------Install SSH Service Finish----------


echo ----6.Install Brave Broswer----
#參考這邊https://brave.com/linux/
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y
echo ----------Install Brave Broswer Finish----------

echo ----7.Install HTOP----
sudo apt-get install htop -y
echo ----------Install HTOP Finish----------

echo ----8.Install Wget ----
sudo apt-get install wget -y
echo ----------Install Wget Finish----------

echo ----9.Install AnyDesk ----
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y
#Web link = http://deb.anydesk.com/howto.html
echo ----------Install Anydesk Finish----------

echo ----10.Install VS Code ----
sudo apt-get install gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code
echo ----------Install VS Code Finish----------

echo ----11.Install VLC ----
sudo apt install vlc -y
echo ----------Install VLC Finish----------

echo ----12.Install Google Chrome ----
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add –
sudo gpedit /etc/apt/sources.list.d/google.list
sudo deb http://dl.google.com/linux/chrome/deb/ stable main
sudo apt update
sudo apt-get install google-chrome-stable -y
echo ----------Install Google Chrome Finish----------


echo ----OS Will Reboot----
sleep 5
sudo reboot
