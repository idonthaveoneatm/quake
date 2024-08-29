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

return function(buttonProperty)
	assert(buttonProperty.Name, ":Button missing property Name")
	assert(typeof(buttonProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(buttonProperty.Name)))
	assert(buttonProperty.Callback, ":Button missing property Callback")
	assert(typeof(buttonProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(buttonProperty.Callback)))

	local name = value(buttonProperty.Name)
	local callback = value(buttonProperty.Callback)

	local tabColor = buttonProperty.tabColor or nil

	local isDown = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local newButton = new "TextButton" {
		Parent = buttonProperty.Parent,
		ZIndex = 2,
		Size = UDim2.new(1,0,0,40),
		AutoButtonColor = false,
		Interactable = computed(function()
			return not get(isLocked)
		end),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[onevent "MouseButton1Down"] = function()
			isDown:set(true)
		end,
		[onevent "MouseButton1Up"] = function()
			isDown:set(false)
		end,
		[onevent "MouseLeave"] = function()
			isDown:set(false)
		end,
		[onevent "Activated"] = function()
			task.spawn(get(callback))
		end,


		[children] = {
			new "UICorner" {
				CornerRadius = UDim.new(0,6)
			},
			{ -- Lock
				new "Frame" {
					ZIndex = 3,
					Size = UDim2.fromScale(1,1),
					BackgroundTransparency = 0.1,
					BackgroundColor3 = animate(function()
						return theme.get("tertiaryBackground")
					end,40,1),
					Visible = computed(function()
						return get(isLocked)
					end),

					[children] = {
						new "ImageLabel" {
							AnchorPoint = Vector2.new(0,0.5),
							Size = UDim2.fromOffset(24,24),
							Position = UDim2.new(0,10,0.5),
							BackgroundTransparency = 1,
							Image = icons['lock'],
							ImageColor3 = animate(function()
								return theme.get("image")
							end,40,1)
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
							TextSize = 16,
							TextScaled = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = animate(function()
								return theme.get("text")
							end,40,1),

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
			new "Frame" { -- Background
				ZIndex = 2,
				Size = UDim2.new(1,0,1,0),
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(0.5,0,0.5,0),
				BackgroundColor3 = animate(function()
					return tabColor or theme.get("defaultTab")
				end,40,1),
				BackgroundTransparency = animate(function()
					if get(isDown) then
						return 0.95
					end
					return 0.85
				end,50,1),

				[children] = {
					new "UICorner" {
						CornerRadius = UDim.new(0,6)
					}
				}
			},
			new "TextLabel" { -- Name
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-20,0,14),
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,10,0.5,0),
				Font = Enum.Font.Gotham,
				TextScaled = true,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Text = computed(function()
					return get(name)
				end),
				TextTransparency = animate(function()
					if get(isDown) then
						return 0.35
					end
					return 0
				end,50,1),

				[children] = {
					new "UITextSizeConstraint"{
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:Remove()
		newButton:Destroy()
	end
	function returnFunctions:SetName(newText)
		if typeof(newText) == "string" then
			name:set(newText)
		else
			error("You didnt give "..get(name).." a string for SetName")
		end
	end
	function returnFunctions:SetCallback(newFunction)
		if typeof(newFunction) == "function" then
			callback:set(newFunction)
		else
			error("You didnt give "..get(name).." a function for SetCallback")
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