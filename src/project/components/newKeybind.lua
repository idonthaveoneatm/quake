local project = script.Parent.Parent

local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local ref = Fusion.Ref

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)
local connections = require(project.utilities.connections)

return function(keybindProperty)
	assert(keybindProperty.Name, ":Keybind missing property Name")
	assert(typeof(keybindProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(keybindProperty.Name)))
	assert(keybindProperty.Callback, ":Keybind missing property Callback")
	assert(typeof(keybindProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(keybindProperty.Callback)))
	assert(keybindProperty.Default, ":Keybind missing property Default")
	assert(typeof(keybindProperty.Default) == "string", ("Default accepts type string got %s"):format(typeof(keybindProperty.Default)))

	local name = value(keybindProperty.Name)
	local callback = value(keybindProperty.Callback)
	local bind = value(string.upper(keybindProperty.Default))

	local tabColor = keybindProperty.tabColor or nil

	local textRef = value()
	local focused = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local returnFunctions = {}

	local newKeybind = new "TextButton" {
		Interactable = computed(function()
			return not get(isLocked)
		end),
		Size = UDim2.new(1,0,0,40),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		Parent = keybindProperty.Parent,

		[onevent "MouseButton1Click"] = function()
			local textBox = get(textRef)
			textBox:CaptureFocus()
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
				new "UICorner" {CornerRadius = UDim.new(0,6)},
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
					Size = UDim2.new(1,-60,0,14),
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(0,10,0.5,0),
					Font = Enum.Font.Gotham,
					TextScaled = true,
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTransparency = 0,

					Text = get(name),
					TextColor3 = animate(function()
						return theme.get("text")
					end,40,1),

					[children] = {
						new "UITextSizeConstraint" {
							MinTextSize = 1,
							MaxTextSize = 14
						},
					}
				},
				new "Frame" {
					ZIndex = 3,
					Size = UDim2.new(0,30,0,24),
					AnchorPoint = Vector2.new(1,0.5),
					Position = UDim2.new(1,-10,0.5,0),
					BackgroundTransparency = 0.25,

					BackgroundColor3 = animate(function()
						return theme.get("secondaryBackground")
					end,40,1),

					[children] = {
						new "UICorner" {
							CornerRadius = UDim.new(0,6)
						},
					}
				}
			},
			new "TextBox" {
				Interactable = computed(function()
					return not get(isLocked)
				end),
				ZIndex = 3,
				AnchorPoint = Vector2.new(1,0.5),
				Position = UDim2.new(1,-10,0.5,0),
				Size = UDim2.new(0,30,0,12),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Center,
				PlaceholderText = ". . .",
				Font = Enum.Font.Gotham,
				TextSize = 12,

				PlaceholderColor3 = animate(function()
					return theme.get("placeholder")
				end,40,1),
				TextColor3 = animate(function()
					if get(focused) then
						return theme.get("text")
					end
					return tabColor or theme.get("defaultTab")
				end,50,1),
				Text = computed(function()
					return get(bind)
				end),

				[onevent "Focused"] = function()
					focused:set(true)
					bind:set("")
				end,
				[onevent "FocusLost"] = function()
					focused:set(false)
				end,

				[ref] = textRef
			}
		}
	}
	local connectedFunction = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if get(focused) then
			if input.KeyCode ~= Enum.KeyCode.Unknown then
				local tmp = string.split(tostring(input.KeyCode), ".")
				bind:set(tmp[3])
				get(textRef):ReleaseFocus()
			end
		elseif not gameProcessed and (get(bind) ~= "") and (input.KeyCode == Enum.KeyCode[get(bind)]) and newKeybind then
			if not get(isLocked) then
				task.spawn(get(callback))
			end
		end
	end)
	connections.add(connectedFunction)

	function returnFunctions:Remove()
		newKeybind:Destroy()
		connectedFunction:Disconnect()
	end
	function returnFunctions:SetBind(newBind: string)
		if typeof(newBind) == "string" then
			bind:set(string.upper(newBind))
		else
			error("you didnt give "..get(name).." a string for SetBind!")
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