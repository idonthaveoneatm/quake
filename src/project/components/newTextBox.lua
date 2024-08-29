local project = script.Parent.Parent

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

return function(textboxProperty)
	assert(textboxProperty.Name, ":TextBox missing property Name")
	assert(typeof(textboxProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(textboxProperty.Name)))
	assert(textboxProperty.Callback, ":TextBox missing property Callback")
	assert(typeof(textboxProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(textboxProperty.Callback)))
	if textboxProperty.Default then
		assert((typeof(textboxProperty.Default) == "string" or typeof(textboxProperty.Default) == "number"), ("Default accepts type string or number got %s"):format(typeof(textboxProperty.Default)))
	end
	if textboxProperty.PlaceHolderText then
		assert(typeof(textboxProperty.PlaceHolderText) == "string", ("PlaceHolderText accepts type string got %s"):format(typeof(textboxProperty.PlaceHolderText)))
	end
	if textboxProperty.OnlyNumbers then
		assert(typeof(textboxProperty.OnlyNumbers) == "boolean", ("OnlyNumbers accepts type boolean got %s"):format(typeof(textboxProperty.OnlyNumbers)))
	end
	if textboxProperty.OnLeave then
		assert(typeof(textboxProperty.OnLeave) == "boolean", ("OnLeave accepts type boolean got %s"):format(typeof(textboxProperty.OnLeave)))
	end

	local name = value(textboxProperty.Name)
	local callback = value(textboxProperty.Callback)
	local defaultText = value(textboxProperty.Default or "")
	local numbersOnly = value(textboxProperty.OnlyNumbers or false)
	local onLeave = value(textboxProperty.OnLeave or false)

	local tabColor = textboxProperty.tabColor or nil

	local textRef = value()
	local updatedText = value("")
	local focused = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local lastCorrectText = value(get(updatedText))
	observe(updatedText):onChange(function()
		if get(numbersOnly) then
			if tonumber(get(updatedText)) or get(updatedText) == "" then
				lastCorrectText:set(get(updatedText))
			end
		else
			lastCorrectText:set(get(updatedText))
		end
		local textBox = get(textRef)
		if textBox and textBox.Text then
			textBox.Text = get(lastCorrectText)
		end
	end)


	if get(onLeave) then
		observe(focused):onChange(function()
			if not get(focused) then
				if get(numbersOnly) then
					if tonumber(get(updatedText)) then
						task.spawn(get(callback), get(updatedText))
					end
				else
					task.spawn(get(callback), get(updatedText))
				end
			end
		end)
	else
		observe(updatedText):onChange(function()
			if get(numbersOnly) then
				if tonumber(get(updatedText)) then
					task.spawn(get(callback), get(updatedText))
				end
			else
				task.spawn(get(callback), get(updatedText))
			end
		end)
	end

	if get(defaultText) ~= "" then
		updatedText:set(get(defaultText))
	end

	local newTextBox = new "TextButton" {
		Parent = textboxProperty.Parent,
		Interactable = computed(function()
			return not get(isLocked)
		end),
		Size = UDim2.new(1,0,0,40),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[onevent "MouseButton1Click"] = function()
			local text = get(textRef)
			text:CaptureFocus()
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
					Size = UDim2.new(1,-185,0,14),
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
					Size = UDim2.new(0,160,0,24),
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
				Size = UDim2.new(0,160,0,24),
				BackgroundTransparency = 1,
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				PlaceholderText = "Input Here",
				Font = Enum.Font.Gotham,
				TextSize = 12,

				PlaceholderColor3 = animate(function()
					return theme.get("placeholder")
				end,40,1),
				Text = computed(function()
					if get(defaultText) ~= "" then
						return get(defaultText)
					end
					return ""
				end),
				TextColor3 = animate(function()
					if get(focused) then
						return theme.get("text")
					else
						return tabColor or theme.get("defaultTab")
					end
				end,50,1),

				[onevent "Focused"] = function()
					focused:set(true)
				end,
				[onevent "FocusLost"] = function()
					focused:set(false)
				end,

				[onevent "Changed"] = function(textboxPropertyerty)
					if textboxPropertyerty == "Text" then
						local textBox = get(textRef)
						updatedText:set(textBox.Text)
					end
				end,

				[ref] = textRef,

				[children] = {
					new "UIPadding" {
						PaddingLeft = UDim.new(0,5),
						PaddingRight = UDim.new(0,5)
					},
					new "UITextSizeConstraint" {
						MaxTextSize = 12,
						MinTextSize = 1
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:Remove()
		newTextBox:Destroy()
	end
	function returnFunctions:SetInput(newInput)
		if typeof(newInput) == "string" then
			get(textRef).Text = newInput
		else
			error("You didn't give "..get(name).." a string for setInput")
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