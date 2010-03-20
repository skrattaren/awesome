local io = io
local math = math
local naughty = naughty
local beautiful = beautiful
local tonumber = tonumber
local coroutine = coroutine

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
    local prefix = "⚡"

    if sta:match("Charging") then
        dir = "↑"
    elseif sta:match("Discharging") then
        dir = "↓"
        prefix = "Bat:"
        if tonumber(battery) < 25 then
            naughty.notify({title = "⚡ Lystring! ⚡",
                            text = "Batteriet har nått låg nivå ( ⚡ "..battery.."%)!",
                            timeout = 7,
                            position = "bottom_right",
                            fg = beautiful.fg_focus,
                            bg = beautiful.bg_focus
                            })
        end
    else
        dir = ""
        battery = ""
    end
    if dir ~= "" then battery = battery.."%" end
    fcur:close()
    fcap:close()
    fsta:close()
    -- coroutine.yield(spacer.."Bat:"..spacer..dir..battery..dir..spacer)
    return spacer..prefix..spacer..dir..battery..dir..spacer
end

