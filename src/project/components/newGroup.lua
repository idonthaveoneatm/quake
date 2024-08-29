local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(groupProperty)
    assert(groupProperty.Name, ":Group missing property Name")
	assert(typeof(groupProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(groupProperty.Name)))
    if groupProperty.Icon then
        assert(typeof(groupProperty.Icon) == "string", ("Icon accepts type string got %s"):format(typeof(groupProperty.Icon)))
    end

    local name = value(groupProperty.Name)
    local icon = value(groupProperty.Icon or "")

    local tabColor = groupProperty.tabColor or nil

    local size = value(40)
    local isClosed = value(false)
    local isLocked = value(false)
    local oldisClosed = value(false)
    local lockReason = value("")
    local hasImage = value(false)

    local newGroup = new "TextButton" {
        ZIndex = 2,
        Parent = groupProperty.Parent,
        ClipsDescendants = true,
        Size = computed(function()
            if get(isClosed) then
                return UDim2.new(1,0,0,40)
            end
            return UDim2.new(1,0,0,get(size))
        end),
        BackgroundTransparency = animate(function()
            if get(isClosed) then
                return 0
            end
            return 1
        end,30,1),
        BackgroundColor3 = animate(function()
            if get(isClosed) then
                return theme.get("secondaryBackground")
            end
            return theme.get("background")
        end,30,1),

        [onevent "Activated"] = function()
            isClosed:set(not get(isClosed))
        end,

        [children] = {
            { -- Lock
				new "Frame" {
					ZIndex = 3,
                    Name = "Lock",
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
            new "UICorner" {CornerRadius = UDim.new(0,4)},
            new "TextLabel" {
                Text =  computed(function()
                    return get(name)
                end),
                TextColor3 = animate(function()
                    if get(isClosed) then
                        return theme.get("text")
                    end
                    return tabColor or theme.get("defaultTab")
                end,40,1),
                BackgroundTransparency = 1,
                Font = Enum.Font.GothamMedium,
                Size = computed(function()
                    if get(hasImage) then
                        return UDim2.new(1,-54,0,16)
                    end
                    return UDim2.new(1,-20,0,16)
                end),
                TextSize = 16,
                Position = computed(function()
                    if get(hasImage) then
                        return UDim2.fromOffset(44,12)
                    end
                    return UDim2.fromOffset(10,12)
                end),
                AnchorPoint = Vector2.new(0,0),
                TextXAlignment = Enum.TextXAlignment.Left
            },
            new "ImageLabel" {
                Visible = computed(function()
                    if get(hasImage) then
                        return true
                    end
                    return false
                end),
                BackgroundTransparency = 1,
                ImageColor3 = animate(function()
                    return theme.get("image")
                end,40,1),
                Image = computed(function()
                    if get(hasImage) then
                        return get(icon)
                    end
                    return ""
                end),
                Size = UDim2.fromOffset(24,24),
                Position = UDim2.fromOffset(10,8)
            },
            new "Frame" {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(24,24),
                Position = UDim2.new(1,-34,0,8),

                [children] = {
                    new "ImageLabel" {
                        AnchorPoint = Vector2.new(0.5,0.5),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1,1),
                        Position = UDim2.fromScale(0.5,0.5),
                        ImageColor3 = animate(function()
                            if get(isClosed) then
                                return theme.get("image")
                            end
                            return tabColor or theme.get("defaultTab")
                        end,40,1),
                        Image = icons['chevron'],
                        Rotation = animate(function()
                            if get(isClosed) then
                                return 0
                            end
                            return 180
                        end,30,1)
                    }
                }
            },
            new "Frame" {
                Name = "componentHolder",
                Size = computed(function()
                    return UDim2.new(1,0,0,get(size) - 40)
                end),
                Position = UDim2.fromOffset(0,40),
                BackgroundTransparency = 1,

                [onevent "ChildAdded"] = function(child)
                    if typeof(child) == "Instance" and not child:IsA("UIListLayout") then
                        local oldY = child.AbsoluteSize.Y
                        size:set(get(size) + child.AbsoluteSize.Y + 5)
                        --print(get(size), child.Name)

                        child.Changed:Connect(function(groupPropertyerty)
                            if groupPropertyerty:lower() == "absolutesize" then
                                if oldY ~= math.round(child.AbsoluteSize.Y) then
                                    size:set(get(size) - oldY + math.round(child.AbsoluteSize.Y))
                                    oldY = math.round(child.AbsoluteSize.Y)
                                end
                            end
                        end)
                    end
                end,

                [children] = {
                    new "UIListLayout" {
                        Padding = UDim.new(0,5),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    },
                    new "UIPadding" {
                        PaddingLeft = UDim.new(0,5),
                        PaddingRight = UDim.new(0,5),
                    }
                }
            }
        }
    }
    if get(icon) ~= "" then
        hasImage:set(true)
    end

    local returnFunctions = {}
    function returnFunctions:SetName(n)
        if typeof(n) == "string" then
            name:set(n)
        else
            error("You entered a "..typeof(n).." instead of a string")
        end
    end
    function returnFunctions:SetIcon(n)
        if typeof(n) == "string" then
            icon:set(n)
        else
            error("You entered a "..typeof(n).." instead of a string")
        end
    end
    function returnFunctions:Lock(reason)
		isLocked:set(true)
        oldisClosed:set(get(isClosed))
        isClosed:set(true)
		lockReason:set(reason or "Locked")
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
        isClosed:set(get(oldisClosed))
	end
    return newGroup.componentHolder,returnFunctions
end