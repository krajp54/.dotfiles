# --- .File for Qtile Config --- #
# ! Author: JP (Juan Pablo Rodriguez)
# ! GitHub: krajp54

import subprocess

from os import path
from libqtile import hook
from Xlib import display as xdisplay

from typing import List

from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
my_explorer = "thunar"
br_path = '/sys/class/backlight/amdgpu_bl0/brightness'
br_max_path = '/sys/class/backlight/amdgpu_bl0/max_brightness'
hard_color = 'FADF7A'
soft_color = '804455'
micro_cmd = terminal + " -e ./.scripts/toggle-micro.sh"
touchpad_cmd = terminal + " -e ./.scripts/toggle-touchpad.sh"
screenshots_cmd = "shutter --no_session"

# * Launch the autostart file
qtile_path = path.join(path.expanduser('~'), ".config", "qtile")


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, 'autostart.sh')])

# * Launch every dialog window as a floating window


@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True


floating_types = ["notification", "toolbar", "splash", "dialog"]

# Firefox Library Window display as a floating window


@hook.subscribe.client_new
def float_firefox(window):
    wm_class = window.window.get_wm_class()
    w_name = window.window.get_name()
    if wm_class == ("Places", "firefox") and w_name == "Library":
        window.floating = True

# * Key Bindings Settings


keys = [

    # Switch focus between windows in current stack pane
    Key([mod], "k", lazy.layout.up(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.down(),
        desc="Move focus up in stack pane"),
    Key([mod], "h", lazy.layout.left(),
        desc="Move focus left in stack pane"),
    Key([mod], "l", lazy.layout.right(),
        desc="Move focus right in stack pane"),

    # Change window sizes (MonadTall)
    Key([mod, "shift"], "l", lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc="Grow size of focus window"),
    Key([mod, "shift"], "h", lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc="Shrink size of focus window"),

    # Move windows in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),
    Key([mod, "control"], "h", lazy.layout.shuffle_left(),
        desc="Move window right in current stack "),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(),
        desc="Move window left in current stack "),

    # Actions for the monitors
    Key([mod], "a", lazy.to_screen(0),
        desc="Move focus to monitor 1"),
    Key([mod], "s", lazy.to_screen(1),
        desc="Move focus to monitor 2"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Launch guess terminal
    Key([mod], "Return", lazy.spawn(terminal),
        desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(),
        desc="Next available layout"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(),
        desc="Previous available layout"),

    # Direct actions from Qtile
    Key([mod], "w", lazy.window.kill(),
        desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(),
        desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(),
        desc="Shutdown qtile"),
    # Key([mod], "r", lazy.spawncmd(),
    #     desc="Spawn a command using a prompt widget"),

    # Keybindings for Rofi
    Key([mod], "m", lazy.spawn("rofi -show drun"),
        desc="Launch Rofi Run List"),
    Key([mod, 'shift'], "m", lazy.spawn("rofi -show"),
        desc="Launch Rofi list for the open windows"),

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 3"),
        desc="Decrease volume of default source"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 3"),
        desc="Increase volume of default source"),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute"),
        desc="Mute volume of default source"),

    # Microphone
    Key([mod, "control"], "F4", lazy.spawn(micro_cmd),
        desc="Mute/Unmute microphone"),

    # Touchpad
    Key([], "XF86TouchpadToggle", lazy.spawn(touchpad_cmd),
        desc="Enable/Disable the touchpad"),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +1%"),
        desc="Increase brightness of the screen"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 1%-"),
        desc="Decrease brightness of the screen"),

    # CMus Player (Music Player)
    Key([mod, "shift"], "p", lazy.spawn(terminal + " -e cmus"),
        desc="Launch Cmus Player"),
    Key([mod], "Down", lazy.spawn("cmus-remote -u"),
        desc="Play-pause-command"),
    Key([mod], "Right", lazy.spawn("cmus-remote -n"),
        desc="Next-command"),
    Key([mod], "Left", lazy.spawn("cmus-remote -r"),
        desc="Prev-command"),

    # Shutter (Screenshots)
    Key([mod, "shift"], "s", lazy.spawn(screenshots_cmd + " -s"),
        desc="Launch Shutter for a selection screenshot"),
    Key([mod], "Print", lazy.spawn(screenshots_cmd + " --full"),
        desc="Take a screenshot of full desktop"),

    # Launch Firefox
    Key([mod, "shift"], "f", lazy.spawn("firefox"),
        desc="Launch Firefox Browser"),

    # Launch FileExplorer
    Key([mod, "shift"], "t", lazy.spawn(my_explorer),
        desc="Launche File Explorer"),

    # Toggle between keyboards layout
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout")
]

