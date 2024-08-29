local project = script.Parent.Parent

local data = require(project.Bundles.data)
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value,ref = Fusion.Value,Fusion.Ref
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local getStringBounds = require(project.utilities.getStringBounds)
local animate = require(project.utilities.animate)
local randomString = require(project.utilities.randomString)

return function(tbl)
	local tabProperty = get(tbl.tab_data.data)
	tabProperty.Parent = tbl.Parent

	local selectedTab = data.find("selectedTab")
	local selectedFirst = data.find("selectedFirst")

	local name = value(tabProperty.Name)
	local tabColor = tabProperty.tabColor or nil

	local isTabSelected = value(false)
	observe(selectedTab.data):onChange(function()
		if get(selectedTab.data).uid == tabProperty.uid then
			isTabSelected:set(true)
		else
			isTabSelected:set(false)
		end
	end)

	local hover = value(false)
	local xSize = value(0)
	local textRef = value()

	do
		local xySize = getStringBounds(get(name), {
			TextSize = 14,
			Font = Enum.Font.GothamMedium,
			VectorSize = Vector2.new(10000,14)
		})
		if xySize.X < 449 then
			xSize:set(math.abs(xySize.X))
		else
			for i=1,14 do
				local tmpXY = getStringBounds(get(name), {
					TextSize = 14-i,
					Font = Enum.Font.GothamMedium,
					VectorSize = Vector2.new(450,40)
				})
				if tmpXY.X < 450 and tmpXY.Y < 14 then
					xSize:set(math.abs(tmpXY.X+1))
					break
				end
			end
		end
	end

	new "TextButton" {
		ZIndex = 5,
		Name = randomString(16),
		Parent = tabProperty.Parent,
		AnchorPoint = Vector2.new(0,0.5),
		Position = UDim2.fromOffset(30,30),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		ClipsDescendants = true,
		Text = "",
		Size = animate(function()
			if get(hover) then
				return UDim2.fromOffset(get(xSize) +50,40)
			else
				return UDim2.fromOffset(40,40)
			end
		end,20,1),

		[onevent "MouseEnter"] = function()
			hover:set(true)
		end,
		[onevent "MouseLeave"] = function()
			hover:set(false)
		end,
		[onevent "Activated"] = function()
			selectedTab:update("data", get(tbl.tab_data.data))
		end,

		[children] = {
			new "UICorner" {
				CornerRadius = animate(function()
					if get(hover) then
						return UDim.new(0,10)
					else
						return UDim.new(1,0)
					end
				end,30,1),
			},
			new "ImageLabel" {
				ZIndex = 5,
				Name = "icon",
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,6,0.5,0),
				Size = UDim2.fromOffset(28,28),
				BackgroundTransparency = 1,
				Image = tabProperty.Image,
				ImageColor3 = animate(function()
					if get(hover) and not get(isTabSelected) then
						return tabColor or theme.get("defaultTab")
					elseif not get(hover) and not get(isTabSelected) then
						return theme.get("image")
					else
						return tabColor or theme.get("defaultTab")
					end
				end,30,1),
			},
			new "TextLabel" {
				ZIndex = 5,
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,40,0.5,0),
				Size = UDim2.new(0,get(xSize),0,14),
				BackgroundTransparency = 1,
				Text = tabProperty.Name,
				TextScaled = true,
				TextTransparency = animate(function()
					if get(hover) then
						return 0
					end
					return 1
				end,20,1),
				Font = Enum.Font.GothamMedium,
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				TextXAlignment = Enum.TextXAlignment.Left,

				[ref] = textRef,
				[children] = {
					new "UITextSizeConstraint" {
						MaxTextSize = 14,
						MinTextSize = 1
					}
				}
			}
		}
	}
	if not get(selectedFirst.boolean) then
		selectedFirst:update("boolean", true)
		selectedTab:update("data", get(tbl.tab_data.data))
	end
end