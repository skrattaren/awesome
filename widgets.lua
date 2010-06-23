local widget = widget
local timer = timer
local beautiful = beautiful
local awful = awful
require("widget_fun")
local widget_fun = widget_fun
module("widgets")

-- Battery widget
batterywidget = widget({type = "textbox", name = "batterywidget"})
local bat_clo = widget_fun.batclosure("BAT0")
batterywidget.text = bat_clo()
local battimer = timer({ timeout = 31 })
battimer:add_signal("timeout", function() batterywidget.text = bat_clo() end)
battimer:start()

-- Thermal widget
thermowidget = widget({type = "textbox", name = "thermowidget"})
thermowidget.border_width = 1
thermowidget.border_color = beautiful.fg_normal
thermowidget.text = widget_fun.get_temp()
local thermotimer = timer({ timeout = 11 })
thermotimer:add_signal("timeout", function() thermowidget.text = widget_fun.get_temp() end)
thermotimer:start()


-- CPU load widget
cpubar = awful.widget.progressbar()
cpubar:set_gradient_colors({beautiful.gradient_1, beautiful.gradient_2})
cpubar:set_background_color(beautiful.bg_widget)
cpubar:set_ticks(true)
local cputimer = timer({ timeout = 1 })
cputimer:add_signal("timeout", function() cpubar:set_value(widget_fun.get_cpu_load()/100) end)
cputimer:start()

