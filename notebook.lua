-- Tags
tags = {}
tags.mods = {}
tags.setup = {
    { name = "webb",    layout = layouts[8]  },
    { name = "term",    layout = layouts[2]  },
    { name = "psi",     layout = layouts[2], ncol = 2, mwfact = 0.15 },
    { name = "verkterm",layout = layouts[2]  },
    { name = "tekst",   layout = layouts[4]  },
    { name = "6",       layout = layouts[2], hide = true },
    { name = "sieben",  layout = layouts[2]  },
    { name = "8",       layout = layouts[4], hide = true },
    { name = "var",     layout = layouts[1]  }
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

