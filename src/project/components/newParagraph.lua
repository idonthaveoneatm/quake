local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local getStringBounds = require(project.utilities.getStringBounds)
local lerpColor = require(project.utilities.lerpColor)

return function(paragraphProperty)
	assert(paragraphProperty.Title, ":Paragraph missing property Title")
	assert(typeof(paragraphProperty.Title) == "string", ("Title accepts type string got %s"):format(typeof(paragraphProperty.Title)))
	assert(paragraphProperty.Body, ":Paragraph missing property Body")
	assert(typeof(paragraphProperty.Body) == "string", ("Body accepts type string got %s"):format(typeof(paragraphProperty.Body)))

	local titleValue = value(paragraphProperty.Title)
	local bodyValue = value(paragraphProperty.Body)
	local ySize = value(getStringBounds(get(bodyValue),{
		Font = Enum.Font.Gotham,
		VectorSize = Vector2.new(math.round(paragraphProperty.Parent.AbsoluteSize.X),1000),
		TextSize = 12
	}).Y)
	paragraphProperty.Parent.Changed:Connect(function(paragraphPropertyerty)
		if paragraphPropertyerty:lower() == "absolutesize" then
			ySize:set(getStringBounds(get(bodyValue),{
				Font = Enum.Font.Gotham,
				VectorSize = Vector2.new(math.round(paragraphProperty.Parent.AbsoluteSize.X),1000),
				TextSize = 12
			}).Y)
		end
	end)
	observe(bodyValue):onChange(function()
		ySize:set(getStringBounds(get(bodyValue),{
			Font = Enum.Font.Gotham,
			VectorSize = Vector2.new(math.round(paragraphProperty.Parent.AbsoluteSize.X),1000),
			TextSize = 12
		}).Y)
	end)

	local newParagraph = new "Frame" {
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		Parent = paragraphProperty.Parent,
		Size = computed(function()
			return UDim2.new(1,0,0,36 + get(ySize))
		end),

		[children] = {
			new "UICorner" {
				CornerRadius = UDim.new(0,4)
			},
			new "UIPadding" {
				PaddingTop = UDim.new(0,10),
				PaddingLeft = UDim.new(0,10),
				PaddingRight = UDim.new(0,10)
			},
			new "TextLabel" {
				Name = "Title",
				RichText = true,
				Position = UDim2.fromScale(0,0),
				Size = UDim2.new(1,0,0,16),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextScaled = true,
				TextSize = 16,
				Font = Enum.Font.GothamMedium,

				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Text = computed(function()
					return get(titleValue)
				end),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 16
					}
				}
			},
			new "TextLabel" {
				Name = "Body",
				TextWrapped = true,
				RichText = true,
				Position = UDim2.fromOffset(4,16),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = 12,
				Font = Enum.Font.Gotham,

				TextColor3 = animate(function()
					return lerpColor(theme.get("text"),"black",0.1)
				end,40,1),
				Text = computed(function()
					return get(bodyValue)
				end),
				Size = computed(function()
					return UDim2.new(1,-4,0,get(ySize))
				end),
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:Remove()
		newParagraph:Destroy()
	end
	function returnFunctions:SetBody(newBody)
		if typeof(newBody) == "string" then
			bodyValue:set(newBody)
		else
			error("you didnt give "..get(titleValue).." a string for SetBody!")
		end
	end
	function returnFunctions:SetTitle(newTitle)
		if typeof(newTitle) == "string" then
			titleValue:set(newTitle)
		else
			error("you didnt give "..get(titleValue).." a string for SetTitle!")
		end
	end
	return returnFunctions
end