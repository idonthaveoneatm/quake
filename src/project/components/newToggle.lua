local project = script.Parent.Parent

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

return function(toggleProperty)
	assert(toggleProperty.Name, ":Toggle missing property Name")
	assert(typeof(toggleProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(toggleProperty.Name)))
	assert(toggleProperty.Callback, ":Toggle missing property Callback")
	assert(typeof(toggleProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(toggleProperty.Callback)))
	if toggleProperty.Default then
		assert(typeof(toggleProperty.Default) == "boolean", ("Default accepts type boolean got %s"):format(typeof(toggleProperty.Default)))

	end

	local name = value(toggleProperty.Name)
	local callback = value(toggleProperty.Callback)
	local default = value(toggleProperty.Default or false)

	local tabColor = toggleProperty.tabColor or nil

	local toggled = value(false)
	local isLocked = value(false)
	local lockReason = value("")
	observe(toggled):onChange(function()
		if not get(isLocked) then
			task.spawn(get(callback), get(toggled))
		end
	end)

	local newToggle = new "TextButton" {
		Parent = toggleProperty.Parent,
		Interactable = computed(function()
			return not get(isLocked)
		end),
		Size = UDim2.new(1,0,0,40),
		AutoButtonColor = false,

		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[onevent "Activated"] = function()
			toggled:set(not get(toggled))
		end,

		[children] = {
			{ -- Lock
				new "Frame" {
					ZIndex = 3,
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
				Size = UDim2.new(1,0,1,0),
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(0.5,0,0.5,0),
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
				Size = UDim2.new(1,-45,0,14),
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
			},
			new "ImageLabel" {
				AnchorPoint = Vector2.new(1,0),
				Position = UDim2.new(1,-5,0,6),
				Size = UDim2.fromOffset(28,28),
				BackgroundTransparency = 1,
				Image = icons['emptyBox'],
				
				ImageColor3 = animate(function()
					return theme.get("image")
				end,40,1),

				[children] = {
					new "UICorner" {
						CornerRadius = UDim.new(1,0)
					},
					new "ImageLabel" {
						AnchorPoint = Vector2.new(0.5,0.5),
						Position = UDim2.fromScale(0.5,0.5),
						Size = UDim2.new(1,0,1,0),
						BackgroundTransparency = 1,
						Image = icons['filledBox'],
						
						ImageColor3 = animate(function()
							return theme.get("image")
						end,40,1),
						ImageTransparency = animate(function()
							if get(toggled) then
								return 0
							end
							return 1
						end,30,1),

						[children] = {
							new "UICorner" {
								CornerRadius = UDim.new(1,0)
							}
						}
					}
				}

			}
		}
	}

	toggled:set(get(default))

	local returnFunctions = {}
	function returnFunctions:Remove()
		newToggle:Destroy()
	end
	function returnFunctions:SetValue(newValue)
		if typeof(newValue) == "boolean" then
			toggled:set(newValue)
		else
			error("You didn't give "..get(name).." a boolean for SetValue")
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