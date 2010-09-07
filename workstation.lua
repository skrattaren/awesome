-- Workstation-specific settings for awesome
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/theme.lua")

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
    [3] = { layout = layouts[3], mwfact = 0.5 },
}

-- Custom widgets
require("widgets")

custom_widgets = widgets.cpubar.widget

