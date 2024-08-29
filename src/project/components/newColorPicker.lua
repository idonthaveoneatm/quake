local project = script.Parent.Parent

local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local RunSerivce = services.RunService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(colorpickerProperty)
    assert(colorpickerProperty.Name, ":ColorPicker missing property Name")
	assert(typeof(colorpickerProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(colorpickerProperty.Name)))
	assert(colorpickerProperty.Callback, ":ColorPicker missing property Callback")
	assert(typeof(colorpickerProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(colorpickerProperty.Callback)))
    assert(colorpickerProperty.Color, ":ColorPicker missing property Color")
    assert(typeof(colorpickerProperty.Color) == "Color3", ("Color accepts type Color3 got %s"):format(typeof(colorpickerProperty.Color)))

    local name = value(colorpickerProperty.Name)
    local color = value(colorpickerProperty.Color)
    local callback = value(colorpickerProperty.Callback)

    local tabColor = colorpickerProperty.tabColor or nil

    local isLocked = value(false)
	local lockReason = value("")

    local colorAsTable = {get(color):ToHSV()}
    local hueValue = value(colorAsTable[1])
    local saturationValue = value(colorAsTable[2])
    local valueValue = value(colorAsTable[3])

    local function generateColor()
        return Color3.fromHSV(get(hueValue),get(saturationValue),get(valueValue))
    end
    local function setCreatedColor(...)
        local args = {...}
        local hueToSet,saturationToSet,valueToSet
        if typeof(args[1]) == "Color3" then
            hueToSet,saturationToSet,valueToSet = args[1]:ToHSV()
        else
            hueToSet,saturationToSet,valueToSet = Color3.new(...):ToHSV()
        end
        hueValue:set(hueToSet)
        saturationValue:set(saturationToSet)
        valueValue:set(valueToSet)
    end
    local function roundTo(decimal, number)
        local point = 1
        for _=1,decimal do
            point = point*10
        end
        return math.round(number*point)/point
    end

    local isDropped = value(false)
    local SVFrameDown = value(false)
    local SVFrameConnection
    local HFrameDown = value(false)
    local HFrameConnection

    local colorPicker
    colorPicker = new "TextButton" {
        ClipsDescendants = true,
        Interactable = computed(function()
			return not get(isLocked)
		end),
		ZIndex = 2,
		Parent = colorpickerProperty.Parent,
		Size = animate(function()
			if get(isDropped) then
				return UDim2.new(1,0,0,160)
			end
			return UDim2.new(1,0,0,40)
		end,50,1),
        BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

        [onevent "Activated"] = function()
            isDropped:set(not get(isDropped))
        end,
        [onevent "Destroying"] = function()
            if SVFrameConnection then
                SVFrameConnection:Disconnect()
            end
        end,

        [children] = {
            { -- No clue whats in here
                { -- Lock
				new "Frame" {
					ZIndex = 4,
					Visible = computed(function()
						return get(isLocked)
					end),
					Size = UDim2.fromScale(1,1),
					BackgroundTransparency = 0.1,
					BackgroundColor3 = animate(function()
						return theme.get("tertiaryBackground")
					end,40,1),

					[children] = {
						new "ImageLabel" {
							AnchorPoint = Vector2.new(0,0.5),
							Size = UDim2.fromOffset(24,24),
							Position = UDim2.new(0,10,0.5),
							BackgroundTransparency = 1,
							ImageColor3 = animate(function()
								return theme.get("image")
							end,40,1),
							Image = icons['lock']
						},
						new "TextLabel" {
							Text = computed(function()
								return get(lockReason)
							end),
							AnchorPoint = Vector2.new(0,0.5),
							Position = UDim2.new(0,44,0.5,0),
							Size = UDim2.new(1,-54,0,16),
							Font = Enum.Font.GothamBold,
							BackgroundTransparency = 1,
							TextColor3 = animate(function()
								return theme.get("text")
							end,40,1),
							TextSize = 16,
							TextScaled = true,
							TextXAlignment = Enum.TextXAlignment.Left,

							[children] = {
								new "UITextSizeConstraint" {
									MinTextSize = 1,
									MaxTextSize = 16
								}
							}
						},
						new "UICorner" {CornerRadius = UDim.new(0,6)},
					}
				}
                },
                new "UICorner" {
                    CornerRadius = UDim.new(0,6)
                },
                new "Frame" { -- Background
                    ZIndex = 2,
                    Size = UDim2.new(1,0,1,0),
                    AnchorPoint = Vector2.new(0.5,0.5),
                    Position = UDim2.new(0.5,0,0.5,0),

                    BackgroundColor3 = animate(function()
                        return tabColor or theme.get("defaultTab")
                    end,40,1),
                    BackgroundTransparency = 0.85,

                    [children] = {
                        new "UICorner" {
                            CornerRadius = UDim.new(0,6)
                        }
                    }
                },
                new "TextLabel" { -- Name
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1,-45,0,14),
                    AnchorPoint = Vector2.new(0,0),
                    Position = UDim2.new(0,10,0,13),
                    Font = Enum.Font.Gotham,
                    TextScaled = true,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTransparency = 0,

                    TextColor3 = animate(function()
                        return theme.get("text")
                    end,40,1),
                    Text = get(name),

                    [children] = {
                        new "UITextSizeConstraint" {
                            MinTextSize = 1,
                            MaxTextSize = 14
                        }
                    }
                },
                new "ImageLabel" {-- Icon
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(1,0),
                    Position = UDim2.new(1,-7,0,8),
                    Size = UDim2.fromOffset(24,24),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://16898730641",
                    ImageRectOffset = Vector2.new(257,257),
                    ImageRectSize = Vector2.new(256,256),
                    ImageColor3 = computed(function()
                        return Color3.fromHSV(get(hueValue),get(saturationValue),get(valueValue))
                    end)
                },
            },
            new "Frame" { -- ColorPicker
                ClipsDescendants = true,
                Position = UDim2.fromOffset(10,40),
                Size = UDim2.new(1,-20,0,110),
                BackgroundTransparency = 1,
                ZIndex = 3,

                [children] = {
                    new "UIListLayout" {
                        Padding = UDim.new(0,10),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    },
                    new "TextBox" { -- HexTextBox
                        Name = "HexTextBox",
                        Size = UDim2.fromOffset(145,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        Text = computed(function()
                            return "#"..generateColor():ToHex()
                        end),
                        TextColor3 = animate(function()
                            return generateColor()
                        end,40,1),
                        TextSize = 20,
                        Font = Enum.Font.GothamMedium,

                        [onevent "FocusLost"] = function()
                            local HexTextBox = colorPicker:FindFirstChild("HexTextBox", true).Text:gsub("[^%w#]", "")
                            if not string.find(HexTextBox, "#") then
                                HexTextBox = "#"..HexTextBox
                            end
                            if string.len(HexTextBox) ~= 7 then
                                warn("Hex code malformed", HexTextBox)
                                colorPicker:FindFirstChild("HexTextBox", true).Text = "#"..generateColor():ToHex()
                            else
                                local s,e = pcall(function()
                                    return Color3.fromHex(HexTextBox)
                                end)
                                if tostring(e) == "Unable to convert characters to hex value" then
                                    warn("Hex code malformed", HexTextBox)
                                    colorPicker:FindFirstChild("HexTextBox", true).Text = "#"..generateColor():ToHex()
                                else
                                    setCreatedColor(Color3.fromHex(HexTextBox))
                                end
                            end
                        end,

                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            }
                        }
                    },
                    new "Frame" { -- HSVTextBoxes
                        Name = "HSVTextBoxes",
                        Size = UDim2.fromOffset(55,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            },
                            new "UIListLayout" {
                                Padding = UDim.new(0,5),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                FillDirection = Enum.FillDirection.Vertical,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            },
                            new "TextLabel" {
                                Text = "H",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "HText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(hueValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(hueTextChange)
                                    local newHue = tonumber(colorPicker:FindFirstChild("HText", true).Text)
                                    if hueTextChange:lower() == "text" then
                                        if newHue then
                                            newHue = math.clamp(newHue, 0,1)
                                            if roundTo(2,get(hueValue)) ~= newHue then
                                                hueValue:set(newHue)
                                            end
                                        end
                                        colorPicker:FindFirstChild("HText", true).Text = tostring(roundTo(2,get(hueValue)))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "S",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "SText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(saturationValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(saturationTextChange)
                                    local newSaturation = tonumber(colorPicker:FindFirstChild("SText", true).Text)
                                    if saturationTextChange:lower() == "text" then
                                        if newSaturation then
                                            newSaturation = math.clamp(newSaturation, 0,1)
                                            if roundTo(2,get(saturationValue)) ~= newSaturation then
                                                saturationValue:set(newSaturation)
                                            end
                                        end
                                        colorPicker:FindFirstChild("SText", true).Text = tostring(roundTo(2,get(saturationValue)))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "V",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "VText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(valueValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(valuePropertyChange)
                                    local newValue = tonumber(colorPicker:FindFirstChild("VText", true).Text)
                                    if valuePropertyChange:lower() == "text" then
                                        if newValue then
                                            newValue = math.clamp(newValue, 0,1)
                                            if roundTo(2,get(valueValue)) ~= newValue then
                                                valueValue:set(newValue)
                                            end
                                        end
                                        colorPicker:FindFirstChild("VText", true).Text = tostring(roundTo(2,get(valueValue)))
                                    end
                                end
                            }
                        }
                    },
                    new "Frame" { -- RGBTextBoxes
                        Name = "RGBTextBoxes",
                        Size = UDim2.fromOffset(55,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            },
                            new "UIListLayout" {
                                Padding = UDim.new(0,5),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                FillDirection = Enum.FillDirection.Vertical,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            },
                            new "TextLabel" {
                                Text = "R",
                                TextColor3 = Color3.fromRGB(200,0,0),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "RText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().R*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newR = tonumber(colorPicker:FindFirstChild("RText", true).Text)
                                    local oldColor = generateColor()
                                    if newR then
                                        if math.clamp(math.round(oldColor.R*255),0,255) ~= newR then
                                            setCreatedColor(math.clamp(newR,0,255)/255,oldColor.G,oldColor.B)
                                        end
                                    else
                                        colorPicker:FindFirstChild("RText", true).Text = tostring(math.round(oldColor.R*255))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "G",
                                TextColor3 = Color3.fromRGB(0,200,0),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "GText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().G*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newG = tonumber(colorPicker:FindFirstChild("GText", true).Text)
                                    local oldColor = generateColor()
                                    if newG then
                                        if math.clamp(math.round(oldColor.G*255),0,255) ~= newG then
                                            setCreatedColor(oldColor.R,math.clamp(newG,0,255)/255,oldColor.B)
                                        end
                                    else
                                        colorPicker:FindFirstChild("GText", true).Text = tostring(math.round(oldColor.G*255))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "B",
                                TextColor3 = Color3.fromRGB(0,0,125),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "BText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().B*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newB = tonumber(colorPicker:FindFirstChild("BText", true).Text)
                                    local oldColor = generateColor()
                                    if newB then
                                        if math.clamp(math.round(oldColor.B*255),0,255) ~= newB then
                                            setCreatedColor(oldColor.R,oldColor.G,math.clamp(newB,0,255)/255)
                                        end
                                    else
                                        print("B needs to be a number")
                                        colorPicker:FindFirstChild("BText", true).Text = tostring(math.round(oldColor.B*255))
                                    end
                                end
                            }
                        }
                    },
                    new "TextButton" { -- SVPicker
                        ZIndex = 2,
                        Name = "SVPicker",
                        ClipsDescendants = true,
                        Size = UDim2.fromOffset(110,110),

                        [onevent "InputBegan"] = function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                SVFrameDown:set(true)
                                local connection
                                connection = input.Changed:Connect(function()
                                    if input.UserInputState == Enum.UserInputState.End then
                                        SVFrameDown:set(false)
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end,

                        [children] = {
                            new "UIGradient" {
                                Color = computed(function()
                                    return ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromHSV(get(hueValue),1,1)),
                                      })
                                end)
                            },
                            new "ImageLabel" {
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Position = UDim2.fromScale(0.5,0),
                                Size = UDim2.fromScale(1,2),
                                BackgroundTransparency = 1,
                                Image = "rbxassetid://13611892279"
                            },
                            new "Frame" {
                                ZIndex = 2,
                                Name = "dot",
                                AnchorPoint = Vector2.new(0.5,0.5),
                                BackgroundColor3 = computed(function()
                                    local h
                                    if get(hueValue) > 0.95 or get(hueValue) <= 0.05 then
                                        h = 0.5
                                    elseif get(hueValue) < 0.56 and get(hueValue) > 0.45 then
                                        h = 1
                                    else
                                        if get(hueValue) + 1 > 1 then
                                            h = 1 - get(hueValue)
                                        else
                                            h = 1 + get(hueValue)
                                        end
                                    end
                                    return Color3.fromHSV(h,1,1)
                                end),
                                Size = UDim2.fromOffset(4,4),
                                Position = computed(function()
                                    return UDim2.fromScale(get(saturationValue), 1-get(valueValue))
                                end)
                            }
                        }
                    },
                    new "TextButton" { -- HPicker
                        ZIndex = 2,
                        Name = "HPicker",
                        Size = UDim2.fromOffset(55,110),

                        [onevent "InputBegan"] = function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                HFrameDown:set(true)
                                local connection
                                connection = input.Changed:Connect(function()
                                    if input.UserInputState == Enum.UserInputState.End then
                                        HFrameDown:set(false)
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end,

                        [children] = {
                            new "UIGradient" {
                                Rotation = 90,
                                Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.fromHSV(1, 1, 1)),
                                    ColorSequenceKeypoint.new(0.1, Color3.fromHSV(0.9, 1, 1)),
                                    ColorSequenceKeypoint.new(0.2, Color3.fromHSV(0.8, 1, 1)),
                                    ColorSequenceKeypoint.new(0.3, Color3.fromHSV(0.7, 1, 1)),
                                    ColorSequenceKeypoint.new(0.4, Color3.fromHSV(0.6, 1, 1)),
                                    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                                    ColorSequenceKeypoint.new(0.6, Color3.fromHSV(0.4, 1, 1)),
                                    ColorSequenceKeypoint.new(0.7, Color3.fromHSV(0.3, 1, 1)),
                                    ColorSequenceKeypoint.new(0.8, Color3.fromHSV(0.2, 1, 1)),
                                    ColorSequenceKeypoint.new(0.9, Color3.fromHSV(0.1, 1, 1)),
                                    ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 1, 1)),
                                })
                            },
                            new "Frame" {
                                Name = "slide",
                                AnchorPoint = Vector2.new(0,0.5),
                                Size = UDim2.new(1,0,0,2),
                                Position = computed(function()
                                    return UDim2.fromScale(0,1-get(hueValue))
                                end)
                            }
                        }
                    }
                }
            }
        }
    }

    observe(SVFrameDown):onChange(function()
        if get(SVFrameDown) then
            SVFrameConnection = RunSerivce.Heartbeat:Connect(function()
                local SatuarationValue = (UserInputService:GetMouseLocation() - colorPicker:FindFirstChild("SVPicker", true).AbsolutePosition)
                SatuarationValue = Vector2.new(math.clamp(SatuarationValue.X, 0, 110), math.clamp(SatuarationValue.Y, 0, 110))
                saturationValue:set(SatuarationValue.X/110)
                valueValue:set((110-SatuarationValue.Y)/110)
            end)
        else
            if SVFrameConnection then
                SVFrameConnection:Disconnect()
            end
        end
    end)
    observe(HFrameDown):onChange(function()
        if get(HFrameDown) then
            HFrameConnection = RunSerivce.Heartbeat:Connect(function()
                local Hue = (UserInputService:GetMouseLocation() - colorPicker:FindFirstChild("HPicker", true).AbsolutePosition)
                Hue = Vector2.new(Hue.X, math.clamp(Hue.Y, 0, 110))
                hueValue:set((110-Hue.Y)/110)
            end)
        else
            if HFrameConnection then
                HFrameConnection:Disconnect()
            end
        end
    end)
    observe(hueValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)
    observe(saturationValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)
    observe(valueValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)

    local returnFunctions = {}
    function returnFunctions:Lock(reason)
		isLocked:set(true)
        isDropped:set(false)
		lockReason:set(reason or "Locked")
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
	end
    function returnFunctions:Remove()
        colorPicker:Destroy()
    end
    function returnFunctions:SetColor(newColor)
        setCreatedColor(newColor)
    end
    return returnFunctions
end