# * Workspaces Settings


group_names = [
    ("爵", {'layout': 'max'}),
    ("", {'layout': 'monadtall'}),
    ("", {'layout': 'zoomy'}),
    ("", {'layout': 'floating'}),
    ("", {'layout': 'floating'}),
    ("♫", {'layout': 'monadtall'})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another workspace
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))

    # Send focus window to another workspace
    keys.append(Key([mod, "shift"], str(
        i), lazy.window.togroup(name, switch_group=True)))

# * Layouts Settings

layout_theme = {
    "border_width": 2,
    "margin": 5,
    "border_focus": hard_color,
    "border_normal": soft_color
}

layouts = [
    layout.Floating(**layout_theme),
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Zoomy(
        **layout_theme,
        columnwidth=300,
    ),
]

# * Qtile v0.17 update
# Refactoring the mouse callbacks


def open_calendar():
    qtile.cmd_spawn(terminal + " -e khal interactive")


def rofi_show_run():
    qtile.cmd_spawn("rofi -show run")


def logout_view():
    qtile.cmd_spawn("arcolinux-logout")


def launch_stacer():
    qtile.cmd_spawn('stacer')


def launch_htop():
    qtile.cmd_spawn(terminal + " -e htop")


def launch_fe():
    qtile.cmd_spawn(my_explorer)


def launch_pavucontrol():
    qtile.cmd_spawn('pavucontrol')


# * Widgets Settings

widget_defaults = dict(
    font='Caskaydia Cove Nerd Font',
    fontsize=13,
    padding=5,
)
extension_defaults = widget_defaults.copy()


def wid_groups(): return widget.GroupBox(
    font='HeavyData Nerd Font',
    fontsize=19,
    margin=3,
    padding=8,
    borderwidth=2,
    rounded=False,
    highlight_method='line',
    disable_drag=True,
    use_mouse_wheel=False,
    this_current_screen_border=hard_color,
    this_screen_border=hard_color,
    other_current_screen_border=soft_color,
    other_screen_border=soft_color
)


def custom_sep(): return widget.TextBox(
    text='',
    font='HeavyData Nerd Font',
    fontsize=15,
    #  foreground=hard_color,
    padding=0,
)


def custom_clock(): return widget.Clock(
        format='%B %d - %H:%M',
        mouse_callbacks={
            'Button1': open_calendar
        }
    )


def wid_top_main_screen(): return [
    widget.TextBox(
        text='',
        fontsize=25,
        padding=10,
        mouse_callbacks={
            'Button1': rofi_show_run
        }
    ),
    widget.Sep(
        linewidth=0,
        padding=5
    ),
    wid_groups(),
    widget.WindowName(),
    widget.Wlan(
        interface="wlp4s0",
        format='{essid}'
    ),
    widget.Net(
        interface="wlp4s0",
        format='{down} ↓↑ {up}',
        padding=1
    ),
    custom_sep(),
    widget.CurrentLayoutIcon(
        scale=0.9
    ),
    custom_sep(),
    widget.KeyboardLayout(
        configured_keyboards=['us', 'latam']
    ),
    custom_sep(),
    widget.Systray(),
    custom_sep(),
    custom_clock(),
    widget.TextBox(
        text=' ',
        fontsize=15,
        padding=3,
        mouse_callbacks={
            'Button1': logout_view
        }
    ),
]


