--[[ Justifier, by witchymary
Snippet to facilitate the manual process of tweaking a sign look justified. Each text line break requires to be split into its own line. It works by altering the \fsp value of _only_ the white spaces, leaving all other characters alone.
]]
FSP_VALUE = 5


local fsp_spacing_tag = "{\\fsp" .. FSP_VALUE .. "}"
local function process_word(word, is_first_word, is_last_word)
    local len = #word
    local before_last_char, last_char = word:sub(1, len - 1), word:sub(len)
    local fsp_reset = "{\\fsp" .. get('fsp') .. "}"
    if len == 1 then
        if is_first_word then
            mod("fsp", rep(FSP_VALUE))
        end
        return word
    elseif is_first_word then
        return before_last_char .. fsp_spacing_tag .. last_char
    elseif is_last_word then
        return fsp_reset .. word
    else
        return fsp_reset .. before_last_char .. fsp_spacing_tag .. last_char
    end
end

local justify_text =
    text:gsub(
    "([^%s]+)",
    function(word)
        local is_first = (word == text:match("^%S+"))
        local is_last = (word == text:match("%S+$"))
        return process_word(word, is_first, is_last)
    end
)

text = justify_text