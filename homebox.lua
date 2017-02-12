local awful = require("awful")
-- Tags

tags = {}
local layouts = awful.layout.layouts
tags.setup = {
    { name = "🕸",  properties = { layout = layouts[8]  }},
    { name = "⚙",  properties = { layout = layouts[2]  }},
    { name = "👥", properties = { layout = layouts[3], master_width_factor = 0.17 }},
    { name = "🔧", properties = { layout = layouts[2]  }},
    { name = "🖉",  properties = { layout = layouts[4], master_width_factor = 0.69 }},
    { name = "6",  properties = { layout = layouts[2], hide = true }},
    { name = "♫",  properties = { layout = layouts[2]  }},
    { name = "8",  properties = { layout = layouts[4], hide = true }},
    { name = "♻",  properties = { layout = layouts[1]  }}
}

tags.mods = {}
tags.mods[2] = {
    [1] = { name = "🎞" },
    [5] = { name = "✉" },
    [3] = { properties = { layout = layouts[4], master_width_factor = 0.5 }},
}

-- Rules (FIXME)
-- Ugly hack: code stored as string to be evaluated after `tags`
-- table definition
add_rules = [[
    add_rules = {
    { rule = { class = "LeechCraft.Azoth.MUCTab" },
      properties = { tag = tags[2][3] } },
}
]]

-- Custom widgets
widgets = require("widgets")

custom_widgets = { widgets.cpubar }

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

