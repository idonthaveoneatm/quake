local randomString = require(script.Parent.Parent.utilities.randomString)
local customFunctions = require(script.Parent.Parent.utilities.customFunctions)
local fusion = require(script.Parent.Fusion)
local value = fusion.Value

local data
if customFunctions.getgenv then
    customFunctions.getgenv().data = customFunctions.getgenv().data or {}
    data = customFunctions.getgenv().data
else
    _G.data = _G.data or {}
    data = _G.data
end
local dataFunctions = {}

type uid = string
type tag = string

function dataFunctions.update(uid:string, index:string, new:string)
    if index ~= "uid" and dataFunctions.find(uid) and dataFunctions.find(uid)[index] then
        local dataToEdit = dataFunctions.find(uid)
        dataToEdit[index]:set(new)
    elseif not dataFunctions.find(uid) then
        error("couldn't find uid: "..uid)
    elseif index == "uid" or index == "tag" then
        error("cannot edit property "..index)
    elseif not dataFunctions.find(uid)[index] then
        error("index returned nil")
    else
        error("how?")
    end
end
function dataFunctions.find(identifier:uid | tag):table
    local returnData = nil
    for i=1, #data do
        if data[i].uid == identifier or data[i].tag == identifier then
            returnData = data[i]
        end
    end
    if not returnData then
        warn("no data found by identifier: "..tostring(identifier))
        return returnData
    end
    return returnData
end
function dataFunctions.delete(uid:string)
    local dataToDelete = dataFunctions.find(uid)
    local index = table.find(data, dataToDelete)
    local newData = {}
    for i=1, #data do
        if i ~= index then
            table.insert(newData, data[i])
        end
    end
    data = newData
    newData =  nil
end
function dataFunctions.add(newData:table, tag:string):table
    for i,v in newData do
        newData[i] = value(v)
    end
    newData.tag = tag or nil
    newData.uid = randomString(16)
    setmetatable(newData, {
        __index = {
            ["update"] = function(tbl, dataType, info)
                dataFunctions.update(tbl.uid, dataType, info)
            end,
            ["delete"] = function()
                dataFunctions.delete(newData.uid)
            end
        }
    })
    table.insert(data, newData)
    return dataFunctions.find(newData.uid)
end

return dataFunctions
