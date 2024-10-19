local project = script.Parent.Parent

local data = require(project.Bundles.data)
local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local ref = Fusion.Ref
local observe = Fusion.Observer
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local references = require(project.utilities.references)

return function(windowProperty)
    local mobileQuake

    local selectedTab = data.find("selectedTab")

    local isOpen = value(false)
    local isToggled = data.find("isToggled")
    local keyCode = data.find("keyCode")

	local sideBarRef = value()
	references.add(sideBarRef)
	local windowsRef = value()
	references.add(windowsRef)
	local uipagelayoutRef = value()
	references.add(uipagelayoutRef)
	local notificationListRef = value()
	references.add(notificationListRef)

    local isToggledConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode and input.KeyCode == get(keyCode.EnumItem) then
			isToggled:update("boolean", not get(isToggled.boolean))
		end
	end)

    observe(selectedTab.data):onChange(function()
		local tab_data = get(selectedTab.data)
		local uipagelayout = get(uipagelayoutRef)
		uipagelayout:JumpTo(tab_data.tabPage)
	end)

    mobileQuake = new "ScreenGui" {
        Name = windowProperty.Title,
        Parent = windowProperty.Parent,
        IgnoreGuiInset = false,
		ResetOnSpawn = false,
        Enabled = computed(function()
			return get(isToggled.boolean)
		end),

        [onevent "Destroying"] = function()
            isToggledConnection:Disconnect()
        end,

        [children] = {
            new "Frame" {
                Name = "container",
                AnchorPoint = Vector2.new(0,1),
                Position = UDim2.new(0,5,1,-5),
                ClipsDescendants = true,

                BackgroundColor3 = animate(function()
					return theme.get("background")
				end,40,1),
                Size = animate(function()
                    if get(isOpen) then
                        return UDim2.new(0.75,0,1,-10)
                    else
                        return UDim2.fromOffset(40,40)
                    end
                end,45,1),

                [children] = {
                    {
                        new "UICorner" {
                            CornerRadius = UDim.new(0,6)
                        },
                        new "TextButton" { -- activator
                            Name = "activator",
                            ZIndex = 2,
                            AnchorPoint = Vector2.new(0,1),
                            Size = UDim2.fromOffset(40,40),
                            Position = UDim2.fromScale(0,1),
                            BackgroundTransparency = 1,
                            ClipsDescendants = true,

                            [onevent "Activated"] = function()
                                isOpen:set(not get(isOpen))
                            end,

                            [children] = {
                                new "UICorner" {
                                    CornerRadius = UDim.new(0,6)
                                },
                                new "ImageLabel" {
                                    Name = "maximizeIcon",
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromOffset(30,30),
                                    Image = "rbxassetid://15556636376",

                                    ImageColor3 = animate(function()
                                        return theme.get("image")
                                    end,40,1),
                                    ImageTransparency = animate(function()
                                        if get(isOpen) then
                                            return 1
                                        else
                                            return 0
                                        end
                                    end,45,1),
                                    Position = animate(function()
                                        if get(isOpen) then
                                            return UDim2.fromScale(0.5,1.5)
                                        else
                                            return UDim2.fromScale(0.5,0.5)
                                        end
                                    end,25,1),
                                },
                                new "ImageLabel" {
                                    Name = "minimizeIcon",
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromOffset(30,30),
                                    Image = "rbxassetid://15556637715",

                                    ImageColor3 = animate(function()
                                        return theme.get("image")
                                    end,40,1),
                                    ImageTransparency = animate(function()
                                        if get(isOpen) then
                                            return 0
                                        else
                                            return 1
                                        end
                                    end,45,1),
                                    Position = animate(function()
                                        if get(isOpen) then
                                            return UDim2.fromScale(0.5,0.5)
                                        else
                                            return UDim2.fromScale(0.5,1.5)
                                        end
                                    end,25,1),
                                }
                            }
                        },
                        new "ScrollingFrame" { -- tabsList
                            Name = "sideBar",
                            Size = UDim2.new(0,50,1,-80),
                            Position = UDim2.fromOffset(0,40),
                            BackgroundTransparency = 1,
                            ScrollBarThickness = 0,
                            ClipsDescendants = false,
                            CanvasSize = UDim2.new(0,0,0,0),
                            AutomaticCanvasSize = Enum.AutomaticSize.Y,

                            [ref] = sideBarRef,

                            [children] = {
                                new "UIListLayout" {
                                    Padding = UDim.new(0,5),
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    FillDirection = Enum.FillDirection.Vertical,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                },
                                new "UIPadding" {
                                    PaddingLeft = UDim.new(0,10)
                                }
                            }
                        },
                        new "Frame" { -- topBar
                            Name = "topBar",
                            Size = UDim2.new(1,0,0,40),
                            BackgroundTransparency = 1,
                            ZIndex = 0,

                            [children] = {
                                new "TextLabel" {
                                    AnchorPoint = Vector2.new(0,0.5),
                                    Position = UDim2.fromScale(0,0.5),
                                    Size = UDim2.new(1,-40,0,24),
                                    BackgroundTransparency = 1,
                                    Font = Enum.Font.GothamBold,
                                    TextScaled = true,
                                    TextSize = 24,
                                    TextXAlignment = Enum.TextXAlignment.Left,

                                    Text = windowProperty.Title,
                                    TextColor3 = animate(function()
                                        return get(selectedTab.data).tabColor or theme.get("defaultTab")
                                    end,15,1),
                                    TextTransparency = animate(function()
                                        if get(isOpen) then
                                            return 0
                                        else
                                            return 1
                                        end
                                    end,45,1),
                                    [children] = {
                                        new "UIPadding" {PaddingLeft = UDim.new(0,10)},
                                        new "UITextSizeConstraint" {
                                            MaxTextSize = 24,
                                            MinTextSize = 1
                                        }
                                    }
                                },
                                new "TextButton" {
                                    AnchorPoint = Vector2.new(1,0.5),
                                    Position = UDim2.fromScale(1,0.5),
                                    Size = UDim2.fromOffset(40,40),
                                    BackgroundTransparency = 1,
                                    Text = "",
                                    ZIndex = 0,

                                    [onevent "Activated"] = function()
                                        mobileQuake:Destroy()
                                    end,

                                    [children] = {
                                        new "ImageLabel" {
                                            AnchorPoint = Vector2.new(0.5,0.5),
                                            Position = UDim2.fromScale(0.5,0.5),
                                            Size = UDim2.fromScale(0.9,0.9),
                                            Rotation = 45,
                                            BackgroundTransparency = 1,
                                            Image = "rbxassetid://15556635005",

                                            ImageColor3 = animate(function()
                                                return theme.get("close")
                                            end,40,1),
                                            ImageTransparency = animate(function()
                                                if get(isOpen) then
                                                    return 0
                                                else
                                                    return 1
                                                end
                                            end,45,1),
                                        }
                                    }
                                }
                            }
                        },
                        new "Frame" { -- windowsList
                            Name = "windowsList",
                            ZIndex = 0,
                            Position = UDim2.fromOffset(50,40),
                            Size = UDim2.new(1,-50,1,-40),
                            BackgroundTransparency = 1,
                            ClipsDescendants = true,

                            [ref] = windowsRef,

                            [children] = {
                                new "UIPadding" {
                                    PaddingLeft = UDim.new(0,5),
                                    PaddingRight = UDim.new(0,10),
                                    PaddingTop = UDim.new(0,5),
                                    PaddingBottom = UDim.new(0,5)
                                },
                                new "UIPageLayout" {
                                    Name = "UIPageLayout",
                                    EasingDirection = Enum.EasingDirection.In,
                                    EasingStyle = Enum.EasingStyle.Sine,
                                    TweenTime = 0.2,
                                    FillDirection = Enum.FillDirection.Vertical,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    Padding = UDim.new(0,20),

                                    [ref] = uipagelayoutRef
                                },
                            }
                        }
                    }
                }
            },
            new "ScrollingFrame" { -- notifications
                Name = "notifications",
				ZIndex = 0,
				AnchorPoint = Vector2.new(1,1),
				Position = UDim2.new(1,-5,1,-10),
				Size = UDim2.new(0,1,1,-10),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ClipsDescendants = false,

                [ref] = notificationListRef,

				[children] = {
					new "UIListLayout" {
						Padding = UDim.new(0,5),
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						VerticalAlignment = Enum.VerticalAlignment.Bottom
					}
				}
			}
        }
    }

    return mobileQuake
end