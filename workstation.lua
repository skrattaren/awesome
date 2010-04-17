-- GentooBook specific settings for awesome
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/theme.lua")

tags = {}
tags.setup = {
    { name = "webb",    layout = layouts[7]  },
    { name = "term",    layout = layouts[1], mwfact = 0.60 },
    { name = "psi",     layout = layouts[2], mwfact = 0.17 },
    { name = "verkterm",layout = layouts[1]  },
    { name = "IDE",     layout = layouts[8]  },
    { name = "6",       layout = layouts[1], hide   = true },
    { name = "sieben",  layout = layouts[1]   },
    { name = "8",       layout = layouts[1], hide   = true },
    { name = "var",     layout = layouts[8]  }
}


