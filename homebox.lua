local awful = require("awful")

-- Tags
tags = {}
local layout_suit = awful.layout.suit
tags.setup = {
    { name = "🕸", properties = { layout = layout_suit.max  }},
    { name = "⚙", properties = { layout = layout_suit.tile  }},
    { name = "👥", properties = { layout = layout_suit.tile.left,
                                 master_width_factor = 0.17 }},
    { name = "🔧", properties = { layout = layout_suit.tile  }},
    { name = "🖉", properties = { layout = layout_suit.tile.bottom,
                                 master_width_factor = 0.69 }},
    { name = "6", properties = { layout = layout_suit.tile, hide = true }},
    { name = "♫", properties = { layout = layout_suit.tile  }},
    { name = "8", properties = { layout = layout_suit.tile.bottom, hide = true }},
    { name = "♻", properties = { layout = layout_suit.floating  }}
}

tags.mods = {}
tags.mods[2] = {
    [1] = { name = "🎞" },
    [5] = { name = "✉" },
    [3] = { properties = { layout = layout_suit.tile.bottom,
                           master_width_factor = 0.5 }},
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

