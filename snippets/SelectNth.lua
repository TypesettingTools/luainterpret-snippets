--[[ Select n-th line

Selects every N-th line.
Optionally, selects K sequential lines instead of a single one.
e.g. if N=5 and K=2, selects the first two lines, then the sixth and seventh, etc.
]]

N = 5
K = 1

-- edit parameters above

if (i - 1) % N < (K or 1) then
    select()
end
