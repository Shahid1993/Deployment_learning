#!/bin/bash
 
# apt-fast
printf "\n\ninstalling apt-fast repository\n"
sudo add-apt-repository -y ppa:apt-fast/stable
 
# tweaking tools
################
 
# ubuntu-tweak
printf "\n\ninstalling ubuntu-tweak repository\n"
sudo add-apt-repository -y ppa:tualatrix/ppa
 
# administration tools
######################
 
# y-ppa manager
printf "\n\ninstalling y-ppa repository\n"
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
 
# nemo
printf "\n\ninstalling nemo repository\n"
sudo add-apt-repository -y ppa:gwendal-lebihan-dev/cinnamon-stable
 
# appearence
############
printf "\n\ninstalling faenza-icon repository\n"
sudo add-apt-repository -y ppa:tiheum/equinox
printf "\n\ninstalling webupd8team repository\n"
sudo add-apt-repository -y ppa:webupd8team/themes
 
# zukiwi
printf "\n\ninstalling noobslab repository\n"
sudo add-apt-repository -y ppa:noobslab/themes
 
# applications
##############
 
printf "\n\ninstalling canonical partner repository\n"
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
 
# now let's install everything
##############################
 
printf "\n\nabout to update package list\n"
sudo apt-get update
 
printf "\n\ninstall apt-fast\n"
sudo apt-get install apt-fast
 
# tweaking tools
################
 
sudo apt-fast install ubuntu-tweak
sudo apt-fast install unity-tweak-tool
sudo apt-fast install gnome-tweak-tool
 
# administration tools
######################
 
sudo apt-fast install synaptic
sudo apt-fast install bleachbit
 
# y-ppa manager
sudo apt-fast install y-ppa-manager
 
# nemo
sudo apt-fast install nemo nemo-fileroller
 
sudo apt-fast install indicator-multiload
 
# gnome-desktop-item-edit utility
sudo apt-fast install --no-install-recommends gnome-panel
 
# show all startup applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
 
# appearence
############
 
sudo apt-fast install faenza-icon-theme faience-* 
sudo apt-fast install gnome-cupertino-gtk-theme
 
# zukiwi
sudo apt-fast install zukitwo-theme zukitwo zukiwi
 
sudo apt-fast install compizconfig-settings-manager compiz-plugins-extra
 
# applications
##############
sudo apt-fast install skype
sudo apt-fast install flashplugin-installer
sudo apt-fast install vlc
sudo apt-fast install chromium-browser 
sudo apt-fast install terminator 
sudo apt-fast install meld
 
# clean up
##########
 
sudo apt-get autoremove indicator-messages
sudo apt-get autoremove telepathy-indicator
sudo apt-get autoremove unity-lens-shopping unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-video
 
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
 
# refresh everything
 
sudo apt-get update
sudo apt-fast dist-upgrade
