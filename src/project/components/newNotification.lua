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
local tween = require(project.utilities.tween)
local getStringBounds = require(project.utilities.getStringBounds)

local function roundTo(decimal, number)
    local point = 1
    for i=1,decimal do
        point = point*10
    end
    local stringed = tostring(math.round(number*point)/point)
    local tstringed = string.split(stringed, ".")
    if #tstringed == 1 then
        local zeros = ""
        for i=1,decimal do
            zeros = zeros.."0"
        end
        stringed = stringed.."."..zeros
    end
    return stringed
end

return function(notificationProperty)
    assert(notificationProperty.Title, "Notify needs a Title")
	assert(typeof(notificationProperty.Title) == "string", ("Title accepts type string got %s"):format(typeof(notificationProperty.Title)))
    assert(notificationProperty.Body, "Notfiy needs a Body")
    assert(typeof(notificationProperty.Body) == "string", ("Body accepts type string got %s"):format(typeof(notificationProperty.Body)))
    assert(notificationProperty.Duration, "Notify needs a Duration")
    assert(typeof(notificationProperty.Duration) == "number", ("Duration accepts type number got %s"):format(typeof(notificationProperty.Duration)))

    local parent = value(notificationProperty.Parent)

    local title = value(notificationProperty.Title)
    local body = value(notificationProperty.Body)
    local duration = value(notificationProperty.Duration)
    local bodySize = value(getStringBounds(notificationProperty.Body, {
        TextSize = 13,
        Font = Enum.Font.Gotham,
        VectorSize = Vector2.new(230,1000)
    }).Y)
    local loaded = value(false)
    local resized = value(false)
    local tickText = value("")

    local newNotification

    newNotification = new "Frame" {
        AnchorPoint = Vector2.new(0,0.5),
        BackgroundTransparency = 1,

        Parent = get(parent),
        Size = animate(function()
            if get(loaded) then
                task.delay(0.4,function()
                    resized:set(true)
                end)
                return UDim2.fromOffset(230,25 + get(bodySize) + 15)
            end
            return UDim2.fromOffset(230,0)
        end,20,1),

        [children] = {
            new "TextButton" {
                AnchorPoint = Vector2.new(0,0.5),
                BackgroundTransparency = 0,

                BackgroundColor3 = animate(function()
                    return theme.get("background")
                end,40,1),
                Size = computed(function()
                    return UDim2.fromOffset(230,25 + get(bodySize) + 15)
                end),
                Position = animate(function()
                    if get(resized) then
                        return UDim2.fromScale(0,0.5)
                    end
                    return UDim2.fromScale(1.2,0.5)
                end,30,1),

                [onevent "Activated"] = function()
                    resized:set(false)
                    task.wait(0.4)
                    loaded:set(false)
                    task.wait(2)
                    newNotification:Destroy()
                end,

                [children] = {
                    new "UICorner" {CornerRadius = UDim.new(0,4)},
                    new "TextLabel" {
                        Name = "Title",
                        Size = UDim2.new(1,-5,0,18),
                        Position = UDim2.new(0,5,0,5),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.GothamMedium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = 18,

                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Text = get(title)
                    },
                    new "TextLabel" {
                        Name = "Body",
                        Size = UDim2.new(1,-8,0,get(bodySize)),
                        Position = UDim2.fromOffset(8,25),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.Gotham,
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextTransparency = 0.2,
                        TextWrapped = true,

                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Text = get(body)
                    },
                    new "TextLabel" {
                        Size = UDim2.fromOffset(100,10),
                        AnchorPoint = Vector2.new(1,1),
                        Position = UDim2.new(1,-5,1,-5),
                        Text = computed(function()
                            return get(tickText)
                        end),
                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Right
                    },
                    new "Frame" {
                        Name = "timer",
                        ZIndex = 0,
                        AnchorPoint = Vector2.new(0,1),
                        Position = UDim2.fromScale(0,1),

                        BackgroundColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Size = tween(function()
                            if get(resized) then
                                return UDim2.new(1,0,0,10)
                            end
                            return UDim2.new(0,0,0,10)
                        end,TweenInfo.new(get(duration), Enum.EasingStyle.Linear)),

                        [children] = {
                            new "UICorner" {CornerRadius = UDim.new(0,4)},
                            new "Frame" {
                                AnchorPoint = Vector2.new(0.5,0),
                                Size = UDim2.fromScale(1,0.6),
                                Position = UDim2.fromScale(0.5,0),
                                BackgroundColor3 = animate(function()
                                    return theme.get("background")
                                end,40,1)
                            }
                        }
                    }
                }
            }
        }
    }
    task.spawn(function()
        repeat task.wait() until get(resized)
        local startTick = tick()
        local endTick
        repeat
            endTick = tick() - startTick
            tickText:set(roundTo(1,math.clamp(endTick,0,get(duration))))
            task.wait()
        until endTick > get(duration)
    end)
    task.spawn(function()
        task.wait()
        loaded:set(true)
        repeat task.wait() until get(resized)
        task.wait(get(duration))
        resized:set(false)
        task.wait(0.4)
        loaded:set(false)
        task.wait(2)
        newNotification:Destroy()
    end)
end