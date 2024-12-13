# quake

this is quake ui library i will fix things eventually

## Credits
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) - Code for slider math
- [dawid-scripts/Fluent/](https://github.com/dawid-scripts/Fluent/) - lucide icons
- [lucide.dev](https://lucide.dev/) - more lucide icons
- [latte-soft/wax](https://github.com/latte-soft/wax) - bundler

## Loadstring
```lua
local quake = loadstring(game:HttpGet("https://raw.githubusercontent.com/idonthaveoneatm/Libraries/normal/quake/bundled.lua"))()
```
## Example Script
```lua
local quake = loadstring(game:HttpGet("https://raw.githubusercontent.com/idonthaveoneatm/Libraries/normal/quake/bundled.lua"))()

local window = quake:Window({
    Title = "Quake", 
    isMobile = false,
    Size = {
        X = 550,
        Y = 400
    },
    CustomTheme = { -- [OPTIONAL]
        defaultTab = Color3.fromHex("#a49ae6"),
        background = Color3.fromRGB(40, 44, 50),
        secondaryBackground = Color3.fromRGB(49, 56, 66),
        tertiaryBackground = Color3.fromRGB(57, 63, 75),
        text = Color3.fromRGB(220,221,225),
        image = Color3.fromRGB(220,221,225),
        placeholder = Color3.fromRGB(165,166,169),
        close = Color3.fromRGB(190, 100, 105)
    },
    KeyCode = Enum.KeyCode.T -- [OPTIONAL]
})

quake:SetCustomTheme({
    defaultTab = Color3.fromHex("#a49ae6"),
    background = Color3.fromRGB(40, 44, 50),
    secondaryBackground = Color3.fromRGB(49, 56, 66),
    tertiaryBackground = Color3.fromRGB(57, 63, 75),
    text = Color3.fromRGB(220,221,225),
    image = Color3.fromRGB(220,221,225),
    placeholder = Color3.fromRGB(165,166,169),
    close = Color3.fromRGB(190, 100, 105)
})
-- or
quake:SetCustomTheme({
    background = Color3.fromRGB(255, 44, 50)
})

window:Notify({
    Title = "Hey User!",
    Body = "How are you?",
    Duration = 0
})

local tab1 = window:Tab({
    Name = "New Tab",
    tabColor = Color3.fromRGB(180, 240, 67), -- [OPTIONAL]
    Image = "rbxassetid://10734908793"  -- [OPTIONAL]
})

tab1:Button({
    Name = "Quake Button",
    Callback = function()
        print("Quake Button")
    end
})
tab1:Toggle({
    Name = "Quake Toggle",
    Default = false, -- [OPTIONAL]
    Callback = function(var)
        print("Quake Toggle", var)
    end
})
tab1:Slider({
    Name = "Quake Slider",
    Min = 0,
    Max = 100,
    InitialValue = 0, -- [OPTIONAL]
    Placement = 0, -- decimal placement [OPTIONAL]
    Callback = function(var)
        print("Quake Slider", var)
    end
})
tab1:Dropdown({
    Name = "Quake Dropdown",
    Items = {"Apple", "Banana", "Carrot","Dingleberry"},
    Default = "Apple", -- [OPTIONAL]
    Multiselect = true, -- [OPTIONAL]
    Callback = function(var)
        print("Quake Dropdown", var)
    end
})
tab1:TextBox({
    Name = "Quake TextBox",
    Default = "", -- [OPTIONAL]
    OnLeave = true, -- [OPTIONAL]
    OnlyNumbers = false, -- [OPTIONAL]
    Callback = function(var)
        print("Quake TextBox", var)
    end
})
tab1:Keybind({
    Name = "Quake Keybind",
    Default = "E",
    Callback = function()
        print("Quake Keybind")
        quake:ToggleQuake() 
        -- runs the function for the optional KeyCode variable 
        -- if you want the user to change how to toggle the interface
    end
})
tab1:ColorPicker({
    Name = "Quake Color Picker",
    Color = Color3.fromHex("#a49ae6"),
    Callback = function(var)
        print("Quake Color Picker", var)
    end
})
tab1:Label("Quake Label")
tab1:Section("Quake Section")
tab1:Paragraph({
    Title = "Quake Paragraph",
    Body = "Quake Paragraph"
})
local group1 = tab1:Group({
    Name = "Quake Group",
    Icon = "rbxassetid://10734950309" -- [OPTIONAL]
})
-- Group has all of the other components listed above except for another Group
```
## Miscellaneous
These are on all components that are added to tabs or groups
```lua
<object>:Remove()
<object>:Lock("Hey you cant do that")
<object>:Unlock()
```
