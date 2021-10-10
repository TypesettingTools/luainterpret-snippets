--[[ Filter off-screen shapes, by The0x539

Remove off-screen shapes within a drawing.
Assumes \pos(0,0)\fsc100\frz0 etc, as well as 1920x1080 content.
]]

local bb = {x0 = -10, y0 = -10, x1 = 1930, y1 = 1090}

local function f(contour)
	local x0, y0 = math.huge, math.huge
	local x1, y1 = -x0, -y0
	for x, y in contour:gmatch('(-?[0-9.]+) (-?[0-9.]+)') do
		x = tonumber(x)
		y = tonumber(y)
		x0 = math.min(x, x0)
		y0 = math.min(y, y0)
		x1 = math.max(x, x1)
		y1 = math.max(y, y1)
	end
	
	if x1 < bb.x0 or x0 > bb.x1 or y1 < bb.y0 or y0 > bb.y1 then
		return ''
	else
		return contour
	end
end
text = text:gsub('m[^m]*', f)