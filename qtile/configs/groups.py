from libqtile.config import Group, Key
from libqtile.lazy import lazy

from configs.globals import *

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

def get_group_keys():
    group_keys = []
    for i in groups:
        group_keys.extend([
            # Workspace navigation
            Key([mod], i.name, lazy.group[i.name].toscreen()), 
            Key([mod], "Tab", lazy.screen.next_group()),	   	
            Key([mod, "control"], i.name, lazy.window.togroup(i.name)), 
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()), 
        ])
    return group_keys
