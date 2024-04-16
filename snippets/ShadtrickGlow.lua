--[[ Shadtrick Glow, by witchymary
This mimics the way ua's Blur & Glow applies glow, but for shadtrick'd lines. Adjust the blur and alpha values below.
]]
blur = 5
alpha = "&H80&"
---

if i%2==1 then
    duplicate()

    mod("blur", rep(blur))
    mod("4a", rep(alpha))
else
    modln("layer", add(1))
end