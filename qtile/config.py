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

import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal(preference="alacritty")
home = os.path.expanduser('~')

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # App launcher
    Key([mod], "space", lazy.spawn("rofi -combi-modi drun,window,ssh -show combi -modi combi"), desc="Start application launcher."),

    # Emoji picker
    Key([mod], "period", lazy.spawn("rofimoji --skin-tone light"), desc="Start emoji picker in rofi."),

    # Setup script
    Key([mod, "control"], "space", lazy.spawn(terminal + " --working-directory ~/dotfiles/setup/ -e 'bash ~/dotfiles/setup/setup.sh'"), desc="Run my setup bash script."),

    # Screenshot
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Make screenshot using flameshot."),
]

groups_setup = [
    ("plus",    {'label': '1',  'layout': 'monadtall'}),
    ("ecaron",  {'label': '2',  'layout': 'monadtall'}),
    ("scaron",  {'label': '3',  'layout': 'monadtall'}),
    ("ccaron",  {'label': '4',  'layout': 'monadtall'}),
    ("rcaron",  {'label': '5',  'layout': 'monadtall'}),
    ("zcaron",  {'label': '6',  'layout': 'monadtall'}),
    ("yacute",  {'label': '7',  'layout': 'monadtall'}),
    ("aacute",  {'label': '8',  'layout': 'monadtall'}),
    ("iacute",  {'label': '9',  'layout': 'monadtall'}),
    ("eacute",  {'label': '10', 'layout': 'monadtall'})
]

groups = [Group(name, **kwargs) for name, kwargs in groups_setup]

for i in groups:
    keys.extend([

        # Workspace navigation
        Key([mod], i.name, lazy.group[i.name].toscreen()), 
        Key([mod], "Tab", lazy.screen.next_group()),	   	
        Key([mod, "control"], i.name, lazy.window.togroup(i.name)), 
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()), 
    ])

layouts = [
    layout.Columns(border_focus_stack='#d75f5f'),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    layout.Stack(num_stacks=2),
    layout.Bsp(),
    layout.Matrix(),
    layout.MonadTall(),
    layout.MonadWide(),
    layout.RatioTile(),
    layout.Tile(),
    layout.TreeTab(),
    layout.VerticalTile(),
    layout.Zoomy(),
]

widget_defaults = dict(
    font='Hack Nerd Font Mono:style=Bold',
    fontsize=12,
    padding=2,
)
extension_defaults = widget_defaults.copy()

colors = [["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens

# colors = {
#     'panel_bg': ["#282c34", "#282c34"], # panel background
#     'tab_active': ["#3d3f4b", "#434758"], # background for current screen tab
#     'font': ["#ffffff", "#ffffff"], # font color for group names
#     '': ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
#     '': ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
#     'line_active': ["#e1acff", "#e1acff"], # window name
#     'line_inactive': ["#ecbbfb", "#ecbbfb"]
# }

def default_separator(padding = 6):
    return widget.Sep(
        linewidth = 0,
        padding = padding,
        foreground = colors[2],
        background = colors[0]
    )

def init_default_widgets():
    widgets = [
        default_separator(),
        widget.GroupBox(
            # font = "Ubuntu Bold",
            margin_y = 3,
            margin_x = 0,
            padding_y = 5,
            padding_x = 6,
            borderwidth = 3,
            active = colors[2],
            inactive = colors[7],
            rounded = False,
            highlight_color = colors[1],
            highlight_method = "line",
            this_current_screen_border = colors[6],
            this_screen_border = colors[4],
            other_current_screen_border = colors[6],
            other_screen_border = colors[4],
            foreground = colors[2],
            background = colors[0]
        ),
        widget.Spacer(),
        widget.TextBox(
            text = '',
            background = colors[4],
            foreground = colors[5],
            padding = 0,
            fontsize = 65
        ),
        widget.Clock(
            foreground = colors[2],
            background = colors[5],
            format = "%A, %d %B %H:%M:%S"
        ),
    ]
    return widgets

def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_default_widgets(), opacity=1.0, size=30)),
        Screen(top=bar.Bar(widgets=init_default_widgets(), opacity=1.0, size=30)),
    ]

if __name__ in ["config", "__main__"]:
    screens = init_screens()

# screens = [
#     Screen(
#         bottom=bar.Bar(
#             [
#                 widget.CurrentLayout(),
#                 widget.GroupBox(),
#                 widget.Prompt(),
#                 widget.WindowName(),
#                 widget.Chord(
#                     chords_colors={
#                         'launch': ("#ff0000", "#ffffff"),
#                     },
#                     name_transform=lambda name: name.upper(),
#                 ),
#                 widget.TextBox("default config", name="default"),
#                 widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
#                 widget.Systray(),
#                 widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
#                 widget.QuickExit(),
#             ],
#             24,
#         ),
#     ),
# ]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def start_once():
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"