local project = require(script.Parent)

local themes = {
    ["Dracula"] = {
        defaultTab = Color3.fromRGB(254, 126, 92),
        background = Color3.fromRGB(40, 42, 54),
        secondaryBackground = Color3.fromRGB(50, 52, 64),
        tertiaryBackground = Color3.fromRGB(45, 47, 59),
        text = Color3.fromRGB(204, 204, 204),
        image = Color3.fromRGB(204, 204, 204),
        placeholder = Color3.fromRGB(165,166,169),
        close = Color3.fromRGB(190, 100, 105)
    },
    ["Dark"] = {
        defaultTab = Color3.fromRGB(150, 150, 150),
        background = Color3.fromRGB(26, 27, 33),
        secondaryBackground = Color3.fromRGB(34, 35, 39),
        tertiaryBackground = Color3.fromRGB(22, 22, 22),
        text = Color3.fromRGB(230, 230, 230),
        image = Color3.fromRGB(94, 93, 93),
        placeholder = Color3.fromRGB(79, 79, 79),
        close = Color3.fromRGB(190, 100, 105)
    },
    ["Default"] = {},
    ["Eyebleed"] = {
        defaultTab = Color3.fromRGB(255, 67, 211),
        background = Color3.fromRGB(195, 198, 217),
        secondaryBackground = Color3.fromRGB(127, 130, 140),
        tertiaryBackground = Color3.fromRGB(116, 137, 100),
        text = Color3.fromRGB(116, 57, 108),
        image = Color3.fromRGB(244, 162, 162),
        placeholder = Color3.fromRGB(57, 181, 103),
        close = Color3.fromRGB(181, 177, 67)
    }
}

return function(target)
    local window = project:Window({
        Title = "Quake Window",
        Parent = target,
        isMobile = true,

        --KeyCode = Enum.KeyCode.Q
    })

    local tab1 = window:Tab({
        Name = "Quake Tab 1",
        Image = "rbxassetid://10734908793"
    })
    local tab2 = window:Tab({
        Name = "Quake Tab 2",
        tabColor = Color3.fromRGB(255,120,222),
        Image = "rbxassetid://10734919691"
    })
    local tab3 = window:Tab({
        Name = "Quake Tab 3",
        tabColor = Color3.fromRGB(65,253,123),
        Image = "rbxassetid://10734950309"
    })

    tab1:Button({
        Name = "Quake Button",
        Callback = function()
            print("Quake Button")
        end
    })
    tab1:Toggle({
        Name = "Quake Toggle",
        Default = false,
        Callback = function(var)
            print("Quake Toggle", var)
        end
    })
    tab1:Slider({
        Name = "Quake Slider",
        Min = 0,
        Max = 100,
        InitialValue = 0,
        Callback = function(var)
            print("Quake Slider", var)
        end
    })
    tab1:Dropdown({
        Name = "Quake Multiselect Dropdown",
        Items = {"Apple", "Banana", "Carrot","Dingleberry"},
        Default = "Apple",
        Multiselect = true,
        Callback = function(var)
            print("Quake Dropdown", var)
        end
    })
    tab1:TextBox({
        Name = "Quake TextBox",
        Default = "heyy",
        OnLeave = true,
        OnlyNumbers = true,
        Callback = function(var)
            print("Quake TextBox", var)
        end
    })
    tab1:Keybind({
        Name = "Quake Keybind",
        Default = "F",
        Callback = function()
            project:ToggleQuake()
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
    tab2:Label("Quake Group Below")
    local group1 = tab2:Group({
        Name = "Quake Group",
        Icon = "rbxassetid://10734950309"
    })

    group1:Button({
        Name = "Quake Button",
        Callback = function()
            print("Quake Button")
        end
    })
    group1:Toggle({
        Name = "Quake Toggle",
        Default = false,
        Callback = function(var)
            print("Quake Toggle", var)
        end
    })
    group1:Slider({
        Name = "Quake Slider",
        Min = 0,
        Max = 100,
        Step = 1,
        InitialValue = 0,
        Callback = function(var)
            print("Quake Slider", var)
        end
    })
    group1:Dropdown({
        Name = "Quake Dropdown",
        Items = {"Apple", "Banana", "Carrot","Dingleberry"},
        Multiselect = false,
        Callback = function(var)
            print("Quake Dropdown", var)
        end
    })
    group1:TextBox({
        Name = "Quake TextBox",
        Default = "",
        Callback = function(var)
            print("Quake TextBox", var)
        end
    })
    group1:Keybind({
        Name = "Quake Keybind",
        Default = "E",
        Callback = function()
            print("Quake Keybind")
        end
    })
    group1:ColorPicker({
        Name = "Quake Color Picker",
        Color = Color3.fromHex("#a49ae6"),
        Callback = function(var)
            print("Quake Color Picker", var)
        end
    })
    group1:Label("Quake Label")
    group1:Section("Quake Section")
    group1:Paragraph({
        Title = "Quake Paragraph",
        Body = "Quake Paragraph"
    })

    tab2:Dropdown({
        Name = "Switch Theme",
        Items = {"Dracula","Dark","Default","Eyebleed"},
        Default = "Default",
        Callback = function(value)
            project:SetCustomTheme(themes[value])
        end
    })

    local slider = tab3:Slider({
        Name = "Slider To Lock",
        Max = 150,
        Min = 37,
        Callback = function(value)
        end
    })
    tab3:Toggle({
        Name = "Lock Slider",
        Default = false,
        Callback = function(value)
            if value then
                slider:Lock("Buy Premium!!")
            else
                slider:Unlock()
            end
        end
    })

    return function()
        project:Destroy()
    end
end
