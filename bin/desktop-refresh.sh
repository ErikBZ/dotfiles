#!/bin/bash

xrdb $HOME/.Xresources

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
polybar middle &
polybar right &

killall -q compton
while pgrep -u $UID -x compton > /dev/null; do sleep 1; done
compton -b -f &

