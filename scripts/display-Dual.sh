#!/bin/sh

if xrandr -q | grep "DP2 connected"; then
    xrandr --output eDP1 --auto
    xrandr --output DP2 --auto --right LVDS1
else
    xrandr --output eDP1 --auto
    xrandr --output DP2 --off
fi