def wid_bottom_main_screen(): return [
    widget.Cmus(
        play_color=hard_color,
        noplay_color=soft_color
    ),
    widget.Sep(
        linewidth=0
    ),
    widget.Spacer(),
    widget.TextBox(
        text="",
        fontsize=18
    ),
    widget.CheckUpdates(
        update_interval=3600,
        distro='Arch',
        display_format='Updates: {updates}',
        custom_command='checkupdates',
        no_update_string='N/A'
    ),
    widget.TextBox(
        text='﬙',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_stacer
        }
    ),
    widget.CPU(
        format='CPU: {load_percent}%'
    ),
    widget.TextBox(
        text='',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_htop
        }
    ),
    widget.Memory(
        format='Mem: {MemUsed}M'
    ),
    widget.TextBox(
        text='',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_fe
        }
    ),
    widget.DF(
        format='({uf}{m}|{r:.0f}%)',
        visible_on_warn=False
    ),
    widget.TextBox(
        text='墳',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_pavucontrol
        }
    ),
    widget.PulseVolume(),
    widget.TextBox(
        text='',
        fontsize=18
    ),
    widget.Backlight(
        backlight_name='amdgpu_bl0',
        #  brightness_file=br_path,
        #  max_brightness_file=br_max_path,
        change_command='brightnessctl set {0}',
        step=5
    ),
]


def wid_second_screen(): return [
    wid_groups(),
    widget.WindowName(),
    custom_sep(),
    widget.CurrentLayoutIcon(
        scale=0.85
    ),
    custom_sep(),
    widget.KeyboardLayout(
        configured_keyboards=['us', 'latam'],
        option='grp:win_space_toggle'
    ),
    custom_sep(),
    widget.TextBox(
        text='﬙',
        fontsize=18
    ),
    widget.CPU(
        format='CPU: {load_percent}%'
    ),
    widget.TextBox(
        text='',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_htop
        }
    ),
    widget.Memory(
        format='Mem: {MemUsed}M'
    ),
    widget.TextBox(
        text='墳',
        fontsize=18,
        mouse_callbacks={
            'Button1': launch_pavucontrol
        }
    ),
    widget.PulseVolume(),
    widget.TextBox(
        text='',
        fontsize=18
    ),
    widget.Backlight(
        brightness_file=br_path,
        max_brightness_file=br_max_path,
        change_command='brightnessctl set {0}',
        step=5
    ),
    custom_sep(),
    custom_clock(),
]

# * Screens


def get_num_monitors():
    num_monitors = 0
    try:
        display = xdisplay.Display()
        screen = display.screen()
        resources = screen.root.xrandr_get_screen_resources()

        for output in resources.outputs:
            monitor = display.xrandr_get_output_info(
                output, resources.config_timestamp)
            preferred = False
            if hasattr(monitor, "preferred"):
                preferred = monitor.preferred
            elif hasattr(monitor, "num_preferred"):
                preferred = monitor.num_preferred
            if preferred:
                num_monitors += 1
    except Exception as e:
        return 1
    else:
        return num_monitors


num_monitors = get_num_monitors()

screens = [
    Screen(
        top=bar.Bar(wid_top_main_screen(), opacity=0.75, size=20),
        bottom=bar.Bar(wid_bottom_main_screen(), opacity=0.75, size=17)
    )
]

if num_monitors > 1:
    for n in range(num_monitors - 1):
        screens.append(
            Screen(
                top=bar.Bar(wid_second_screen(), opacity=0.75, size=20),
            ),
        )

# * Mouse Events for dragging floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# * Qtile variables settings

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
        Match(wm_class='confirm'),
        Match(wm_class='dialog'),
        Match(wm_class='download'),
        Match(wm_class='error'),
        Match(wm_class='file_progress'),
        Match(wm_class='notification'),
        Match(wm_class='splash'),
        Match(wm_class='toolbar'),
        Match(wm_class='Arandr'),
        Match(wm_class='arcolinux-logout'),
        Match(title='Open File'),
        Match(title='Stacer'),
        Match(title='Nitrogen')
    ],
    **layout_theme
)

auto_fullscreen = True
focus_on_window_activation = "urgent"

wmname = "LG3D"
