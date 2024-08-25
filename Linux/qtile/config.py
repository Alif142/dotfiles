# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import volume
import os
import subprocess
from libqtile import hook


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])


def set_refresh_rate():
    subprocess.run(
        ["xrandr", "--output", "HDMI-1", "--mode", "1920x1080", "--rate", "120"]
    )


mod = "mod4"
terminal = guess_terminal()


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "left",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "right",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key([mod, "control"], "down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "d", lazy.spawn("rofi -show run"), desc="Launch Rofi"),
    Key(
        [mod, "control"],
        "p",
        lazy.spawn("/home/alif/.config/rofi/powermenu.sh"),
        desc="Open Power Menu",
    ),
    Key([mod, "control"], "left", lazy.to_screen(0), desc="Switch focus to monitor 1"),
    Key([mod, "control"], "right", lazy.to_screen(1), desc="Switch focus to monitor 2"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [
    Group(name="1", label=" ", matches=[Match(wm_class="firefox")]),
    Group(name="2", label=" ", matches=[Match(wm_class="kitty")]),
    Group(name="3", label=" ", matches=[Match(wm_class="Thunar")]),
    Group(name="4", label="󰕼 ", matches=[Match(wm_class="vlc")]),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group(name="9", label=" ", matches=[Match(wm_class="qBittorrent")]),
]


for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


layout_themes = {
    "border_width": 3,
    "margin": 20,
    "border_focus": "6EACDA",
    "border_normal": "021526",
}


layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_themes),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Meslo LGM Nerd Font",
    fontsize=15,
    padding=3,
)
extension_defaults = widget_defaults.copy()


colors = {
    "background": "#0a1020",
    # "background": "#1a1b26",
    "foreground": "#c0caf5",
    "purple": "#bb9af7",
    "blue": "#7aa2f7",
    "pink": "#f7768e",
    "cyan": "#7dcfff",
    "green": "#9ece6a",
    "yellow": "#e0af68",
    "light-grey": "#9CAFAA",
    "orange": "#E85C0D",
}


def init_widgets_list():
    return [
        widget.TextBox(
            text=" 󰣇 ",
            fontsize=30,
            padding=0,
            foreground=colors["blue"],
            background=colors["background"],
        ),
        widget.Image(
            filename="~/.config/qtile/icons/python.png",
            margin=4,
            background=colors["background"],
        ),
        widget.Spacer(length=8),
        widget.CurrentLayoutIcon(scale=0.65, padding=4),
        widget.GroupBox(
            font="Meslo LGM Nerd Font",
            fontsize=16,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=6,
            borderwidth=0,
            active=colors["foreground"],
            inactive=colors["foreground"],
            rounded=False,
            highlight_method="block",
            urgent_alert_method="block",
            urgent_border=colors["pink"],
            this_current_screen_border=colors["blue"],
            this_screen_border=colors["background"],
            other_current_screen_border=colors["background"],
            other_screen_border=colors["background"],
            foreground=colors["foreground"],
            background=colors["background"],
            hide_unused=True,
        ),
        widget.Spacer(length=8),
        widget.WindowName(
            format="{name}",
            foreground=colors["foreground"],
            background=colors["background"],
            padding=8,
            max_chars=50,
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["blue"],
            background=colors["background"],
        ),
        widget.Net(
            interface="enp4s0",
            use_bits=False,
            format="󰾅 {down:.2f} ↓↑ {up:.2f}",
            foreground=colors["background"],
            background=colors["blue"],
            padding=5,
            update_interval=5.0,
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["purple"],
            background=colors["blue"],
        ),
        widget.Volume(
            fmt="  {}",
            step=5,  # Volume change step
            get_volume_command="pamixer --get-volume-human",
            mute_command="pamixer -t",
            volume_up_command="pamixer -i 5",
            volume_down_command="pamixer -d 5",
            foreground=colors["background"],
            background=colors["purple"],
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["blue"],
            background=colors["purple"],
        ),
        widget.CPU(
            format="  {load_percent}%",
            foreground=colors["background"],
            background=colors["blue"],
            padding=15,
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["purple"],
            background=colors["blue"],
        ),
        widget.Memory(
            format="  {MemUsed:.0f}M/{MemTotal:.0f}M",
            foreground=colors["background"],
            background=colors["purple"],
            padding=15,
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["blue"],
            background=colors["purple"],
        ),
        widget.Clock(
            format="  %a, %b %d - %I:%M",
            foreground=colors["background"],
            background=colors["blue"],
            padding=15,
        ),
        widget.TextBox(
            text="",
            fontsize=30,
            padding=0,
            foreground=colors["purple"],
            background=colors["blue"],
        ),
        widget.QuickExit(
            default_text="  ",
            fontsize=14,
            padding=15,
            foreground=colors["background"],
            background=colors["purple"],
        ),
    ]


screens = [
    Screen(
        top=bar.Bar(
            widgets=init_widgets_list(),
            opacity=0.90,
            size=26,
            background=colors["background"],
            margin=[5, 20, 5, 20],
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets=init_widgets_list(),
            opacity=0.90,
            size=26,
            background=colors["background"],
            margin=[5, 20, 5, 20],
        ),
    ),
]
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
