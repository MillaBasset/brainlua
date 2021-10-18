local brainlua = require "brainlua"

local function write(...)
    io.stdout:write(...)                                              io.stdout:flush()
end

while true do
    write("> ")
    brainlua(io.stdin:read("*l"))
    write("\n")
end
