#!/bin/bash

aux=$(gsettings get org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled)

if $aux ;
then
    gsettings set org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled false && notify-send 'Touchpad Disabled' --icon=dialog-information
else
    gsettings set org.cinnamon.settings-daemon.peripherals.touchpad touchpad-enabled true && notify-send 'Touchpad Enabled' --icon=dialog-information
fi
