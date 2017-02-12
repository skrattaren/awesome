local wibox = require("wibox")
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
cpubar = wibox.widget.progressbar()
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
mytextclock.format = " %a, %d %b | %H:%M "

function set_time(textclock)
    textclock:set_markup(os.date(textclock.format))
end

function keep_adjusted(textclock)
    local function do_reset()
        set_time(textclock)
        if textclock.timer then textclock.timer:stop() end
        local secs = 60 - tonumber(os.date("%S"))
        textclock.timer = gears.timer { timeout = secs }
        textclock.timer:connect_signal("timeout",
            function()
                textclock.timer:stop()
                textclock.timer = gears.timer { timeout = 60 }
                textclock.timer:connect_signal("timeout",
                                        function() set_time(textclock) end)
                textclock.timer:start()
            end )
        textclock.timer:start()
    end
    do_reset()
    textclock.reset_timer = gears.timer { timeout = 3600 }
    textclock.reset_timer:connect_signal("timeout", do_reset)
    textclock.reset_timer:start()
end

keep_adjusted(mytextclock)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

