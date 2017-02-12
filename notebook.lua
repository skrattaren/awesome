-- Tags
tags = {}
tags.mods = {}
tags.setup = {
    { name = "🕸",   layout = layouts[8]  },
    { name = "⚙",   layout = layouts[2]  },
    { name = "👥",   layout = layouts[2], ncol = 2, master_width_factor = 0.15 },
    { name = "🔧",   layout = layouts[2]  },
    { name = "🖉",   layout = layouts[4], master_width_factor = 0.6 },
    { name = "6",   layout = layouts[2], hide = true },
    { name = "♫",   layout = layouts[2]  },
    { name = "8",   layout = layouts[4], hide = true },
    { name = "♻",   layout = layouts[1]  }
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

