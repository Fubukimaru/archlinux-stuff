#!/bin/sh
echo '{"version":1}'
echo '['
echo '[],'
exec conky -c $HOME/.config/i3/conky.cfg
