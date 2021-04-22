# Openbox Config

<!-- markdownlint-configure-file { "MD013": { "line_length": 500 } } -->

![Openbox](../../screenshots/openbox.png)

## Table of contents

1. [About Openbox](#about-openbox)
2. [Autostart](#autostart)
3. [Menu](#menu)
4. [Source File](#source-file)

### About Openbox

Extract from the official [website] for Openbox

"Openbox is a highly configurable, next generation window manager with extensive standards support."

[website]: http://openbox.org/wiki/Main_Page

Because Openbox is only a window manager in case we want a panel, like the one shown in the image, we need to install an external application such as Tint2, Xmobar, Polybar, etc. In this case, I use [Tint2](https://gitlab.com/o9000/tint2) in my configuration.

### Autostart

The "[autostart](autostart)" file that will be executed at logon within the window manager. This file contains all the bash commands for the operating system utility daemons.

#### My autostart file

```bash
# Launch the panel
tint2 &

# Daemon for the volume icon
volumeicon &

# Daemon for the eye-care utility
redshift-gtk & disown
```

### Menu

Openbox has as a feature an integrated menu that contains shortcuts to applications of our Unix system, besides giving us the possibility of executing customized actions directly from the menu. All the menu configurations are defined in the [menu](menu.xml) file, in this case, I have used the "[menumaker]" tool for the automatic generation of this file.

[menumaker]: http://menumaker.sourceforge.net/

### Source File

All the own configurations of the Openbox window manager are defined in the [rc](rc.xml) file.

I personally consider that the official [documentation](http://openbox.org/wiki/Help:Configuration) provides a clear and detailed explanation of each of the elements contained in the configuration file, so I highly recommend reviewing this documentation to make your custom Openbox configuration.
