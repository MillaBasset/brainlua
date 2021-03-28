return function(str, inp)
    if type(str) ~= "string" then
        return
    elseif type(inp) ~= "string" then
        inp = ""
    end
    
    local tape = {}
    setmetatable(tape, {__index = function() return 0 end})
    local ptr = 1
    local str_ptr = 1
    local inp_ptr = 1

    while str_ptr <= #str do
        local char = str:sub(str_ptr, str_ptr)
        if char == ">" then
            ptr = ptr + 1
        elseif char == "<" then
            ptr = ptr - 1
        elseif char == "+" then
            tape[ptr] = (tape[ptr] + 1) % 256
        elseif char == "-" then
            tape[ptr] = (tape[ptr] - 1) % 256
        elseif char == "." then
            io.write(string.char(tape[ptr]))
            io.flush()
        elseif char == "," then
            if #inp <= 0 then
                tape[ptr] = io.read(1):byte()
            elseif inp_ptr <= #inp then
                tape[ptr] = inp:byte(inp_ptr)
                inp_ptr = inp_ptr + 1
            end
        elseif char == "[" and tape[ptr] == 0 then
            local loop = 1
            while loop > 0 do
                str_ptr = str_ptr + 1
                char = str:sub(str_ptr, str_ptr)
                if char == "[" then
                    loop = loop + 1
                elseif char == "]" then
                    loop = loop - 1
                end
            end
        elseif char == "]" and tape[ptr] ~= 0 then
            local loop = 1
            while loop > 0 do
                str_ptr = str_ptr - 1
                char = str:sub(str_ptr, str_ptr)
                if char == "[" then
                    loop = loop - 1
                elseif char == "]" then
                    loop = loop + 1
                end
            end
        end
        str_ptr = str_ptr + 1
    end
end