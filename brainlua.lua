return function(str, inp, cell_size)
    if type(str) ~= "string" then
        return
    elseif type(inp) ~= "string" then
        inp = ""
    end

    if type(cell_size) ~= "number" then
        cell_size = 256
    end
    
    local tape = {}
    setmetatable(tape, {__index = function() return 0 end})
    local ptr = 1
    local str_ptr = 1
    local inp_ptr = 1

    while str_ptr <= #str do
        local char = str:byte(str_ptr)
        if char == 62 then
            ptr = ptr + 1
        elseif char == 60 then
            ptr = ptr - 1
        elseif char == 43 then
            tape[ptr] = (tape[ptr] + 1) % cell_size
        elseif char == 45 then
            tape[ptr] = (tape[ptr] - 1) % cell_size
        elseif char == 46 then
            io.stdout:write(string.char(tape[ptr]))
            io.stdout:flush()
        elseif char == 44 then
            if #inp <= 0 then
                tape[ptr] = io.stdin:read(1):byte()
            elseif inp_ptr <= #inp then
                tape[ptr] = inp:byte(inp_ptr)
                inp_ptr = inp_ptr + 1
            end
        elseif char == 91 and tape[ptr] == 0 then
            local loop = 1
            while loop > 0 do
                str_ptr = str_ptr + 1
                char = str:byte(str_ptr)
                if char == 91 then
                    loop = loop + 1
                elseif char == 93 then
                    loop = loop - 1
                end
            end
        elseif char == 93 and tape[ptr] ~= 0 then
            local loop = 1
            while loop > 0 do
                str_ptr = str_ptr - 1
                char = str:byte(str_ptr)
                if char == 91 then
                    loop = loop - 1
                elseif char == 93 then
                    loop = loop + 1
                end
            end
        end
        str_ptr = str_ptr + 1
    end
end