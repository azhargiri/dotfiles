#!/usr/bin/luajit

local open = io.open
local tempfile0 = "/sys/class/thermal/thermal_zone0/temp"
local tempfile1 = "/sys/class/thermal/thermal_zone1/temp"
local tempfile2 = "/sys/class/thermal/thermal_zone2/temp"

local function readtemp(temp_file)
    local f = open(temp_file)
    if f then
        coretemp_now = tonumber(f:read("*all")) / 1000
        f:close()
    else
        coretemp_now = "N/A"
    end

    return coretemp_now
end

print(readtemp(tempfile0) .. '|' .. readtemp(tempfile1) .. '|' .. readtemp(tempfile2))
