-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/theme.lua")

-- Tags
tags = {}
tags.mods = {}
tags.setup = {
    { name = "webb",    layout = layouts[7]  },
    { name = "term",    layout = layouts[1]  },
    { name = "psi",     layout = layouts[1], ncol = 2, mwfact = 0.15 },
    { name = "verkterm",layout = layouts[1]  },
    { name = "IDE",     layout = layouts[8]  },
    { name = "6",       layout = layouts[1], hide = true },
    { name = "sieben",  layout = layouts[1]  },
    { name = "8",       layout = layouts[1], hide = true },
    { name = "var",     layout = layouts[8]  }
}

--[[
tags.mods[1] = {
    [8] = { hide = false }
}
--]]

require("widgets")

-- Create custom widget table
custom_widgets = {
                widgets.thermowidget,
                widgets.batterywidget,
                widgets.cpubar.widget,
                }

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

