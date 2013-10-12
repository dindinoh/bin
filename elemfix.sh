!/bin/bash

sudo apt-add-repository ppa:versable/elementary-update
sudo apt-get update

sudo apt-get upgrade

sudo apt-get install elementary-tweaks wingpanel-slim indicator-synapse chromium-browser firefox cable gazette linux-generic-lts-raring dconf-tools

echo 'Installing Flash for Midori' &&
read -p 'Press Enter to continue, or abort by pressing CTRL+C' nothing &&
mkdir -p ~/.mozilla/plugins &&
wget http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.297/install_flash_player_11_linux.i386.tar.gz &&
tar -zxvf install_flash_player_11_linux.i386.tar.gz libflashplayer.so &&
rm install_flash_player_11_linux.i386.tar.gz &&
if [ $(getconf LONG_BIT) = '64' ]
then
	mv libflashplayer.so ~/.mozilla/plugins/libflashplayer.32.so && 
	sudo apt-get install nspluginwrapper ia32-libs
else
	mv libflashplayer.so ~/.mozilla/plugins/libflashplayer.so && 
	sudo apt-get install nspluginwrapper
fi &&
nspluginwrapper -a -v -n -i

echo ""
echo "now reboot"
