local wibox = require("wibox")
local timer = timer
local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")
local os = os
local tonumber = tonumber
local widget_fun = require("widget_fun")
local vicious = require("vicious")
module("widgets")

-- Battery widget
batterywidget = wibox.widget.textbox()
vicious.register(batterywidget, vicious.widgets.bat, widget_fun.batclosure(),
                    31, "BAT0")

-- Thermal widget
thermowidget = wibox.widget.textbox()
thermowidget:set_align("center")
-- set width
thermowidget.fit = function(widget, width, height)
    local _, h = wibox.widget.textbox.fit(widget, width, height)
    return 29, h
end

-- set border
thermowidget.draw = function(thermowidget, wibox_, cr, width, height)
    cr:rectangle(1/2, 1/2, width - 1, height - 1)
    cr:set_source(gears.color(beautiful.fg_normal))
    cr:stroke()
    wibox.widget.textbox.draw(thermowidget, wibox_, cr, width, height)
end
vicious.register(thermowidget, vicious.widgets.thermal, widget_fun.watch_temp,
                    11, "thermal_zone0")

-- CPU load widget
cpubar = awful.widget.progressbar()
local colour1, colour2
colour1 = beautiful.gradient_1 or "#4f7f4fff"
colour2 = beautiful.gradient_2 or "#d3d3d3ff"
gradient_colour = {type="linear", from={0.5, 0.5}, to={100, 20},
                   stops={{0, colour1}, {1, colour2}}}
cpubar:set_color(gradient_colour)
cpubar:set_background_color(beautiful.bg_widget)
cpubar:set_ticks(true)
vicious.register(cpubar, vicious.widgets.cpu, "$1", 1)

-- Correct textclock, updated only when needed
mytextclock = wibox.widget.textbox()
local format = " %a, %d %b | %H:%M "
mytextclock.set_time = function() mytextclock:set_markup(os.date(format)) end
mytextclock.set_time()
local secs = 60 - tonumber(os.date("%S"))
mytextclock.timer = timer { timeout = secs }
mytextclock.timer:connect_signal("timeout", function()
                            mytextclock.set_time()
                            mytextclock.timer:stop()
                            mytextclock.timer = timer { timeout = 60 }
                            mytextclock.timer:connect_signal("timeout",
                                                        mytextclock.set_time)
                            mytextclock.timer:start() end
                            )
mytextclock.timer:start()

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

