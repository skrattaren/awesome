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

require("widget_fun")

-- CPU load widget
cpubar = awful.widget.progressbar()
cpubar:set_gradient_colors({"#4f7f4fff", "#d3d3d3ff"})
cpubar:set_background_color("#3F3F3F")
cpubar:set_ticks(true)
cputimer = timer({ timeout = 1 })
cputimer:add_signal("timeout", function() cpubar:set_value(widget_fun.get_cpu_load()/100) end)
cputimer:start()

-- Custom widgets
custom_widgets = cpubar.widget

