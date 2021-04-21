#!/bin/bash

pulseaudio-ctl mute-input

enable=$(pulseaudio-ctl full-status)

tokens=( $enable )

if [ ${tokens[2]} == "no" ]
then
    notify-send 'Micro Enabled' --icon=dialog-information
else
    notify-send 'Micro Disabled' --icon=dialog-information
fi
