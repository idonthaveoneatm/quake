local project = script.Parent.Parent

local data = require(project.Bundles.data)
local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local RunService = services.RunService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local ref = Fusion.Ref
local observe = Fusion.Observer
local computed = Fusion.Computed

local get = require(project.utilities.get)
local animate = require(project.utilities.animate)
local references = require(project.utilities.references)
local theme = require(project.Bundles.themeSystem)
local icons = require(project.Bundles.icons)
local drag = require(project.utilities.drag)

return function(windowProperty)
    local computerQuake

	local selectedTab = data.find("selectedTab")

	local keyCode = data.find("keyCode")
    local draggingFrameRef = value()
    local isClosed = value(false)
	local isToggled = data.find("isToggled")
	local isResizing = value(false)
	local containerX = value(windowProperty.Size.X)
	local containerY = value(windowProperty.Size.Y)
	local heartbeat = nil
	observe(isResizing):onChange(function()
		if not get(isResizing) and heartbeat ~= nil then
			heartbeat:Disconnect()
			heartbeat = nil
		end
	end)
	local sideBarRef = value()
	references.add(sideBarRef)
	local windowsRef = value()
	references.add(windowsRef)
	local uipagelayoutRef = value()
	references.add(uipagelayoutRef)
	local notificationListRef = value()
	references.add(notificationListRef)
	local resizerREF = value()

	observe(selectedTab.data):onChange(function()
		local tab_data = get(selectedTab.data)
		local uipagelayout = get(uipagelayoutRef)
		uipagelayout:JumpTo(tab_data.tabPage)
	end)

	local isToggledConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode and input.KeyCode == get(keyCode.EnumItem) then
			isToggled:update("boolean", not get(isToggled.boolean))
		end
	end)

	computerQuake = new "ScreenGui" {
		Name = windowProperty.Title,
		Parent = windowProperty.Parent,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		Enabled = computed(function()
			return get(isToggled.boolean)
		end),

		[onevent "Destroying"] = function()
			isToggledConnection:Disconnect()
			heartbeat:Disconnect()
		end,

		[children] = {
			new "Frame" {
                Name = "container",
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0,0),
				Position = UDim2.new(0.5,-get(containerX)/2,0.5,-get(containerY)/2),
				Size = computed(function()
					return UDim2.fromOffset(get(containerX),45)
				end),

				[ref] = draggingFrameRef,

				[children] = {
					new "Frame" {
						AnchorPoint = Vector2.new(0,0),
						Position = UDim2.fromScale(0,0),
						ClipsDescendants = true,

						BackgroundColor3 = animate(function()
							return theme.get("background")
						end,40,1),
						Size = animate(function()
							if get(isClosed) then
								return UDim2.fromOffset(get(containerX),45)
							end
							return UDim2.fromOffset(get(containerX),get(containerY))
						end,20,1),

						[children] = {
							new "UICorner" {CornerRadius = UDim.new(0,6)},
							new "Frame" { -- sideBar
								ZIndex = 5,
								AnchorPoint = Vector2.new(0,0),
								Position = UDim2.fromOffset(10,50),
								Size = UDim2.new(1,0,0,466),
								ClipsDescendants = true,
								BackgroundTransparency = 1,

								[children] = {
									new "ScrollingFrame" {
										Name = "sideBar",
										AnchorPoint = Vector2.new(0,0),
										Position = UDim2.fromScale(0,0),
										Size = UDim2.new(0,40,1,0),
										BackgroundTransparency = 1,
										ScrollBarThickness = 0,
										ClipsDescendants = false,
										ZIndex = 0,
										CanvasSize = UDim2.new(0,0,0,0),
										AutomaticCanvasSize = Enum.AutomaticSize.Y,

										[ref] = sideBarRef,
										[children] = {
											new "UIListLayout" {
												Padding = UDim.new(0,5),
												SortOrder = Enum.SortOrder.LayoutOrder,
												FillDirection = Enum.FillDirection.Vertical,
												HorizontalAlignment = Enum.HorizontalAlignment.Left,
											},
										}
									}
								}
							},
							new "Frame" { -- topBar
								Name = "topBar",
								AnchorPoint = Vector2.new(0.5,0),
								Position = UDim2.new(0.5,0,0,0),
								Size = UDim2.new(1,0,0,45),
								BackgroundTransparency = 1,

								[children] = {
									new "UICorner" {CornerRadius = UDim.new(0,6)},
									new "Frame" {
										AnchorPoint = Vector2.new(0.5,1),
										Position = UDim2.fromScale(0.5,1),
										Size = UDim2.new(1,0,0,1),

										BackgroundColor3 = animate(function()
											return theme.get("tertiaryBackground")
										end,40,1),
										BackgroundTransparency = animate(function()
											if get(isClosed) then
												return 1
											else
												return 0
											end
										end,20,1)
									},
									new "Frame" {
										Name = "taskManage",
										BackgroundTransparency = 1,
										AnchorPoint = Vector2.new(1,0.5),
										Position = UDim2.new(1,0,0.5,0),
										Size = UDim2.new(0,70,1,0),

										[children] = {
											new "UIListLayout"{
												FillDirection = Enum.FillDirection.Horizontal,
												HorizontalAlignment = Enum.HorizontalAlignment.Center,
												VerticalAlignment = Enum.VerticalAlignment.Center
											},
											new "Frame" {
												Size = UDim2.fromOffset(30,30),
												BackgroundTransparency = 1,

												[children] = {
													new "TextButton" {
														Name = "toggleMini",
														AnchorPoint = Vector2.new(0.5,0.5),
														BackgroundTransparency = 1,
														Position = UDim2.fromScale(0.5,0.5),
														Size = UDim2.fromOffset(30,30),

														[onevent "Activated"] = function()
															isClosed:set(not get(isClosed))
														end,

														[children] = {
															new "ImageLabel" {
																Name = "maximizeIcon",
																AnchorPoint = Vector2.new(0.5,0.5),
																BackgroundTransparency = 1,
																Position = UDim2.fromScale(0.5,0.5),
																Size = UDim2.fromOffset(26,26),
																Image = icons['maximize'],

																ImageColor3 = animate(function()
																	return theme.get("image")
																end,40,1),
																ImageTransparency = animate(function()
																	if get(isClosed) then
																		return 0
																	else
																		return 1
																	end
																end,25,1)
															},
															new "ImageLabel" {
																Name = "minimizeIcon",
																AnchorPoint = Vector2.new(0.5,0.5),
																BackgroundTransparency = 1,
																Position = UDim2.fromScale(0.5,0.5),
																Size = UDim2.fromOffset(26,26),
																Image = icons['minimize'],

																ImageColor3 = animate(function()
																	return theme.get("image")
																end,40,1),
																ImageTransparency = animate(function()
																	if get(isClosed) then
																		return 1
																	else
																		return 0
																	end
																end,25,1)
															}
														}
													}
												}
											},
											new "TextButton" {
												Size = UDim2.fromOffset(30,30),
												BackgroundTransparency = 1,
												Text = "",

												[onevent "Activated"] = function()
													computerQuake:Destroy()
												end,

												[children] = {
													new "ImageLabel" {
														AnchorPoint = Vector2.new(0.5,0.5),
														Position = UDim2.fromScale(0.5,0.5),
														Size = UDim2.fromScale(0.95,0.95),
														BackgroundTransparency = 1,
														Image = icons['close'],
														ImageTransparency = 0,

														ImageColor3 = animate(function()
															return theme.get("close")
														end,40,1),
													}
												}
											}
										}
									},
									new "TextLabel" {
										AnchorPoint = Vector2.new(0,0.5),
										Position = UDim2.fromScale(0,0.55),
										Size = UDim2.fromOffset(350,25),
										BackgroundTransparency = 1,
										Font = Enum.Font.GothamBold,
										TextScaled = true,
										TextSize = 25,
										TextXAlignment = Enum.TextXAlignment.Left,

										Text = windowProperty.Title,
										TextColor3 = animate(function()
											return get(selectedTab.data).tabColor or theme.get("defaultTab")
										end,15,1),

										[children] = {
											new "UIPadding" {PaddingLeft = UDim.new(0,15)},
											new "UITextSizeConstraint" {
												MaxTextSize = 25,
												MinTextSize = 1
											}
										}
									}
								}
							},
							new "Frame" { -- windowsList
								Name = "windowsList",
								AnchorPoint = Vector2.new(0,0),
								Size = animate(function()
									return UDim2.new(0,get(containerX) - 70,0,get(containerY) - 60)
								end, 20, 1),
								Position = UDim2.new(0,60,0,50),
								BackgroundTransparency = 1,
								ClipsDescendants = true,

								[ref] = windowsRef,
								[children] = {
									new "UIPageLayout" {
										EasingDirection = Enum.EasingDirection.In,
										EasingStyle = Enum.EasingStyle.Sine,
										TweenTime = 0.2,
										FillDirection = Enum.FillDirection.Vertical,
										SortOrder = Enum.SortOrder.LayoutOrder,
										Padding = UDim.new(0,20),

										[ref] = uipagelayoutRef
									}
								}
							},
							new "TextButton" {
								Name = "Resizer",
								AnchorPoint = Vector2.new(1,1),
								Position = UDim2.fromScale(1,1),
								Size = UDim2.fromOffset(10,10),
								BackgroundTransparency = 1,
								Interactable = computed(function()
									return not get(isClosed)
								end),

								[ref] = resizerREF,
								[onevent "InputBegan"] = function(input)
									if not get(isClosed) and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
										local resizer = get(resizerREF)
										local oldDistance = Vector2.new(9e9,9e9)
										local oldAbsolutePosition = resizer.AbsolutePosition
										local startingX = get(containerX)
										local startingY = get(containerY)
										if heartbeat == nil then
											heartbeat = RunService.Heartbeat:Connect(function()
												if get(isResizing)then
													local distance = UserInputService:GetMouseLocation() - oldAbsolutePosition
													if distance ~= oldDistance then
														oldDistance = distance
														containerX:set(math.clamp(distance.X + startingX - 10,550,9e9))
														containerY:set(math.clamp(distance.Y + startingY - 10,400,9e9))
													end
												end
											end)
										end
										isResizing:set(true)

										input.Changed:Connect(function()
											if input.UserInputState == Enum.UserInputState.End then
												task.wait()
												isResizing:set(false)
											end
										end)
									end
								end
							}
						}
					}
				}
			},
			new "ScrollingFrame" {
				Name = "NotificationList",
				ZIndex = 0,
				AnchorPoint = Vector2.new(1,1),
				Position = UDim2.new(1,-5,1,-10),
				Size = UDim2.new(0,1,1,-10),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				ClipsDescendants = false,

				[ref] = notificationListRef,

				[children] = {
					new "UIListLayout" {
						Padding = UDim.new(0,5),
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						VerticalAlignment = Enum.VerticalAlignment.Bottom
					}
				}
			}
		}
	}
	drag(get(draggingFrameRef),15)
	return computerQuake
end