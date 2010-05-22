-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/theme.lua")

-- Tags
tags = {}
tags.setup = {
    { name = "webb",    layout = layouts[7]  },
    { name = "term",    layout = layouts[1]  },
    { name = "psi",     layout = layouts[1], ncol = 2, mwfact = 0.15 },
    { name = "verkterm",layout = layouts[1]  },
    { name = "IDE",     layout = layouts[8]  },
    { name = "6",       layout = layouts[1], hide   = true },
    { name = "sieben",  layout = layouts[1]   },
    { name = "8",       layout = layouts[1], hide   = true },
    { name = "var",     layout = layouts[8]  }
}

require("widget_fun")

-- Battery widget
batterywidget = widget({type = "textbox", name = "batterywidget"})
bat_clo = widget_fun.batclosure("BAT0")
batterywidget.text = bat_clo()
battimer = timer({ timeout = 31 })
battimer:add_signal("timeout", function() batterywidget.text = bat_clo() end)
battimer:start()

-- Thermal widget
thermowidget = widget({type = "textbox", name = "thermowidget"})
thermowidget.border_width = 1
thermowidget.border_color = beautiful.fg_normal
thermowidget.text = widget_fun.get_temp()
thermotimer = timer({ timeout = 11 })
thermotimer:add_signal("timeout", function() thermowidget.text = widget_fun.get_temp() end)
thermotimer:start()


-- CPU load widget
cpubar = awful.widget.progressbar()
cpubar.set_width = 66
cpubar.margin = {3, 3, 3, 3}
cpubar.set_ticks = true
cputimer = timer({ timeout = 1 })
cputimer:add_signal("timeout", function() cpubar:set_value(widget_fun.get_cpu_load()/100) end)
cputimer:start()


-- Create custom widget table
custom_widgets = {
                thermowidget,
                batterywidget,
                -- cpubar.widget,
                }

