from libqtile import widget

from configs.colors import colors

widget_defaults = dict(
    font='Hack Nerd Font Mono',
    # font='UbuntuMono Nerd Font Mono:bold',
    fontsize=12,
    padding=2,
)
extension_defaults = widget_defaults.copy()

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
        widget.CPU(
            format = "{load_percent:>3.0f}%"
        ),
        widget.Clock(
            foreground = colors[2],
            background = colors[5],
            format = "%A, %d %b %H:%M:%S"
        ),
    ]
    return widgets
