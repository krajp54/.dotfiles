#! /bin/sh
scrot -m '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'