-- Tags
tags = {}
tags.mods = {}
tags.setup = {
    { name = "webb",    layout = layouts[7]  },
    { name = "term",    layout = layouts[1], mwfact = 0.60 },
    { name = "psi",     layout = layouts[2], mwfact = 0.17 },
    { name = "verkterm",layout = layouts[1]  },
    { name = "IDE",     layout = layouts[8]  },
    { name = "6",       layout = layouts[1], hide = true },
    { name = "sieben",  layout = layouts[1]   },
    { name = "8",       layout = layouts[1], hide = true },
    { name = "var",     layout = layouts[8]  }
}

tags.mods[2] = {
    [1] = { name = "doc" },
    [5] = { hide = true },
    [3] = { layout = layouts[4], mwfact = 0.5 },
}

-- Rules
add_rules = {
--    { rule = { instance = "groupchat_tabs" },
--      properties = { tag = tags[2][3] } },
}

-- Custom widgets
require("widgets")

custom_widgets = widgets.cpubar.widget

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

