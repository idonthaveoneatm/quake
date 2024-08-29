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
local mathModule = require(project.Bundles.betterMathModule)

return function(dropdownProperty)
	assert(dropdownProperty.Name, ":Dropdown missing property Name")
	assert(typeof(dropdownProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(dropdownProperty.Name)))
	assert(dropdownProperty.Callback, ":Dropdown missing property Callback")
	assert(typeof(dropdownProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(dropdownProperty.Callback)))
	assert(dropdownProperty.Items, ":Dropdown missing property Items")
	assert(typeof(dropdownProperty.Items) == "table", ("Callback accepts type table got %s"):format(typeof(dropdownProperty.Items)))
	if dropdownProperty.Multiselect then
		assert(typeof(dropdownProperty.Multiselect) == "boolean", ("Multiselect accepts type boolean got %s"):format(typeof(dropdownProperty.Multiselect)))
	end
	if dropdownProperty.Default then
		assert((typeof(dropdownProperty.Default) == "string" or typeof(dropdownProperty.Default) == "table"), ("Default accepts type string or table got %s"):format(typeof(dropdownProperty.Default)))
	end

	local defaultSelected = value(dropdownProperty.Default)
	local dropdownName = value(dropdownProperty.Name)
	local items = value(dropdownProperty.Items)
	local callback = value(dropdownProperty.Callback)
	local multiselect = value(dropdownProperty.Multiselect or false)

	local tabColor = dropdownProperty.tabColor or nil

	local itemTable = value({})
	local multiTable = {}
	local defaultName = value(get(dropdownName))

	local selectedAmount = value(0)
	local selectedItem = value("")

	local itemsRef,searchBoxRef = value(), value()
	local down = value(false)
	local open = value(false)
	local searchText = value("")
	local itemsWithFunctions = {}
	local isLocked = value(false)
	local lockReason = value("")
	local oldOpen = value(false)

	local newDropdown = new "Frame" {
		ClipsDescendants = true,

		Parent = dropdownProperty.Parent,
		Name = get(defaultName),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		Size = animate(function()
			if get(open) then
				return UDim2.new(1,0,0,174)
			end
			return UDim2.new(1,0,0,40)
		end,50,1),

		[children] = {
			{ -- Lock
				new "UICorner" {CornerRadius = UDim.new(0,6)},
				new "Frame" {
					ZIndex = 2,
					Size = UDim2.fromScale(1,1),
					AnchorPoint = Vector2.new(0.5,0),
					Position = UDim2.fromScale(0.5,0),

					BackgroundColor3 = animate(function()
						return tabColor or theme.get("defaultTab")
					end,40,1),
					BackgroundTransparency = animate(function()
						if get(down) then
							return 0.95
						end
						return 0.85
					end,50,1),

					[children] = {
						new "UICorner" {CornerRadius = UDim.new(0,6)}
					}
				},
				new "TextLabel" {
					BackgroundTransparency = 1,
					Size = UDim2.new(1,-45,0,14),
					AnchorPoint = Vector2.new(0,0),
					Position = UDim2.new(0,10,0,13),
					Font = Enum.Font.Gotham,
					TextScaled = true,
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,

					Text = computed(function()
						return get(dropdownName)
					end),
					TextColor3 = animate(function()
						return theme.get("text")
					end,40,1),
					TextTransparency = animate(function()
						if get(down) then
							return 0.35
						end
						return 0
					end,50,1),

					[children] = {
						new "UITextSizeConstraint" {
							MinTextSize = 1,
							MaxTextSize = 14
						}
					}
				},
				new "ImageLabel" {
					Name = "icon",
					AnchorPoint = Vector2.new(1,0),
					Position = UDim2.new(1,-5,0,6),
					Size = UDim2.fromOffset(28,28),
					BackgroundTransparency = 1,
					Image = icons['dropdown'],

					ImageColor3 = animate(function()
						return theme.get("image")
					end,40,1),
					ImageTransparency = animate(function()
						if get(down) then
							return 0.35
						end
						return 0
					end,50,1),
				},
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
				}
			},
			new "TextButton" { -- Button
				Interactable = computed(function()
					return not get(isLocked)
				end),
				Size = UDim2.new(1,0,0,40),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5,0),
				Position = UDim2.fromScale(0.5,0),

				[onevent "MouseButton1Down"] = function()
					down:set(true)
				end,
				[onevent "MouseButton1Up"] = function()
					down:set(false)
				end,
				[onevent "MouseLeave"] = function()
					down:set(false)
				end,
				[onevent "Activated"] = function()
					open:set(not get(open))
				end,
			},
			new "TextBox" { -- Search
				Name = "searchBox",
				Size = UDim2.new(1,-16,0,28),
				Position = UDim2.new(0.5,0,0,40),
				Text = "",
				AnchorPoint = Vector2.new(0.5,0),
				PlaceholderText = "Search",
				Font = Enum.Font.GothamMedium,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,

				BackgroundColor3 = animate(function()
					return tabColor or theme.get("defaultTab")
				end,40,1),
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				PlaceholderColor3 = animate(function()
					return theme.get("placeholder")
				end,40,1),
				BackgroundTransparency = animate(function()
					if get(down) then
						return 0.95
					end
					return 0.8
				end,50,1),
				TextTransparency = animate(function()
					if get(down) then
						return 0.35
					end
					return 0
				end,50,1),

				[onevent "Changed"] = function(dropdownPropertyerty)
					if dropdownPropertyerty == "Text" then
						local searchBox = get(searchBoxRef)
						local items = get(itemsRef)
						searchText:set(string.lower(searchBox.Text))

						if get(searchText) ~= "" then
							for _,item in ipairs(items:GetChildren()) do
								if get(searchText) == "" then break end
								if item:IsA("TextButton") then
									local result = mathModule.String:JaroWinklerDistance({get(searchText), item.Name})
									if result < 0.45 then
										item.Visible = true
									else
										item.Visible = false
									end
								end
								task.wait()
							end
						else
							for _,item in ipairs(items:GetChildren()) do
								if item:IsA("TextButton") then
									item.Visible = true
								end
							end
						end
					end
				end,

				[ref] = searchBoxRef,

				[children] = {
					{
						new "UICorner" {
							CornerRadius = UDim.new(0,4)
						},
						new "UIPadding" {
							PaddingLeft = UDim.new(0,10)
						}
					}
				}
			},
			new "ScrollingFrame" { -- Items
				Name = "Items",
				Size = UDim2.new(1,0,0,94),
				BackgroundTransparency = 1,
				ScrollBarThickness = 2,
				Position = UDim2.new(0.5,0,0,72),
				AnchorPoint = Vector2.new(0.5,0),
				CanvasSize = UDim2.new(0,0,0,0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,

				ScrollBarImageColor3 = animate(function()
					return tabColor or theme.get("defaultTab")
				end,40,1),

				[ref] = itemsRef,

				[children] = {
					new "UIListLayout" {
						Padding = UDim.new(0,2),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}
			}
		}
	}
	observe(itemTable):onChange(function()
		local tableToSet = {}
		dropdownName:set(get(defaultName))
		selectedAmount:set(0)

		for _,item in ipairs(get(itemTable)) do
			local hover = value(false)
			local isSelected = value(false)
			observe(isSelected):onChange(function()
				if get(multiselect) then
					if get(isSelected) then
						selectedAmount:set(get(selectedAmount) + 1)
					else
						selectedAmount:set(get(selectedAmount) - 1)
					end
					dropdownName:set(get(defaultName)..": "..tostring(get(selectedAmount)).."/"..tostring(#get(items)))
				else
					dropdownName:set(get(defaultName)..": "..get(selectedItem))
				end
			end)
			observe(selectedItem):onChange(function()
				if not get(multiselect) then
					if get(selectedItem) == item then
						isSelected:set(true)
					else
						isSelected:set(false)
					end
				end
			end)

			local itemComponent = new "TextButton" {
				Size = UDim2.new(0.95,0,0,30),

				Name = item,
				Parent = get(itemsRef),
				BackgroundColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				BackgroundTransparency = animate(function()
					if get(hover) then
						return 0.95
					end
					return 1
				end,50,1),

				[onevent "MouseEnter"] = function()
					hover:set(true)
				end,
				[onevent "MouseLeave"] = function()
					hover:set(false)
				end,
				[onevent "Activated"] = function()
					if get(multiselect) then
						if get(isSelected) then
							isSelected:set(false)
							table.remove(multiTable,table.find(multiTable,item))
						else
							isSelected:set(true)
							table.insert(multiTable,item)
						end
						task.spawn(get(callback), multiTable)
					else
						open:set(false)
						selectedItem:set(item)
						task.spawn(get(callback), get(selectedItem))
					end
				end,
				[children] = {
					new "UICorner" {CornerRadius = UDim.new(0,6)},
					new "TextLabel" {
						Size = UDim2.new(1,0,0,12),
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0.5,0.5),
						AnchorPoint = Vector2.new(0.5,0.5),
						Font = Enum.Font.Gotham,
						TextSize = 12,
						TextXAlignment = Enum.TextXAlignment.Left,

						Text = item,
						TextColor3 = animate(function()
							if get(multiselect) then
								if get(isSelected) and not get(hover) then
									return Color3.fromRGB(85, 220, 135)
								elseif get(isSelected) and get(hover) then
									return Color3.fromRGB(190, 100, 105)
								else
									return theme.get("text")
								end
							end
							return theme.get("text")
						end,30,1),
						TextTransparency = animate(function()
							if get(down) then
								return 0.35
							end
							return 0
						end,50,1),

						[children] = {
							new "UIPadding" {PaddingLeft = UDim.new(0,20)},
						}
					}
				}
			}

			if typeof(get(defaultSelected)) == "table" and get(multiselect) then
				for _,s in ipairs(get(defaultSelected)) do
					if s == item then
						isSelected:set(true)
						table.insert(multiTable,item)
					end
				end
			elseif typeof(get(defaultSelected)) == "string" then
				if get(defaultSelected) == item then
					if get(multiselect) then
						isSelected:set(true)
						table.insert(multiTable,item)
					else
						selectedItem:set(get(defaultSelected))
						task.spawn(get(callback), get(selectedItem))
					end
				end
			end
			itemsWithFunctions[item] = function(selectValue)
				isSelected:set(selectValue)
			end
		end
		if get(multiselect) and  #multiTable > 0 then
			task.spawn(get(callback), multiTable)
		end
	end)
	itemTable:set(get(items))

	local returnFunctions = {}
	function returnFunctions:Remove()
		newDropdown:Destroy()
	end
	function returnFunctions:SetItems(newTable)
		if typeof(newTable) == "table" then
			itemTable:set(newTable)
		else
			error("You didn't give "..get(defaultName).." a table for SetItems")
		end
	end
	function returnFunctions:SelectItem(item)
		if not get(multiselect) then
			if typeof(item) == "string" then
				local isInTable = false
				for _,v in ipairs(get(itemTable)) do
					if v == item then
						isInTable = true
					end
				end
				if isInTable then
					selectedItem:set(item)
					for _,v in ipairs(itemsWithFunctions) do
						v(false)
					end
					itemsWithFunctions[item](true)
					task.spawn(get(callback), get(selectedItem))
				else
					error(item.." isn't in your Item table")
				end
			else
				error("You tried to pass a "..typeof(item).." as a string for SelectItem")
			end
		else
			error(get(defaultName).." is multiselectable. Use SelectItems")
		end
	end
	function returnFunctions:SelectItems(newSelecteds)
		if get(multiselect) then
			if typeof(newSelecteds) == "table" then
				local areInTable = {}
				for _,v in ipairs(newSelecteds) do
					if table.find(get(itemTable), v) then
						table.insert(areInTable, v)
					else
						warn(v.." isn't in the Items table")
					end
				end
				task.wait()
				for _,v in ipairs(areInTable) do
					itemsWithFunctions[v](true)
				end
				task.spawn(get(callback), areInTable)
				multiTable = areInTable
			else
				error("You tried to pass a "..typeof(newSelecteds).." as a table for SelectItems")
			end
		else
			error(get(defaultName).." isn't multiselectable. Use SelectItems")
		end
	end
	function returnFunctions:Lock(reason)
		isLocked:set(true)
		oldOpen:set(get(open))
		lockReason:set(reason or "Locked")
		open:set(false)
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
		open:set(get(oldOpen))
	end
	return returnFunctions
end