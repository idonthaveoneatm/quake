local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local animate = require(project.utilities.animate)
local theme = require(project.Bundles.themeSystem)
local lerpColor = require(project.utilities.lerpColor)

return function(labelProperty)
	assert(labelProperty.Text, "Label just put a string")
	assert(typeof(labelProperty.Text) == "string", "Label needs to literally be a string")

	local textValue = value(labelProperty.Text)

	local tabColor = labelProperty.tabColor or nil

	local newTextLabel = new "Frame" {
		Size = UDim2.new(1,0,0,30),
		Parent = labelProperty.Parent,
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[children] = {
			new "UICorner" {CornerRadius = UDim.new(0,4)},
			new "TextLabel" {
				ZIndex = 2,
				Font = Enum.Font.GothamMedium,
				TextSize = 14,
				RichText = true,
				TextScaled = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-20,0,14),
				Position = UDim2.new(0,10,0.5,0),
				AnchorPoint = Vector2.new(0,0.5),
				TextXAlignment = Enum.TextXAlignment.Left,

				TextColor3 = animate(function()
					return lerpColor(tabColor or theme.get("defaultTab"), "white", 0.5)
				end,40,1),
				Text = computed(function()
					return get(textValue)
				end),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:Remove()
		newTextLabel:Destroy()
	end
	function returnFunctions:SetText(newText)
		if typeof(newText) == "string" then
			textValue:set(newText)
		else
			error("you didnt give "..get(textValue).." a string for SetText!")
		end
	end

	return returnFunctions
end