# luainterpret-snippets

Collection of code snippets to be used with [LuaInterpret][lua-interpret].

## Usage

Simply copy the contents of the snippet you want into the LuaInterpret macro GUI within Aegisub. Saving the snippet for future use is optional but recommended.
Note that these are *not* standalone scripts. They are only meant to be used with LuaInterpret, so you shouldn't copy these files into your `automation/autoload` folder.

## Contributing

Wrote a useful snippet yourself? Send in a pull request!

It's recommended to add a short README-like section at the top of the snippet. For instance:

```lua
--[[ Chromatic Abberration made simple, by petzku

Simple LuaInterpret snippet to generate a basic "chromatic aberration" effect for the selected lines.
Creates two "shadows" of the line, one red and one green, offset to each side.

Edit the variables below to adjust aberration appearance.

ver 1.1.1
]]
```

[lua-interpret]: https://github.com/lyger/Aegisub_automation_scripts#LuaInterpret
