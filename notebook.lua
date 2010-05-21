-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme/theme.lua")

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

-- Create a battery widget
batterywidget = widget({type = "textbox", name = "batterywidget", align = "right" })

-- Create a thermal widget
thermowidget = widget({type = "textbox", name = "thermowidget", align = "right"})
thermowidget.border_width = 1
thermowidget.border_color = beautiful.fg_normal

-- Custom widgets
require("widget_fun")

-- Battery
bat_clo = widget_funs.batclosure("BAT0")
batterywidget.text = bat_clo()
battimer = timer({ timeout = 31 })
battimer:add_signal("timeout", function() batterywidget.text = bat_clo() end)
battimer:start()

-- Temperature
thermowidget.text = widget_funs.get_temp()
thermotimer = timer({ timeout = 11 })
thermotimer:add_signal("timeout", function() thermowidget.text = widget_funs.get_temp() end)
thermotimer:start()


-- Create custom widget table
custom_widgets = {
                thermowidget,
                batterywidget,
                }


