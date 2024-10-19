local theme = require(script.Bundles.themeSystem)
local data = require(script.Bundles.data)
local references = require(script.utilities.references)
local connections = require(script.utilities.connections)
local get = require(script.utilities.get)

local function addComponent(name, parent, properties)
	properties.Parent = parent
	return require(script.components["new"..name])(properties)
end

local quake = {}
function quake:Window(windowProperty)
	assert(windowProperty.Title, ":Window needs a Title")

	windowProperty.Parent = windowProperty.Parent or game.CoreGui
	windowProperty.KeyCode = windowProperty.KeyCode or nil
	windowProperty.isMobile = windowProperty.isMobile or false
	theme.create(windowProperty.CustomTheme or {})
	if windowProperty.Size then
		windowProperty.Size.X = windowProperty.Size.X or 550
		windowProperty.Size.Y = windowProperty.Size.Y or 400
		math.clamp(windowProperty.Size.X, 550, 9e9)
		math.clamp(windowProperty.Size.Y, 400, 9e9)
	elseif not windowProperty.Size then
		windowProperty.Size = {X = 550, Y = 400}
	end

	if windowProperty.Parent:FindFirstChild(windowProperty.Title) then
		windowProperty.Parent:FindFirstChild(windowProperty.Title):Destroy()
	end

	-- Platforms

	local mobile = require(script.platforms.mobile)
	local computer = require(script.platforms.computer)

	-- Data

	local isToggled = data.add({boolean = true}, "isToggled")
	data.add({EnumItem = windowProperty.KeyCode}, "keyCode")
	data.add({data = {}}, "selectedTab")
	data.add({boolean = false}, "selectedFirst")
	local window_data = data.add({data = windowProperty})
	windowProperty.uid = window_data.uid

	-- Library

	local platform = windowProperty.isMobile and mobile(windowProperty) or computer(windowProperty)

	local windowsList = references.get("windowsList")
	local sideBar = references.get("sideBar")
	local notificationList = references.get("notificationList")

	quake.Windows = {}
	function quake.Windows:Tab(tabProperty)
		local tab_data = data.add({data = tabProperty})
		tabProperty.uid = tab_data.uid

		tabProperty.tabPage = addComponent("Window", windowsList, tabProperty)
		local tabPage = tabProperty.tabPage
		tabProperty.tabButton = addComponent("Tab", sideBar, {tab_data = tab_data})

		tab_data:update("data", tabProperty)

		quake.Windows.Component = {}
		function quake.Windows.Component:Button(buttonProperty)
			buttonProperty.tabColor = tabProperty.tabColor
			return addComponent("Button", tabPage, buttonProperty)
		end
		function quake.Windows.Component:Toggle(toggleProperty)
			toggleProperty.tabColor = tabProperty.tabColor
			return addComponent("Toggle", tabPage, toggleProperty)
		end
		function quake.Windows.Component:TextBox(textboxProperty)
			textboxProperty.tabColor = tabProperty.tabColor
			return addComponent("TextBox", tabPage, textboxProperty)
		end
		function quake.Windows.Component:Keybind(keybindProperty)
			keybindProperty.tabColor = tabProperty.tabColor
			return addComponent("Keybind", tabPage, keybindProperty)
		end
		function quake.Windows.Component:Dropdown(dropdownProperty)
			dropdownProperty.tabColor = tabProperty.tabColor
			return addComponent("Dropdown", tabPage, dropdownProperty)
		end
		function quake.Windows.Component:Slider(sliderProprety)
			sliderProprety.tabColor = tabProperty.tabColor
			return addComponent("Slider", tabPage, sliderProprety)
		end
		function quake.Windows.Component:Section(text: string)
			return addComponent("Section", tabPage, {Text = text})
		end
		function quake.Windows.Component:Paragraph(paragraphProperty)
			paragraphProperty.tabColor = tabProperty.tabColor
			return addComponent("Paragraph", tabPage, paragraphProperty)
		end
		function quake.Windows.Component:Label(text: string)
			local lableProperty = {
				Text = text,
				tabColor = tabProperty.tabColor
			}
			return addComponent("Label", tabPage, lableProperty)
		end
		function quake.Windows.Component:Group(groupProperty)
			groupProperty.tabColor = tabProperty.tabColor
			local group,returnFunctions = addComponent("Group", tabPage, groupProperty)
			function returnFunctions:Button(buttonProperty)
				buttonProperty.tabColor = tabProperty.tabColor
				return addComponent("Button", group, buttonProperty)
			end
			function returnFunctions:Toggle(toggleProperty)
				toggleProperty.tabColor = tabProperty.tabColor
				return addComponent("Toggle", group, toggleProperty)
			end
			function returnFunctions:TextBox(textboxProperty)
				textboxProperty.tabColor = tabProperty.tabColor
				return addComponent("TextBox", group, textboxProperty)
			end
			function returnFunctions:Keybind(keybindProperty)
				keybindProperty.tabColor = tabProperty.tabColor
				return addComponent("Keybind", group, keybindProperty)
			end
			function returnFunctions:Dropdown(dropdownProperty)
				dropdownProperty.tabColor = tabProperty.tabColor
				return addComponent("Dropdown", group, dropdownProperty)
			end
			function returnFunctions:Slider(sliderProprety)
				sliderProprety.tabColor = tabProperty.tabColor
				return addComponent("Slider", group, sliderProprety)
			end
			function returnFunctions:Section(text: string)
				return addComponent("Section", group, {Text = text})
			end
			function returnFunctions:Paragraph(paragraphProperty)
				paragraphProperty.tabColor = tabProperty.tabColor
				return addComponent("Paragraph", group, paragraphProperty)
			end
			function returnFunctions:Label(text: string)
				local lableProperty = {
					Text = text,
					tabColor = tabProperty.tabColor
				}
				return addComponent("Label", group, lableProperty)
			end
			function returnFunctions:ColorPicker(colorpickerProperty)
				colorpickerProperty.tabColor = tabProperty.tabColor
				return addComponent("ColorPicker", group, colorpickerProperty)
			end
			return returnFunctions
		end
		function quake.Windows.Component:ColorPicker(colorpickerProperty)
			colorpickerProperty.tabColor = tabProperty.tabColor
			return addComponent("ColorPicker", tabPage, colorpickerProperty)
		end
		return quake.Windows.Component
	end
	function quake:SetCustomTheme(newCustomTheme)
		theme.create(newCustomTheme)
	end
	function quake:Destroy()
		connections.deleteConnections()
		references.clear()
		platform:Destroy()
	end
	function quake:ToggleQuake()
		isToggled:update("boolean", not get(isToggled.boolean))
	end
	function quake.Windows:Notify(NotificationProperty)
		return addComponent("Notification", notificationList, NotificationProperty)
	end
	return quake.Windows
end
return quake