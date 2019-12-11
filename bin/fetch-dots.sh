#!/bin/bash
# TODO make this smarter

# i3
cp $HOME/.config/i3/config $PROJECT/i3/

# polybar
cp $HOME/.config/polybar/config $PROJECT/polybar/

# compton
cp $HOME/.config/compton.conf $PROJECT/compton.conf

# tmux
cp $HOME/.tmux.conf $PROJECT/tmux.conf

# tmux
cp $HOME/.vimrc $PROJECT/vimrc

# gtk
cp $HOME/.gtkrc-2.0 $PROJECT/gtk/gtk-2.0
cp $HOME/.config/gtk-3.0/settings.ini $PROJECT/gtk/gtk-3.0-settings.ini

# X stuff
cp $HOME/.Xresources $PROJECT/Xstuff/Xresources

# bin stuff
cp /usr/local/bin/desktop-refresh.sh $PROJECT/bin/desktop-refresh.sh
cp /usr/local/bin/fetch-dots.sh $PROJECT/bin/fetch-dots.sh
cp /usr/local/bin/startup.sh $PROJECT/bin/startup.sh
