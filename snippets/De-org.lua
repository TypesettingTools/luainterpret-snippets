--[[ De-org, by The0x539

Remove \org, changing \pos to maintain appearance based on \frz.
Does not work for \frx\fry.
]]

local function f2s2f(f)
    local s, n = ('%.3f'):format(f):gsub('%.(%d-)0+$', '%.%1'):gsub('%.$', '')
    return tonumber(s)
end

local x, y = pos.x, pos.y
local ox, oy = org.x, org.y
local dx, dy = x - ox, y - oy
local r, th = math.sqrt(dx * dx + dy * dy), math.atan2(dy, dx)
local new_th = th - math.rad(tonumber(get('frz')))
local new_dx, new_dy = r * math.cos(new_th), r * math.sin(new_th)
local new_x, new_y = ox + new_dx, oy + new_dy
mod('org', rep(f2s2f(new_x), f2s2f(new_y))) -- this really shouldn't be necessary
rem('org')
mod('pos', rep(new_x, new_y))