--[[ Chromatic Abberration made simple, by petzku

Simple LuaInterpret snippet to generate a basic "chromatic aberration" effect for the selected lines.
Creates two "shadows" of the line, one red and one green, offset to each side.

Edit the variables below to adjust aberration appearance.

ver 1.1.1
]]

-- adjust these to taste
OFFSET_X = 3
OFFSET_Y = 1
COLOUR_L = "&H21C504&" --bright dreen
COLOUR_R = "&H071CE6&" --dark red-ish
ALPHA = "&H40&" --set to nil to disable
-- don't touch below this point

if i % 3 == 1 then
  duplicate()
  duplicate()
  modify_line("layer", add(1))
elseif i % 3 == 2 then
  -- green, offset to left and up
  modify("c", replace(COLOUR_L))
  modify("pos", add(-OFFSET_X,-OFFSET_Y))
  if ALPHA and get("alpha") ~= ALPHA then
    modify("alpha", replace(ALPHA))
  end
else
  -- red, offset right and down
  modify("c", replace(COLOUR_R))
  modify("pos", add(OFFSET_X, OFFSET_Y))
  if ALPHA and get("alpha") ~= ALPHA then
    modify("alpha", replace(ALPHA))
  end
end
