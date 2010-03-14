local io = io
local math = math
local naughty = naughty
local beautiful = beautiful
local tonumber = tonumber

module("battery")
-- Based on http://awesome.naquadah.org/wiki/Gigamo_Battery_Widget

function batteryInfo(adapter)
    spacer = " "
    local fcur = io.open("/sys/class/power_supply/"..adapter.."/charge_now")    
    local fcap = io.open("/sys/class/power_supply/"..adapter.."/charge_full")
    local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
    local cur = fcur:read()
    local cap = fcap:read()
    local sta = fsta:read()
    local battery = math.floor(cur * 100 / cap)
    if sta:match("Charging") then
        dir = "↑"
        battery = battery.."%"
    elseif sta:match("Discharging") then
        dir = "↓"
        if tonumber(battery) > 25 and tonumber(battery) < 75 then
            battery = battery
        elseif tonumber(battery) < 25 then
            if tonumber(battery) < 10 then
                naughty.notify({title = "⚡ Lystring! ⚡",
                                text = "Batteriet har nått låg nivå ( ⚡ "..battery.."%)!",
                                timeout = 7,
                                position = "bottom_right",
                                fg = beautiful.fg_focus,
                                bg = beautiful.bg_focus
                                })
            end
            battery = battery
        else
            battery = battery
        end
    battery = battery.."%"
    else
        dir = ""
        battery = "⚡"
    end
    fcur:close()
    fcap:close()
    fsta:close()
    return spacer.."Bat:"..spacer..dir..battery..dir..spacer
end

