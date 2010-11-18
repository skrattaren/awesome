local widget = widget
local timer = timer
local beautiful = beautiful
local awful = awful
require("widget_fun")
local widget_fun = widget_fun
require("vicious")
local vicious = vicious
module("widgets")

-- Battery widget
batterywidget = widget({type = "textbox", name = "batterywidget"})
vicious.register(batterywidget, vicious.widgets.bat, widget_fun.batclosure(),
                    31, "BAT0")

-- Thermal widget
thermowidget = widget({type = "textbox", name = "thermowidget"})
thermowidget.border_width = 1
thermowidget.border_color = beautiful.fg_normal
vicious.register(thermowidget, vicious.widgets.thermal, widget_fun.watch_temp,
                    11, "thermal_zone0")

-- CPU load widget
cpubar = awful.widget.progressbar()
cpubar:set_gradient_colors({beautiful.gradient_1, beautiful.gradient_2})
cpubar:set_background_color(beautiful.bg_widget)
cpubar:set_ticks(true)
vicious.register(cpubar, vicious.widgets.cpu, "$1", 1)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

