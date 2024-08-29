local themeSystem = {}
local fusion = require(script.Parent.Fusion)
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local preservedConfig = require(script.Parent.Parent.preservedConfig)
local functionsOnChange = {}

local currentTheme = value({})
observe(currentTheme):onChange(function()
    for _,func in ipairs(functionsOnChange) do
        task.spawn(func)
    end
end)

local paletteCheck = {
    defaultTab = "Color3",
	background = "Color3",
	secondaryBackground = "Color3",
	tertiaryBackground = "Color3",
	text = "Color3",
	image = "Color3",
	placeholder = "Color3",
	close = "Color3"
}

function themeSystem.create(palette)
    for i,_ in paletteCheck do
        if palette[i] == nil then
            palette[i] = preservedConfig[i]
        end
        if typeof(palette[i]) ~= "Color3" then
            error(i.." isn't type Color3")
        end
    end
    for i,_ in palette do
        if paletteCheck[i] == nil then
            warn('Incorrect value removed "'..tostring(i)..'"')
            palette[i] = nil
        end
    end
    currentTheme:set(palette)
end

function themeSystem.get(name:string, animation:boolean)
    local theme = get(currentTheme)
    if theme[name] then
        if animation then
            return animate(function()
                return get(currentTheme)[name]
            end,40,1)
        else
            return theme[name]
        end
    else
        error(name.." isn't a theme element")
    end
end
currentTheme:set(default)
function themeSystem.onChange(func)
    table.insert(functionsOnChange, func)
end

return themeSystem