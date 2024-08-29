local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local children = Fusion.Children

local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local randomString = require(project.utilities.randomString)

return function(windowProperty)
    return new "ScrollingFrame" {
		Name = randomString(16),
		Parent = windowProperty.Parent,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1,1),
		ScrollBarThickness = 0,
		CanvasSize = UDim2.new(0,0,0,0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,

		[children] = {
			new "UIListLayout" {
				Padding = UDim.new(0,5),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
			},
			new "TextLabel" {
				Size = UDim2.new(1,0,0,20),
				Text = windowProperty.Name,
				BackgroundTransparency = 1,
				TextScaled = true,
				Font = Enum.Font.GothamMedium,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTransparency = 0.75,

				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),

				[children] = {
					new "UITextSizeConstraint" {
						MaxTextSize = 12,
						MinTextSize = 1
					},
					new "UIPadding" {
						PaddingLeft = UDim.new(0,5)
					}
				}
			}
		}
	}
end