#!/bin/sh
# Toggle microphone status

pamixer -t --source="alsa_input.pci-0000_05_00.6.analog-stereo"

enabled="$(pamixer --get-mute --source='alsa_input.pci-0000_05_00.6.analog-stereo')"

if $enabled ;
then
    notify-send 'Micro muted' --icon=dialog-information
else
    notify-send 'Micro unmuted' --icon=dialog-information
fi
