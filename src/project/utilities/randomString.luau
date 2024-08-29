local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end
local function randomString(length)
    if length > 0 then
        return randomString(length - 1) .. charset[math.random(1, #charset)]
    else
        return ""
    end
end
return randomString