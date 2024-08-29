local project = script.Parent.Parent

local services = require(project.Bundles.services)
local RunService = services.RunService
local UserInputService = services.UserInputService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local ref = Fusion.Ref
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(sliderProperty)
	assert(sliderProperty.Name, ":Slider needs a Name")
	assert(typeof(sliderProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(sliderProperty.Name)))
	assert(sliderProperty.Max, ":Slider needs a Max")
	assert(typeof(sliderProperty.Max) == "number", ("Max accepts type number got %s"):format(typeof(sliderProperty.Max)))
	assert(sliderProperty.Min, ":Slider needs a Min")
	assert(typeof(sliderProperty.Min) == "number", ("Min accepts type number got %s"):format(typeof(sliderProperty.Min)))
	assert(sliderProperty.Callback, ":Slider needs a Callback")
	assert(typeof(sliderProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(sliderProperty.Callback)))
	if sliderProperty.Placement then
		assert(typeof(sliderProperty.Placement) == "number", ("Placement accepts type number got %s"):format(typeof(sliderProperty.Placement)))
	end
	if sliderProperty.InitialValue then
		assert(typeof(sliderProperty.InitialValue) == "number", ("InitialValue accepts type number got %s"):format(typeof(sliderProperty.InitialValue)))
	end

	local name = value(sliderProperty.Name)
	local callback = value(sliderProperty.Callback)
	local max = value(sliderProperty.Max)
	local min = value(sliderProperty.Min)
	local roundTo = value(sliderProperty.Placement or 0)
	local initialValue = value(sliderProperty.InitialValue or get(min))

	local tabColor = sliderProperty.tabColor or nil

	local sliderRef = value()
	local buttonRef = value()

	local mouseEntered = value(false)
	local button1Down = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local function Round(Value)
		if get(roundTo) == 0 then
			return math.floor(Value)
		end
		return tonumber(string.format('%.' .. get(roundTo) .. 'f', Value))
	end
	local function mapValue(Value, MinA, MaxA, MinB, MaxB)
		return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB
	end
	local function GetValueFromXOffset(X)
		return Round(mapValue(X, 0, 180, get(min), get(max)))
	end

	local percentage = value(0)
	local percentageOf = value(get(min))
	observe(percentageOf):onChange(function()
		percentage:set(mapValue(get(percentageOf), get(min), get(max), 0, 1))
		if not get(isLocked) then
			task.spawn(get(callback), get(percentageOf))
		end
	end)

	if get(initialValue) < get(min) or get(initialValue) > get(max) then
		warn("InitialValue for "..get(name).." is either too big or too small! InitialValue = "..tostring(get(min)))
		initialValue:set(get(min))
	end

	UserInputService.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and get(button1Down) then
			button1Down:set(false)
		end
	end)

	local newSlider = new "Frame" {
		Size = UDim2.new(1,0,0,40),
		ClipsDescendants = true,

		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		Parent = sliderProperty.Parent,

		[onevent "MouseEnter"] = function()
			mouseEntered:set(true)
		end,
		[onevent "MouseLeave"] = function()
			mouseEntered:set(false)
		end,

		[children] = {
			{
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
				new "Frame" {
					ZIndex = 2,
					Size = UDim2.fromScale(1,1),
					AnchorPoint = Vector2.new(0.5,0),
					Position = UDim2.fromScale(0.5,0),
					BackgroundTransparency = 0.85,

					BackgroundColor3 = animate(function()
						return tabColor or theme.get("defaultTab")
					end,40,1),

					[children] = {
						new "UICorner" {
							CornerRadius = UDim.new(0,6)
						}
					}
				},
				new "TextLabel" {
					BackgroundTransparency = 1,
					Size = UDim2.new(1,-220,0,14),
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(0,10,0.5,0),
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
				}
			},
			new "CanvasGroup" {
				AnchorPoint = Vector2.new(1,0.5),
				Position = UDim2.new(1,-10,0.5,0),

				BackgroundColor3 = animate(function()
					return theme.get("image")
				end,40,1),
				Size = animate(function()
					if get(mouseEntered) and not get(isLocked) then
						return UDim2.fromOffset(180,16)
					end
					return UDim2.fromOffset(180,4)
				end,40,1),

				[children] = {
					new "UICorner" {
						CornerRadius = animate(function()
							if get(mouseEntered) then
								return UDim.new(0,4)
							end
							return UDim.new(0,6)
						end,40,1),
					},
					new "TextButton" {
						Interactable = computed(function()
							return not get(isLocked)
						end),
						AnchorPoint = Vector2.new(0.5,0.5),
						Size = UDim2.fromScale(1,1),
						Position = UDim2.fromScale(0.5,0.5),
						BackgroundTransparency = 1,

						[onevent "MouseButton1Down"] = function()
							button1Down:set(true)
						end,
						[onevent "TouchLongPress"] = function()
							button1Down:set(true)
						end,
						[onevent "InputBegan"] = function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								local mPos = UserInputService:GetMouseLocation().X
								local gPos = get(sliderRef).Size.X.Offset
								local Diff = mPos - (get(sliderRef).AbsolutePosition.X + gPos)

								while get(button1Down) and not get(isLocked) and task.wait() do
									local nMPos = UserInputService:GetMouseLocation().X
                    				local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, 180)
									
									percentageOf:set(GetValueFromXOffset(nX))
									RunService.RenderStepped:Wait()
								end
							end
						end,

						[ref] = buttonRef,
						[children] = {
							new "Frame" {
								Name = "ChangeThing",
								AnchorPoint = Vector2.new(0,0.5),
								Position = UDim2.fromScale(0,0.5),

								BackgroundColor3 = animate(function()
									return tabColor or theme.get("defaultTab")
								end,40,1),
								Size = animate(function()
									return UDim2.fromScale(get(percentage),1)
								end,60,1),

								[ref] = sliderRef
							}
						}
					},
				}
			},
			new "TextLabel" {
				AnchorPoint = Vector2.new(1,0.5),
				Size = UDim2.fromOffset(20,14),
				Position = UDim2.new(1,-195,0.5,0),
				BackgroundTransparency = 1,
				Text = computed(function()
					return tostring(get(percentageOf))
				end),
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Font = Enum.Font.Gotham,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextScaled = true,

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			}
		}
	}

	percentageOf:set(get(initialValue))

	local returnFunctions = {}
	function returnFunctions:Remove()
		newSlider:Destroy()
	end
	function returnFunctions:SetValue(newValue)
		if typeof(newValue) == "number" and (newValue <= get(max)) and (newValue >= get(min)) then

			percentageOf:set(newValue)
		elseif typeof(newValue) ~= "number" then
			error("You didn't give "..get(name).." a number for SetValue")
		else
			error("Your SetValue for "..get(name).." is great or smaller than the maximum or minimum")
		end
	end
	function returnFunctions:SetMin(newMin)
		if typeof(newMin) == "number" and (newMin < get(max)) then
			min:set(newMin)
			local button = get(buttonRef)
			button.ChangeThing.ZIndex = 2
			button.ChangeThing.ZIndex = 1
		elseif typeof(newMin) ~= "number" then
			error("You didn't give "..get(name).." a number for SetMin")
		else
			error("Your SetMin for "..get(name).." is great than the maximum")
		end
	end
	function returnFunctions:SetMax(newMax)
		if typeof(newMax) == "number" and (newMax < get(min)) then
			max:set(newMax)
			local button = get(buttonRef)
			button.ChangeThing.ZIndex = 2
			button.ChangeThing.ZIndex = 1
		elseif typeof(newMax) ~= "number" then
			error("You didn't give "..get(name).." a number for SetMax")
		else
			error("Your SetMax for "..get(name).." is smaller than the minimum")
		end
	end
	function returnFunctions:Lock(reason)
		isLocked:set(true)
		lockReason:set(reason or "Locked")
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
	end
	return returnFunctions
end