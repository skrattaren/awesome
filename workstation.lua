-- Tags

tags = {}
tags.setup = {
    { name = "🕸",   layout = layouts[8]  },
    { name = "⚙",   layout = layouts[2], mwfact = 0.60 },
    { name = "👥",   layout = layouts[3], mwfact = 0.17 },
    { name = "🔧",   layout = layouts[4]  },
    { name = "🖉",   layout = layouts[2], mwfact = 0.65 },
    { name = "6",   layout = layouts[2], hide = true },
    { name = "♫",   layout = layouts[2]  },
    { name = "8",   layout = layouts[4], hide = true },
    { name = "♻",   layout = layouts[1]  }
}

tags.mods = {}
tags.mods[2] = {
    [1] = { name = "🎞" },
    [5] = { name = "✉" },
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

