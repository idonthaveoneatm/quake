local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local animate = require(project.utilities.animate)
local theme = require(project.Bundles.themeSystem)

return function(sectionProperty)
	assert(sectionProperty.Text, "Section just put a string")
	assert(typeof(sectionProperty.Text) == "string", "Section needs to literally be a string")

	local textValue = value(sectionProperty.Text)
	local returnFunctions = {}

	local newSection = new "Frame" {
		Size = UDim2.new(1,0,0,30),
		BackgroundTransparency = 1,
		Parent = sectionProperty.Parent,

		[children] = {
			new "TextLabel" {
				Size = UDim2.new(1,0,0,15),
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,5,0.5,0),
				BackgroundTransparency = 1,
				TextScaled = true,
				Font = Enum.Font.GothamMedium,
				TextXAlignment = Enum.TextXAlignment.Left,

				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Text = computed(function()
					return get(textValue)
				end),

				[children] = {
					new "UITextSizeConstraint" {
						MaxTextSize = 15,
						MinTextSize = 1
					},
				}
			}
		}
	}

	function returnFunctions:Remove()
		newSection:Destroy()
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