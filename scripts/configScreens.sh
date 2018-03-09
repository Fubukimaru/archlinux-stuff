#!/bin/bash

AVAIL_SCREENS=`xrandr | grep "\b connected" | awk '{print $1;}'`

for screen in $AVAIL_SCREENS
do
    echo Found screen $screen
    case $screen in
        LVDS1)
            echo "Main Screen. Nothing to be done."
            ;;
        VGA1)
            echo "VGA1. Turning off LVDS1 and configuring VGA1 screen."
            xrandr --output LVDS1 --off --output VGA1 --primary --mode 1280x1024 
            ;;
    esac
done
