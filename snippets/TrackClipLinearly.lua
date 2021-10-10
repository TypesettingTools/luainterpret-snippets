--[[ Track clip linearly, by The0x539

Track a rectangular \clip along with a \move.
The \move tag _must_ have all six parameters, \move(x1,y1,x2,y2,t1,t2)
]]

local function fmt_float(n) return ('%f'):format(n):gsub('0+$', ''):gsub('%.$', '') end
local m_x1, m_y1, m_x2, m_y2, t1, t2 = get('move')
local dx, dy = m_x2-m_x1, m_y2-m_y1
local x1, y1, x2, y2 = get('clip')
local new_tag = ('(%d,%d,\\clip(%s,%s,%s,%s))'):format(t1, t2, fmt_float(x1+dx), fmt_float(y1+dy), fmt_float(x2+dx), fmt_float(y2+dy))
mod('t', rep(new_tag))