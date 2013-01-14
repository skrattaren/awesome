-- Tags

tags = {}
tags.setup = {
    { name = "webb",    layout = layouts[8]  },
    { name = "term",    layout = layouts[2], mwfact = 0.60 },
    { name = "psi",     layout = layouts[3], mwfact = 0.17 },
    { name = "verkterm",layout = layouts[4]  },
    { name = "tekst",   layout = layouts[2], mwfact = 0.60 },
    { name = "6",       layout = layouts[2], hide = true },
    { name = "sieben",  layout = layouts[2]  },
    { name = "8",       layout = layouts[4], hide = true },
    { name = "var",     layout = layouts[1]  }
}

tags.mods = {}
tags.mods[2] = {
    [1] = { name = "doc" },
    [5] = { hide = true },
    [3] = { layout = layouts[4], mwfact = 0.5 },
}

-- Rules (FIXME)
-- Ugly hack: code stored as string to be evaluated after `tags`
-- table definition
add_rules = [[
    add_rules = {
    { rule = { instance = "groupchat_tabs" },
      properties = { tag = tags[2][3] } },
}
]]

-- Custom widgets
widgets = require("widgets")

custom_widgets = { widgets.cpubar }

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

