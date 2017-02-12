local awful = require("awful")

-- Tags
tags = {}
local layout_suit = awful.layout.suit
tags.mods = {}
tags.setup = {
    { name = "🕸", properties = { layout = layout_suit.max  }},
    { name = "⚙", properties = { layout = layout_suit.tile  }},
    { name = "👥", properties = { layout = layout_suit.tile,
                                 ncol = 2, master_width_factor = 0.15 }},
    { name = "🔧", properties = { layout = layout_suit.tile  }},
    { name = "🖉", properties = { layout = layout_suit.tile.bottom,
                                 master_width_factor = 0.6 }},
    { name = "6", properties = { layout = layout_suit.tile, hide = true }},
    { name = "♫", properties = { layout = layout_suit.tile  }},
    { name = "8", properties = { layout = layout_suit.tile.bottom, hide = true }},
    { name = "♻", properties = { layout = layout_suit.floating  }}
}

--[[
tags.mods[1] = {
    [8] = { hide = false }
}
--]]

widgets = require("widgets")

-- Create custom widget table
custom_widgets = {
                widgets.cpubar,
                widgets.batterywidget,
                widgets.thermowidget,
                }

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

