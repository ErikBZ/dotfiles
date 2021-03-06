#!/bin/bash

# manual
add-apt-repository ppa:kgilmer/speed-ricer

apt update
apt upgrade -y

# prereqs
apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev \
            libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config \
            python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
            libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 \
            -y 

# the stuff i actually wanted
apt install curl wget i3-gaps feh git zsh arandr compton rofi lxappearance neovim -y

# vscode and spotify
snap install --classic spotify
snap install --classic code 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/.config/i3
mkdir -p ~/.fonts

cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf
cp ./vimrc ~/.vimrc
cp ./i3/config ~/.config/i3/config
cp ./gtk/gtkrc-3.0-settings.ini ~/.gtk-3.0/settings.ini
cp ./gtk/gtk-2.0 .gtkrc-2.0

# dependancy for i3
# seems like this causes some package issues TODO fix this later
#wget -O /tmp/playerctl.deb https://github.com/altdesktop/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb
#dpkg -i /tmp/playerctl.deb

# build polybar
wget -O /tmp/polybar.tar https://github.com/polybar/polybar/releases/download/3.4.1/polybar-3.4.1.tar
tar -xf /tmp/polybar.tar -C /tmp/

# this needs some interaction
cd /tmp/polybar/
/tmp/polybar/build.sh
cd -

# fonts
wget -O /tmp/AnkaCC.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/anka-coder-fonts/AnkaCoderCondensed.1.100.zip
wget -O /tmp/AnkaC.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/anka-coder-fonts/AnkaCoder.1.100.zip
wget -O /tmp/fontawesome.tar.gz https://github.com/FortAwesome/Font-Awesome/archive/5.11.2.tar.gz
unzip  -d ~/.fonts /tmp/AnkaCC.zip
rm ~/.fonts/OFL.txt
unzip  -d ~/.fonts /tmp/AnkaC.zip

tar -C ~/.fonts -xzf /tmp/fontawesome.tar.gz --wildcards "*.ttf" --strip-components 2
rm -rf ~/.fonts/@fortawesome

# vscode
