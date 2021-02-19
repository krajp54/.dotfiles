#!/bin/sh

# Daemon for the battery icon
cbatticon -u 5 &

# Daemon for the eye-care utility
redshift-gtk & disown
