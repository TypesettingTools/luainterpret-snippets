--[[ Bake scale and position, by The0x539

"Bake" scale and position into a drawing, i.e. adjust it to \pos(0,0)\fscx100\fscy100 without changing appearance.
Does not account for other tags like rotation and shearing.
]]

local px, py = get('pos')
px = tonumber(px)
py = tonumber(py)
local fscx, fscy = get('fscx'), get('fscy')
fscx = tonumber(fscx) / 100
fscy = tonumber(fscy) / 100
mod('pos', rep(0, 0))
mod('fscx', rep(100))
mod('fscy', rep(100))
-- petzku please copy this fixed version, which doesn't break integers
local function decimal(num, max_places)
	return ('%%.%df'):format(max_places):format(num):gsub('(%.%d-)0+$', '%1'):gsub('%.$', '')
end
local function f(x, y)
	x = px + tonumber(x) * fscx
	y = py + tonumber(y) * fscy
	return string.format('%s %s', decimal(x, 3), decimal(y, 3))
end
text = text:gsub('(-?[0-9.]+) (-?[0-9.]+)', f)