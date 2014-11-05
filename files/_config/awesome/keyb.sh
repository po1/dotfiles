#!/bin/sh

setxkbmap -variant altgr-intl -option ctrl:nocaps
if xinput | grep -q 'GlidePoint'; then
    xinput set-prop 15 289 -48 -48
fi
