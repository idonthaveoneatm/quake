-- ++++++++ WAX BUNDLED DATA BELOW ++++++++ --

-- Will be used later for getting flattened globals
local ImportGlobals

-- Holds direct closure data (defining this before the DOM tree for line debugging etc)
local ClosureBindings = {
    function()local wax,script,require=ImportGlobals(1)local ImportGlobals return (function(...)local theme = require(script.Bundles.themeSystem)
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
end)() end,
    [3] = function()local wax,script,require=ImportGlobals(3)local ImportGlobals return (function(...)--!strict

--[[
	The entry point for the Fusion library.
]]

local PubTypes = require(script.PubTypes)
local restrictRead = require(script.Utility.restrictRead)

export type StateObject<T> = PubTypes.StateObject<T>
export type CanBeState<T> = PubTypes.CanBeState<T>
export type Symbol = PubTypes.Symbol
export type Value<T> = PubTypes.Value<T>
export type Computed<T> = PubTypes.Computed<T>
export type ForPairs<KO, VO> = PubTypes.ForPairs<KO, VO>
export type ForKeys<KI, KO> = PubTypes.ForKeys<KI, KO>
export type ForValues<VI, VO> = PubTypes.ForKeys<VI, VO>
export type Observer = PubTypes.Observer
export type Tween<T> = PubTypes.Tween<T>
export type Spring<T> = PubTypes.Spring<T>

type Fusion = {
	version: PubTypes.Version,

	New: (className: string) -> ((propertyTable: PubTypes.PropertyTable) -> Instance),
	Hydrate: (target: Instance) -> ((propertyTable: PubTypes.PropertyTable) -> Instance),
	Ref: PubTypes.SpecialKey,
	Cleanup: PubTypes.SpecialKey,
	Children: PubTypes.SpecialKey,
	Out: PubTypes.SpecialKey,
	OnEvent: (eventName: string) -> PubTypes.SpecialKey,
	OnChange: (propertyName: string) -> PubTypes.SpecialKey,

	Value: <T>(initialValue: T) -> Value<T>,
	Computed: <T>(callback: () -> T, destructor: (T) -> ()?) -> Computed<T>,
	ForPairs: <KI, VI, KO, VO, M>(inputTable: CanBeState<{[KI]: VI}>, processor: (KI, VI) -> (KO, VO, M?), destructor: (KO, VO, M?) -> ()?) -> ForPairs<KO, VO>,
	ForKeys: <KI, KO, M>(inputTable: CanBeState<{[KI]: any}>, processor: (KI) -> (KO, M?), destructor: (KO, M?) -> ()?) -> ForKeys<KO, any>,
	ForValues: <VI, VO, M>(inputTable: CanBeState<{[any]: VI}>, processor: (VI) -> (VO, M?), destructor: (VO, M?) -> ()?) -> ForValues<any, VO>,
	Observer: (watchedState: StateObject<any>) -> Observer,

	Tween: <T>(goalState: StateObject<T>, tweenInfo: TweenInfo?) -> Tween<T>,
	Spring: <T>(goalState: StateObject<T>, speed: number?, damping: number?) -> Spring<T>,

	cleanup: (...any) -> (),
	doNothing: (...any) -> ()
}

return restrictRead("Fusion", {
	version = {major = 0, minor = 2, isRelease = true},

	New = require(script.Instances.New),
	Hydrate = require(script.Instances.Hydrate),
	Ref = require(script.Instances.Ref),
	Out = require(script.Instances.Out),
	Cleanup = require(script.Instances.Cleanup),
	Children = require(script.Instances.Children),
	OnEvent = require(script.Instances.OnEvent),
	OnChange = require(script.Instances.OnChange),

	Value = require(script.State.Value),
	Computed = require(script.State.Computed),
	ForPairs = require(script.State.ForPairs),
	ForKeys = require(script.State.ForKeys),
	ForValues = require(script.State.ForValues),
	Observer = require(script.State.Observer),

	Tween = require(script.Animation.Tween),
	Spring = require(script.Animation.Spring),

	cleanup = require(script.Utility.cleanup),
	doNothing = require(script.Utility.doNothing)
}) :: Fusion

end)() end,
    [5] = function()local wax,script,require=ImportGlobals(5)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new computed state object, which follows the value of another
	state object using a spring simulation.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local logError = require(Package.Logging.logError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local unpackType = require(Package.Animation.unpackType)
local SpringScheduler = require(Package.Animation.SpringScheduler)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local updateAll = require(Package.Dependencies.updateAll)
local xtypeof = require(Package.Utility.xtypeof)
local unwrap = require(Package.State.unwrap)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the current value of this Spring object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._currentValue
end

--[[
	Sets the position of the internal springs, meaning the value of this
	Spring will jump to the given value. This doesn't affect velocity.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:setPosition(newValue: PubTypes.Animatable)
	local newType = typeof(newValue)
	if newType ~= self._currentType then
		logError("springTypeMismatch", nil, newType, self._currentType)
	end

	self._springPositions = unpackType(newValue, newType)
	self._currentValue = newValue
	SpringScheduler.add(self)
	updateAll(self)
end

--[[
	Sets the velocity of the internal springs, overwriting the existing velocity
	of this Spring. This doesn't affect position.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:setVelocity(newValue: PubTypes.Animatable)
	local newType = typeof(newValue)
	if newType ~= self._currentType then
		logError("springTypeMismatch", nil, newType, self._currentType)
	end

	self._springVelocities = unpackType(newValue, newType)
	SpringScheduler.add(self)
end

--[[
	Adds to the velocity of the internal springs, on top of the existing
	velocity of this Spring. This doesn't affect position.

	If the type doesn't match the current type of the spring, an error will be
	thrown.
]]
function class:addVelocity(deltaValue: PubTypes.Animatable)
	local deltaType = typeof(deltaValue)
	if deltaType ~= self._currentType then
		logError("springTypeMismatch", nil, deltaType, self._currentType)
	end

	local springDeltas = unpackType(deltaValue, deltaType)
	for index, delta in ipairs(springDeltas) do
		self._springVelocities[index] += delta
	end
	SpringScheduler.add(self)
end

--[[
	Called when the goal state changes value, or when the speed or damping has
	changed.
]]
function class:update(): boolean
	local goalValue = self._goalState:get(false)

	-- figure out if this was a goal change or a speed/damping change
	if goalValue == self._goalValue then
		-- speed/damping change
		local damping = unwrap(self._damping)
		if typeof(damping) ~= "number" then
			logErrorNonFatal("mistypedSpringDamping", nil, typeof(damping))
		elseif damping < 0 then
			logErrorNonFatal("invalidSpringDamping", nil, damping)
		else
			self._currentDamping = damping
		end

		local speed = unwrap(self._speed)
		if typeof(speed) ~= "number" then
			logErrorNonFatal("mistypedSpringSpeed", nil, typeof(speed))
		elseif speed < 0 then
			logErrorNonFatal("invalidSpringSpeed", nil, speed)
		else
			self._currentSpeed = speed
		end

		return false
	else
		-- goal change - reconfigure spring to target new goal
		self._goalValue = goalValue

		local oldType = self._currentType
		local newType = typeof(goalValue)
		self._currentType = newType

		local springGoals = unpackType(goalValue, newType)
		local numSprings = #springGoals
		self._springGoals = springGoals

		if newType ~= oldType then
			-- if the type changed, snap to the new value and rebuild the
			-- position and velocity tables
			self._currentValue = self._goalValue

			local springPositions = table.create(numSprings, 0)
			local springVelocities = table.create(numSprings, 0)
			for index, springGoal in ipairs(springGoals) do
				springPositions[index] = springGoal
			end
			self._springPositions = springPositions
			self._springVelocities = springVelocities

			-- the spring may have been animating before, so stop that
			SpringScheduler.remove(self)
			return true

			-- otherwise, the type hasn't changed, just the goal...
		elseif numSprings == 0 then
			-- if the type isn't animatable, snap to the new value
			self._currentValue = self._goalValue
			return true

		else
			-- if it's animatable, let it animate to the goal
			SpringScheduler.add(self)
			return false
		end
	end
end

local function Spring<T>(
	goalState: PubTypes.Value<T>,
	speed: PubTypes.CanBeState<number>?,
	damping: PubTypes.CanBeState<number>?
): Types.Spring<T>
	-- apply defaults for speed and damping
	if speed == nil then
		speed = 10
	end
	if damping == nil then
		damping = 1
	end

	local dependencySet = {[goalState] = true}
	if xtypeof(speed) == "State" then
		dependencySet[speed] = true
	end
	if xtypeof(damping) == "State" then
		dependencySet[damping] = true
	end

	local self = setmetatable({
		type = "State",
		kind = "Spring",
		dependencySet = dependencySet,
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_speed = speed,
		_damping = damping,

		_goalState = goalState,
		_goalValue = nil,

		_currentType = nil,
		_currentValue = nil,
		_currentSpeed = unwrap(speed),
		_currentDamping = unwrap(damping),

		_springPositions = nil,
		_springGoals = nil,
		_springVelocities = nil
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the goal state's dependent set
	goalState.dependentSet[self] = true
	self:update()

	return self
end

return Spring
end)() end,
    [6] = function()local wax,script,require=ImportGlobals(6)local ImportGlobals return (function(...)--!strict

--[[
	Manages batch updating of spring objects.
]]

local RunService = game:GetService("RunService")

local Package = script.Parent.Parent
local Types = require(Package.Types)
local packType = require(Package.Animation.packType)
local springCoefficients = require(Package.Animation.springCoefficients)
local updateAll = require(Package.Dependencies.updateAll)

type Set<T> = {[T]: any}
type Spring = Types.Spring<any>

local SpringScheduler = {}

local EPSILON = 0.0001
local activeSprings: Set<Spring> = {}
local lastUpdateTime = os.clock()

function SpringScheduler.add(spring: Spring)
	-- we don't necessarily want to use the most accurate time - here we snap to
	-- the last update time so that springs started within the same frame have
	-- identical time steps
	spring._lastSchedule = lastUpdateTime
	spring._startDisplacements = {}
	spring._startVelocities = {}
	for index, goal in ipairs(spring._springGoals) do
		spring._startDisplacements[index] = spring._springPositions[index] - goal
		spring._startVelocities[index] = spring._springVelocities[index]
	end

	activeSprings[spring] = true
end

function SpringScheduler.remove(spring: Spring)
	activeSprings[spring] = nil
end


local function updateAllSprings()
	local springsToSleep: Set<Spring> = {}
	lastUpdateTime = os.clock()

	for spring in pairs(activeSprings) do
		local posPos, posVel, velPos, velVel = springCoefficients(lastUpdateTime - spring._lastSchedule, spring._currentDamping, spring._currentSpeed)

		local positions = spring._springPositions
		local velocities = spring._springVelocities
		local startDisplacements = spring._startDisplacements
		local startVelocities = spring._startVelocities
		local isMoving = false

		for index, goal in ipairs(spring._springGoals) do
			local oldDisplacement = startDisplacements[index]
			local oldVelocity = startVelocities[index]
			local newDisplacement = oldDisplacement * posPos + oldVelocity * posVel
			local newVelocity = oldDisplacement * velPos + oldVelocity * velVel

			if math.abs(newDisplacement) > EPSILON or math.abs(newVelocity) > EPSILON then
				isMoving = true
			end

			positions[index] = newDisplacement + goal
			velocities[index] = newVelocity
		end

		if not isMoving then
			springsToSleep[spring] = true
		end
	end

	for spring in pairs(activeSprings) do
		spring._currentValue = packType(spring._springPositions, spring._currentType)
		updateAll(spring)
	end

	for spring in pairs(springsToSleep) do
		activeSprings[spring] = nil
	end
end

RunService:BindToRenderStep(
	"__FusionSpringScheduler",
	Enum.RenderPriority.First.Value,
	updateAllSprings
)

return SpringScheduler
end)() end,
    [7] = function()local wax,script,require=ImportGlobals(7)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new computed state object, which follows the value of another
	state object using a tween.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local TweenScheduler = require(Package.Animation.TweenScheduler)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local logError = require(Package.Logging.logError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local xtypeof = require(Package.Utility.xtypeof)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the current value of this Tween object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._currentValue
end

--[[
	Called when the goal state changes value; this will initiate a new tween.
	Returns false as the current value doesn't change right away.
]]
function class:update(): boolean
	local goalValue = self._goalState:get(false)

	-- if the goal hasn't changed, then this is a TweenInfo change.
	-- in that case, if we're not currently animating, we can skip everything
	if goalValue == self._nextValue and not self._currentlyAnimating then
		return false
	end

	local tweenInfo = self._tweenInfo
	if self._tweenInfoIsState then
		tweenInfo = tweenInfo:get()
	end

	-- if we receive a bad TweenInfo, then error and stop the update
	if typeof(tweenInfo) ~= "TweenInfo" then
		logErrorNonFatal("mistypedTweenInfo", nil, typeof(tweenInfo))
		return false
	end

	self._prevValue = self._currentValue
	self._nextValue = goalValue

	self._currentTweenStartTime = os.clock()
	self._currentTweenInfo = tweenInfo

	local tweenDuration = tweenInfo.DelayTime + tweenInfo.Time
	if tweenInfo.Reverses then
		tweenDuration += tweenInfo.Time
	end
	tweenDuration *= tweenInfo.RepeatCount + 1
	self._currentTweenDuration = tweenDuration

	-- start animating this tween
	TweenScheduler.add(self)

	return false
end

local function Tween<T>(
	goalState: PubTypes.StateObject<PubTypes.Animatable>,
	tweenInfo: PubTypes.CanBeState<TweenInfo>?
): Types.Tween<T>
	local currentValue = goalState:get(false)

	-- apply defaults for tween info
	if tweenInfo == nil then
		tweenInfo = TweenInfo.new()
	end

	local dependencySet = {[goalState] = true}
	local tweenInfoIsState = xtypeof(tweenInfo) == "State"

	if tweenInfoIsState then
		dependencySet[tweenInfo] = true
	end

	local startingTweenInfo = tweenInfo
	if tweenInfoIsState then
		startingTweenInfo = startingTweenInfo:get()
	end

	-- If we start with a bad TweenInfo, then we don't want to construct a Tween
	if typeof(startingTweenInfo) ~= "TweenInfo" then
		logError("mistypedTweenInfo", nil, typeof(startingTweenInfo))
	end

	local self = setmetatable({
		type = "State",
		kind = "Tween",
		dependencySet = dependencySet,
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_goalState = goalState,
		_tweenInfo = tweenInfo,
		_tweenInfoIsState = tweenInfoIsState,

		_prevValue = currentValue,
		_nextValue = currentValue,
		_currentValue = currentValue,

		-- store current tween into separately from 'real' tween into, so it
		-- isn't affected by :setTweenInfo() until next change
		_currentTweenInfo = tweenInfo,
		_currentTweenDuration = 0,
		_currentTweenStartTime = 0,
		_currentlyAnimating = false
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the goal state's dependent set
	goalState.dependentSet[self] = true

	return self
end

return Tween
end)() end,
    [8] = function()local wax,script,require=ImportGlobals(8)local ImportGlobals return (function(...)--!strict

--[[
	Manages batch updating of tween objects.
]]

local RunService = game:GetService("RunService")

local Package = script.Parent.Parent
local Types = require(Package.Types)
local lerpType = require(Package.Animation.lerpType)
local getTweenRatio = require(Package.Animation.getTweenRatio)
local updateAll = require(Package.Dependencies.updateAll)

local TweenScheduler = {}

type Set<T> = {[T]: any}
type Tween = Types.Tween<any>

local WEAK_KEYS_METATABLE = {__mode = "k"}

-- all the tweens currently being updated
local allTweens: Set<Tween> = {}
setmetatable(allTweens, WEAK_KEYS_METATABLE)

--[[
	Adds a Tween to be updated every render step.
]]
function TweenScheduler.add(tween: Tween)
	allTweens[tween] = true
end

--[[
	Removes a Tween from the scheduler.
]]
function TweenScheduler.remove(tween: Tween)
	allTweens[tween] = nil
end

--[[
	Updates all Tween objects.
]]
local function updateAllTweens()
	local now = os.clock()
	-- FIXME: Typed Luau doesn't understand this loop yet
	for tween: Tween in pairs(allTweens :: any) do
		local currentTime = now - tween._currentTweenStartTime

		if currentTime > tween._currentTweenDuration then
			if tween._currentTweenInfo.Reverses then
				tween._currentValue = tween._prevValue
			else
				tween._currentValue = tween._nextValue
			end
			tween._currentlyAnimating = false
			updateAll(tween)
			TweenScheduler.remove(tween)
		else
			local ratio = getTweenRatio(tween._currentTweenInfo, currentTime)
			local currentValue = lerpType(tween._prevValue, tween._nextValue, ratio)
			tween._currentValue = currentValue
			tween._currentlyAnimating = true
			updateAll(tween)
		end
	end
end

RunService:BindToRenderStep(
	"__FusionTweenScheduler",
	Enum.RenderPriority.First.Value,
	updateAllTweens
)

return TweenScheduler
end)() end,
    [9] = function()local wax,script,require=ImportGlobals(9)local ImportGlobals return (function(...)--!strict

--[[
	Given a `tweenInfo` and `currentTime`, returns a ratio which can be used to
	tween between two values over time.
]]

local TweenService = game:GetService("TweenService")

local function getTweenRatio(tweenInfo: TweenInfo, currentTime: number): number
	local delay = tweenInfo.DelayTime
	local duration = tweenInfo.Time
	local reverses = tweenInfo.Reverses
	local numCycles = 1 + tweenInfo.RepeatCount
	local easeStyle = tweenInfo.EasingStyle
	local easeDirection = tweenInfo.EasingDirection

	local cycleDuration = delay + duration
	if reverses then
		cycleDuration += duration
	end

	if currentTime >= cycleDuration * numCycles then
		return 1
	end

	local cycleTime = currentTime % cycleDuration

	if cycleTime <= delay then
		return 0
	end

	local tweenProgress = (cycleTime - delay) / duration
	if tweenProgress > 1 then
		tweenProgress = 2 - tweenProgress
	end

	local ratio = TweenService:GetValue(tweenProgress, easeStyle, easeDirection)
	return ratio
end

return getTweenRatio
end)() end,
    [10] = function()local wax,script,require=ImportGlobals(10)local ImportGlobals return (function(...)--!strict

--[[
	Linearly interpolates the given animatable types by a ratio.
	If the types are different or not animatable, then the first value will be
	returned for ratios below 0.5, and the second value for 0.5 and above.

	FIXME: This function uses a lot of redefinitions to suppress false positives
	from the Luau typechecker - ideally these wouldn't be required
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function lerpType(from: any, to: any, ratio: number): any
	local typeString = typeof(from)

	if typeof(to) == typeString then
		-- both types must match for interpolation to make sense
		if typeString == "number" then
			local to, from = to :: number, from :: number
			return (to - from) * ratio + from

		elseif typeString == "CFrame" then
			local to, from = to :: CFrame, from :: CFrame
			return from:Lerp(to, ratio)

		elseif typeString == "Color3" then
			local to, from = to :: Color3, from :: Color3
			local fromLab = Oklab.to(from)
			local toLab = Oklab.to(to)
			return Oklab.from(
				fromLab:Lerp(toLab, ratio),
				false
			)

		elseif typeString == "ColorSequenceKeypoint" then
			local to, from = to :: ColorSequenceKeypoint, from :: ColorSequenceKeypoint
			local fromLab = Oklab.to(from.Value)
			local toLab = Oklab.to(to.Value)
			return ColorSequenceKeypoint.new(
				(to.Time - from.Time) * ratio + from.Time,
				Oklab.from(
					fromLab:Lerp(toLab, ratio),
					false
				)
			)

		elseif typeString == "DateTime" then
			local to, from = to :: DateTime, from :: DateTime
			return DateTime.fromUnixTimestampMillis(
				(to.UnixTimestampMillis - from.UnixTimestampMillis) * ratio + from.UnixTimestampMillis
			)

		elseif typeString == "NumberRange" then
			local to, from = to :: NumberRange, from :: NumberRange
			return NumberRange.new(
				(to.Min - from.Min) * ratio + from.Min,
				(to.Max - from.Max) * ratio + from.Max
			)

		elseif typeString == "NumberSequenceKeypoint" then
			local to, from = to :: NumberSequenceKeypoint, from :: NumberSequenceKeypoint
			return NumberSequenceKeypoint.new(
				(to.Time - from.Time) * ratio + from.Time,
				(to.Value - from.Value) * ratio + from.Value,
				(to.Envelope - from.Envelope) * ratio + from.Envelope
			)

		elseif typeString == "PhysicalProperties" then
			local to, from = to :: PhysicalProperties, from :: PhysicalProperties
			return PhysicalProperties.new(
				(to.Density - from.Density) * ratio + from.Density,
				(to.Friction - from.Friction) * ratio + from.Friction,
				(to.Elasticity - from.Elasticity) * ratio + from.Elasticity,
				(to.FrictionWeight - from.FrictionWeight) * ratio + from.FrictionWeight,
				(to.ElasticityWeight - from.ElasticityWeight) * ratio + from.ElasticityWeight
			)

		elseif typeString == "Ray" then
			local to, from = to :: Ray, from :: Ray
			return Ray.new(
				from.Origin:Lerp(to.Origin, ratio),
				from.Direction:Lerp(to.Direction, ratio)
			)

		elseif typeString == "Rect" then
			local to, from = to :: Rect, from :: Rect
			return Rect.new(
				from.Min:Lerp(to.Min, ratio),
				from.Max:Lerp(to.Max, ratio)
			)

		elseif typeString == "Region3" then
			local to, from = to :: Region3, from :: Region3
			-- FUTURE: support rotated Region3s if/when they become constructable
			local position = from.CFrame.Position:Lerp(to.CFrame.Position, ratio)
			local halfSize = from.Size:Lerp(to.Size, ratio) / 2
			return Region3.new(position - halfSize, position + halfSize)

		elseif typeString == "Region3int16" then
			local to, from = to :: Region3int16, from :: Region3int16
			return Region3int16.new(
				Vector3int16.new(
					(to.Min.X - from.Min.X) * ratio + from.Min.X,
					(to.Min.Y - from.Min.Y) * ratio + from.Min.Y,
					(to.Min.Z - from.Min.Z) * ratio + from.Min.Z
				),
				Vector3int16.new(
					(to.Max.X - from.Max.X) * ratio + from.Max.X,
					(to.Max.Y - from.Max.Y) * ratio + from.Max.Y,
					(to.Max.Z - from.Max.Z) * ratio + from.Max.Z
				)
			)

		elseif typeString == "UDim" then
			local to, from = to :: UDim, from :: UDim
			return UDim.new(
				(to.Scale - from.Scale) * ratio + from.Scale,
				(to.Offset - from.Offset) * ratio + from.Offset
			)

		elseif typeString == "UDim2" then
			local to, from = to :: UDim2, from :: UDim2
			return from:Lerp(to, ratio)

		elseif typeString == "Vector2" then
			local to, from = to :: Vector2, from :: Vector2
			return from:Lerp(to, ratio)

		elseif typeString == "Vector2int16" then
			local to, from = to :: Vector2int16, from :: Vector2int16
			return Vector2int16.new(
				(to.X - from.X) * ratio + from.X,
				(to.Y - from.Y) * ratio + from.Y
			)

		elseif typeString == "Vector3" then
			local to, from = to :: Vector3, from :: Vector3
			return from:Lerp(to, ratio)

		elseif typeString == "Vector3int16" then
			local to, from = to :: Vector3int16, from :: Vector3int16
			return Vector3int16.new(
				(to.X - from.X) * ratio + from.X,
				(to.Y - from.Y) * ratio + from.Y,
				(to.Z - from.Z) * ratio + from.Z
			)
		end
	end

	-- fallback case: the types are different or not animatable
	if ratio < 0.5 then
		return from
	else
		return to
	end
end

return lerpType
end)() end,
    [11] = function()local wax,script,require=ImportGlobals(11)local ImportGlobals return (function(...)--!strict

--[[
	Packs an array of numbers into a given animatable data type.
	If the type is not animatable, nil will be returned.

	FUTURE: When Luau supports singleton types, those could be used in
	conjunction with intersection types to make this function fully statically
	type checkable.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function packType(numbers: {number}, typeString: string): PubTypes.Animatable?
	if typeString == "number" then
		return numbers[1]

	elseif typeString == "CFrame" then
		return
			CFrame.new(numbers[1], numbers[2], numbers[3]) *
			CFrame.fromAxisAngle(
				Vector3.new(numbers[4], numbers[5], numbers[6]).Unit,
				numbers[7]
			)

	elseif typeString == "Color3" then
		return Oklab.from(
			Vector3.new(numbers[1], numbers[2], numbers[3]),
			false
		)

	elseif typeString == "ColorSequenceKeypoint" then
		return ColorSequenceKeypoint.new(
			numbers[4],
			Oklab.from(
				Vector3.new(numbers[1], numbers[2], numbers[3]),
				false
			)
		)

	elseif typeString == "DateTime" then
		return DateTime.fromUnixTimestampMillis(numbers[1])

	elseif typeString == "NumberRange" then
		return NumberRange.new(numbers[1], numbers[2])

	elseif typeString == "NumberSequenceKeypoint" then
		return NumberSequenceKeypoint.new(numbers[2], numbers[1], numbers[3])

	elseif typeString == "PhysicalProperties" then
		return PhysicalProperties.new(numbers[1], numbers[2], numbers[3], numbers[4], numbers[5])

	elseif typeString == "Ray" then
		return Ray.new(
			Vector3.new(numbers[1], numbers[2], numbers[3]),
			Vector3.new(numbers[4], numbers[5], numbers[6])
		)

	elseif typeString == "Rect" then
		return Rect.new(numbers[1], numbers[2], numbers[3], numbers[4])

	elseif typeString == "Region3" then
		-- FUTURE: support rotated Region3s if/when they become constructable
		local position = Vector3.new(numbers[1], numbers[2], numbers[3])
		local halfSize = Vector3.new(numbers[4] / 2, numbers[5] / 2, numbers[6] / 2)
		return Region3.new(position - halfSize, position + halfSize)

	elseif typeString == "Region3int16" then
		return Region3int16.new(
			Vector3int16.new(numbers[1], numbers[2], numbers[3]),
			Vector3int16.new(numbers[4], numbers[5], numbers[6])
		)

	elseif typeString == "UDim" then
		return UDim.new(numbers[1], numbers[2])

	elseif typeString == "UDim2" then
		return UDim2.new(numbers[1], numbers[2], numbers[3], numbers[4])

	elseif typeString == "Vector2" then
		return Vector2.new(numbers[1], numbers[2])

	elseif typeString == "Vector2int16" then
		return Vector2int16.new(numbers[1], numbers[2])

	elseif typeString == "Vector3" then
		return Vector3.new(numbers[1], numbers[2], numbers[3])

	elseif typeString == "Vector3int16" then
		return Vector3int16.new(numbers[1], numbers[2], numbers[3])
	else
		return nil
	end
end

return packType
end)() end,
    [12] = function()local wax,script,require=ImportGlobals(12)local ImportGlobals return (function(...)--!strict

--[[
	Returns a 2x2 matrix of coefficients for a given time, damping and speed.
	Specifically, this returns four coefficients - posPos, posVel, velPos, and
	velVel - which can be multiplied with position and velocity like so:

	local newPosition = oldPosition * posPos + oldVelocity * posVel
	local newVelocity = oldPosition * velPos + oldVelocity * velVel

	Special thanks to AxisAngle for helping to improve numerical precision.
]]

local function springCoefficients(time: number, damping: number, speed: number): (number, number, number, number)
	-- if time or speed is 0, then the spring won't move
	if time == 0 or speed == 0 then
		return 1, 0, 0, 1
	end
	local posPos, posVel, velPos, velVel

	if damping > 1 then
		-- overdamped spring
		-- solution to the characteristic equation:
		-- z = -ζω ± Sqrt[ζ^2 - 1] ω
		-- x[t] -> x0(e^(t z2) z1 - e^(t z1) z2)/(z1 - z2)
		--		 + v0(e^(t z1) - e^(t z2))/(z1 - z2)
		-- v[t] -> x0(z1 z2(-e^(t z1) + e^(t z2)))/(z1 - z2)
		--		 + v0(z1 e^(t z1) - z2 e^(t z2))/(z1 - z2)

		local scaledTime = time * speed
		local alpha = math.sqrt(damping^2 - 1)
		local scaledInvAlpha = -0.5 / alpha
		local z1 = -alpha - damping
		local z2 = 1 / z1
		local expZ1 = math.exp(scaledTime * z1)
		local expZ2 = math.exp(scaledTime * z2)

		posPos = (expZ2*z1 - expZ1*z2) * scaledInvAlpha
		posVel = (expZ1 - expZ2) * scaledInvAlpha / speed
		velPos = (expZ2 - expZ1) * scaledInvAlpha * speed
		velVel = (expZ1*z1 - expZ2*z2) * scaledInvAlpha

	elseif damping == 1 then
		-- critically damped spring
		-- x[t] -> x0(e^-tω)(1+tω) + v0(e^-tω)t
		-- v[t] -> x0(t ω^2)(-e^-tω) + v0(1 - tω)(e^-tω)

		local scaledTime = time * speed
		local expTerm = math.exp(-scaledTime)

		posPos = expTerm * (1 + scaledTime)
		posVel = expTerm * time
		velPos = expTerm * (-scaledTime*speed)
		velVel = expTerm * (1 - scaledTime)

	else
		-- underdamped spring
		-- factored out of the solutions to the characteristic equation:
		-- α = Sqrt[1 - ζ^2]
		-- x[t] -> x0(e^-tζω)(α Cos[tα] + ζω Sin[tα])/α
		--       + v0(e^-tζω)(Sin[tα])/α
		-- v[t] -> x0(-e^-tζω)(α^2 + ζ^2 ω^2)(Sin[tα])/α
		--       + v0(e^-tζω)(α Cos[tα] - ζω Sin[tα])/α

		local scaledTime = time * speed
		local alpha = math.sqrt(1 - damping^2)
		local invAlpha = 1 / alpha
		local alphaTime = alpha * scaledTime
		local expTerm = math.exp(-scaledTime*damping)
		local sinTerm = expTerm * math.sin(alphaTime)
		local cosTerm = expTerm * math.cos(alphaTime)
		local sinInvAlpha = sinTerm*invAlpha
		local sinInvAlphaDamp = sinInvAlpha*damping

		posPos = sinInvAlphaDamp + cosTerm
		posVel = sinInvAlpha
		velPos = -(sinInvAlphaDamp*damping + sinTerm*alpha)
		velVel = cosTerm - sinInvAlphaDamp
	end

	return posPos, posVel, velPos, velVel
end

return springCoefficients

end)() end,
    [13] = function()local wax,script,require=ImportGlobals(13)local ImportGlobals return (function(...)--!strict

--[[
	Unpacks an animatable type into an array of numbers.
	If the type is not animatable, an empty array will be returned.

	FIXME: This function uses a lot of redefinitions to suppress false positives
	from the Luau typechecker - ideally these wouldn't be required

	FUTURE: When Luau supports singleton types, those could be used in
	conjunction with intersection types to make this function fully statically
	type checkable.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Oklab = require(Package.Colour.Oklab)

local function unpackType(value: any, typeString: string): {number}
	if typeString == "number" then
		local value = value :: number
		return {value}

	elseif typeString == "CFrame" then
		-- FUTURE: is there a better way of doing this? doing distance
		-- calculations on `angle` may be incorrect
		local axis, angle = value:ToAxisAngle()
		return {value.X, value.Y, value.Z, axis.X, axis.Y, axis.Z, angle}

	elseif typeString == "Color3" then
		local lab = Oklab.to(value)
		return {lab.X, lab.Y, lab.Z}

	elseif typeString == "ColorSequenceKeypoint" then
		local lab = Oklab.to(value.Value)
		return {lab.X, lab.Y, lab.Z, value.Time}

	elseif typeString == "DateTime" then
		return {value.UnixTimestampMillis}

	elseif typeString == "NumberRange" then
		return {value.Min, value.Max}

	elseif typeString == "NumberSequenceKeypoint" then
		return {value.Value, value.Time, value.Envelope}

	elseif typeString == "PhysicalProperties" then
		return {value.Density, value.Friction, value.Elasticity, value.FrictionWeight, value.ElasticityWeight}

	elseif typeString == "Ray" then
		return {value.Origin.X, value.Origin.Y, value.Origin.Z, value.Direction.X, value.Direction.Y, value.Direction.Z}

	elseif typeString == "Rect" then
		return {value.Min.X, value.Min.Y, value.Max.X, value.Max.Y}

	elseif typeString == "Region3" then
		-- FUTURE: support rotated Region3s if/when they become constructable
		return {
			value.CFrame.X, value.CFrame.Y, value.CFrame.Z,
			value.Size.X, value.Size.Y, value.Size.Z
		}

	elseif typeString == "Region3int16" then
		return {value.Min.X, value.Min.Y, value.Min.Z, value.Max.X, value.Max.Y, value.Max.Z}

	elseif typeString == "UDim" then
		return {value.Scale, value.Offset}

	elseif typeString == "UDim2" then
		return {value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset}

	elseif typeString == "Vector2" then
		return {value.X, value.Y}

	elseif typeString == "Vector2int16" then
		return {value.X, value.Y}

	elseif typeString == "Vector3" then
		return {value.X, value.Y, value.Z}

	elseif typeString == "Vector3int16" then
		return {value.X, value.Y, value.Z}
	else
		return {}
	end
end

return unpackType
end)() end,
    [15] = function()local wax,script,require=ImportGlobals(15)local ImportGlobals return (function(...)--!strict

--[[
	Provides functions for converting Color3s into Oklab space, for more
	perceptually uniform colour blending.

	See: https://bottosson.github.io/posts/oklab/
]]

local Oklab = {}

-- Converts a Color3 in RGB space to a Vector3 in Oklab space.
function Oklab.to(rgb: Color3): Vector3
	local l = rgb.R * 0.4122214708 + rgb.G * 0.5363325363 + rgb.B * 0.0514459929
	local m = rgb.R * 0.2119034982 + rgb.G * 0.6806995451 + rgb.B * 0.1073969566
	local s = rgb.R * 0.0883024619 + rgb.G * 0.2817188376 + rgb.B * 0.6299787005

	local lRoot = l ^ (1/3)
	local mRoot = m ^ (1/3)
	local sRoot = s ^ (1/3)

	return Vector3.new(
		lRoot * 0.2104542553 + mRoot * 0.7936177850 - sRoot * 0.0040720468,
		lRoot * 1.9779984951 - mRoot * 2.4285922050 + sRoot * 0.4505937099,
		lRoot * 0.0259040371 + mRoot * 0.7827717662 - sRoot * 0.8086757660
	)
end

-- Converts a Vector3 in CIELAB space to a Color3 in RGB space.
-- The Color3 will be clamped by default unless specified otherwise.
function Oklab.from(lab: Vector3, unclamped: boolean?): Color3
	local lRoot = lab.X + lab.Y * 0.3963377774 + lab.Z * 0.2158037573
	local mRoot = lab.X - lab.Y * 0.1055613458 - lab.Z * 0.0638541728
	local sRoot = lab.X - lab.Y * 0.0894841775 - lab.Z * 1.2914855480

	local l = lRoot ^ 3
	local m = mRoot ^ 3
	local s = sRoot ^ 3

	local red = l * 4.0767416621 - m * 3.3077115913 + s * 0.2309699292
	local green = l * -1.2684380046 + m * 2.6097574011 - s * 0.3413193965
	local blue = l * -0.0041960863 - m * 0.7034186147 + s * 1.7076147010

	if not unclamped then
		red = math.clamp(red, 0, 1)
		green = math.clamp(green, 0, 1)
		blue = math.clamp(blue, 0, 1)
	end

	return Color3.new(red, green, blue)
end

return Oklab

end)() end,
    [17] = function()local wax,script,require=ImportGlobals(17)local ImportGlobals return (function(...)--!strict

--[[
	Calls the given callback, and stores any used external dependencies.
	Arguments can be passed in after the callback.
	If the callback completed successfully, returns true and the returned value,
	otherwise returns false and the error thrown.
	The callback shouldn't yield or run asynchronously.

	NOTE: any calls to useDependency() inside the callback (even if inside any
	nested captureDependencies() call) will not be included in the set, to avoid
	self-dependencies.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local parseError = require(Package.Logging.parseError)
local sharedState = require(Package.Dependencies.sharedState)

type Set<T> = {[T]: any}

local initialisedStack = sharedState.initialisedStack
local initialisedStackCapacity = 0

local function captureDependencies(
	saveToSet: Set<PubTypes.Dependency>,
	callback: (...any) -> any,
	...
): (boolean, any)

	local prevDependencySet = sharedState.dependencySet
	sharedState.dependencySet = saveToSet

	sharedState.initialisedStackSize += 1
	local initialisedStackSize = sharedState.initialisedStackSize

	local initialisedSet
	if initialisedStackSize > initialisedStackCapacity then
		initialisedSet = {}
		initialisedStack[initialisedStackSize] = initialisedSet
		initialisedStackCapacity = initialisedStackSize
	else
		initialisedSet = initialisedStack[initialisedStackSize]
		table.clear(initialisedSet)
	end

	local data = table.pack(xpcall(callback, parseError, ...))

	sharedState.dependencySet = prevDependencySet
	sharedState.initialisedStackSize -= 1

	return table.unpack(data, 1, data.n)
end

return captureDependencies

end)() end,
    [18] = function()local wax,script,require=ImportGlobals(18)local ImportGlobals return (function(...)--!strict

--[[
	Registers the creation of an object which can be used as a dependency.

	This is used to make sure objects don't capture dependencies originating
	from inside of themselves.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local sharedState = require(Package.Dependencies.sharedState)

local initialisedStack = sharedState.initialisedStack

local function initDependency(dependency: PubTypes.Dependency)
	local initialisedStackSize = sharedState.initialisedStackSize

	for index, initialisedSet in ipairs(initialisedStack) do
		if index > initialisedStackSize then
			return
		end

		initialisedSet[dependency] = true
	end
end

return initDependency
end)() end,
    [19] = function()local wax,script,require=ImportGlobals(19)local ImportGlobals return (function(...)--!strict

--[[
	Stores shared state for dependency management functions.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}

-- The set where used dependencies should be saved to.
local dependencySet: Set<PubTypes.Dependency>? = nil

-- A stack of sets where newly created dependencies should be stored.
local initialisedStack: {Set<PubTypes.Dependency>} = {}
local initialisedStackSize = 0

return {
	dependencySet = dependencySet,
	initialisedStack = initialisedStack,
	initialisedStackSize = initialisedStackSize
}
end)() end,
    [20] = function()local wax,script,require=ImportGlobals(20)local ImportGlobals return (function(...)--!strict

--[[
	Given a reactive object, updates all dependent reactive objects.
	Objects are only ever updated after all of their dependencies are updated,
	are only ever updated once, and won't be updated if their dependencies are
	unchanged.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}
type Descendant = (PubTypes.Dependent & PubTypes.Dependency) | PubTypes.Dependent

-- Credit: https://blog.elttob.uk/2022/11/07/sets-efficient-topological-search.html
local function updateAll(root: PubTypes.Dependency)
	local counters: {[Descendant]: number} = {}
	local flags: {[Descendant]: boolean} = {}
	local queue: {Descendant} = {}
	local queueSize = 0
	local queuePos = 1

	for object in root.dependentSet do
		queueSize += 1
		queue[queueSize] = object
		flags[object] = true
	end

	-- Pass 1: counting up
	while queuePos <= queueSize do
		local next = queue[queuePos]
		local counter = counters[next]
		counters[next] = if counter == nil then 1 else counter + 1
		if (next :: any).dependentSet ~= nil then
			for object in (next :: any).dependentSet do
				queueSize += 1
				queue[queueSize] = object
			end
		end
		queuePos += 1
	end

	-- Pass 2: counting down + processing
	queuePos = 1
	while queuePos <= queueSize do
		local next = queue[queuePos]
		local counter = counters[next] - 1
		counters[next] = counter
		if counter == 0 and flags[next] and next:update() and (next :: any).dependentSet ~= nil then
			for object in (next :: any).dependentSet do
				flags[object] = true
			end
		end
		queuePos += 1
	end
end

return updateAll
end)() end,
    [21] = function()local wax,script,require=ImportGlobals(21)local ImportGlobals return (function(...)--!strict

--[[
	If a target set was specified by captureDependencies(), this will add the
	given dependency to the target set.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local sharedState = require(Package.Dependencies.sharedState)

local initialisedStack = sharedState.initialisedStack

local function useDependency(dependency: PubTypes.Dependency)
	local dependencySet = sharedState.dependencySet

	if dependencySet ~= nil then
		local initialisedStackSize = sharedState.initialisedStackSize
		if initialisedStackSize > 0 then
			local initialisedSet = initialisedStack[initialisedStackSize]
			if initialisedSet[dependency] ~= nil then
				return
			end
		end
		dependencySet[dependency] = true
	end
end

return useDependency
end)() end,
    [23] = function()local wax,script,require=ImportGlobals(23)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which parents any given descendants into
	an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logWarn = require(Package.Logging.logWarn)
local Observer = require(Package.State.Observer)
local xtypeof = require(Package.Utility.xtypeof)

type Set<T> = {[T]: boolean}

-- Experimental flag: name children based on the key used in the [Children] table
local EXPERIMENTAL_AUTO_NAMING = false

local Children = {}
Children.type = "SpecialKey"
Children.kind = "Children"
Children.stage = "descendants"

function Children:apply(propValue: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	local newParented: Set<Instance> = {}
	local oldParented: Set<Instance> = {}

	-- save disconnection functions for state object observers
	local newDisconnects: {[PubTypes.StateObject<any>]: () -> ()} = {}
	local oldDisconnects: {[PubTypes.StateObject<any>]: () -> ()} = {}

	local updateQueued = false
	local queueUpdate: () -> ()

	-- Rescans this key's value to find new instances to parent and state objects
	-- to observe for changes; then unparents instances no longer found and
	-- disconnects observers for state objects no longer present.
	local function updateChildren()
		if not updateQueued then
			return -- this update may have been canceled by destruction, etc.
		end
		updateQueued = false

		oldParented, newParented = newParented, oldParented
		oldDisconnects, newDisconnects = newDisconnects, oldDisconnects
		table.clear(newParented)
		table.clear(newDisconnects)

		local function processChild(child: any, autoName: string?)
			local kind = xtypeof(child)

			if kind == "Instance" then
				-- case 1; single instance

				newParented[child] = true
				if oldParented[child] == nil then
					-- wasn't previously present

					-- TODO: check for ancestry conflicts here
					child.Parent = applyTo
				else
					-- previously here; we want to reuse, so remove from old
					-- set so we don't encounter it during unparenting
					oldParented[child] = nil
				end

				if EXPERIMENTAL_AUTO_NAMING and autoName ~= nil then
					child.Name = autoName
				end

			elseif kind == "State" then
				-- case 2; state object

				local value = child:get(false)
				-- allow nil to represent the absence of a child
				if value ~= nil then
					processChild(value, autoName)
				end

				local disconnect = oldDisconnects[child]
				if disconnect == nil then
					-- wasn't previously present
					disconnect = Observer(child):onChange(queueUpdate)
				else
					-- previously here; we want to reuse, so remove from old
					-- set so we don't encounter it during unparenting
					oldDisconnects[child] = nil
				end

				newDisconnects[child] = disconnect

			elseif kind == "table" then
				-- case 3; table of objects

				for key, subChild in pairs(child) do
					local keyType = typeof(key)
					local subAutoName: string? = nil

					if keyType == "string" then
						subAutoName = key
					elseif keyType == "number" and autoName ~= nil then
						subAutoName = autoName .. "_" .. key
					end

					processChild(subChild, subAutoName)
				end

			else
				logWarn("unrecognisedChildType", kind)
			end
		end

		if propValue ~= nil then
			-- `propValue` is set to nil on cleanup, so we don't process children
			-- in that case
			processChild(propValue)
		end

		-- unparent any children that are no longer present
		for oldInstance in pairs(oldParented) do
			oldInstance.Parent = nil
		end

		-- disconnect observers which weren't reused
		for oldState, disconnect in pairs(oldDisconnects) do
			disconnect()
		end
	end

	queueUpdate = function()
		if not updateQueued then
			updateQueued = true
			task.defer(updateChildren)
		end
	end

	table.insert(cleanupTasks, function()
		propValue = nil
		updateQueued = true
		updateChildren()
	end)

	-- perform initial child parenting
	updateQueued = true
	updateChildren()
end

return Children :: PubTypes.SpecialKey
end)() end,
    [24] = function()local wax,script,require=ImportGlobals(24)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which adds user-specified tasks to be run
	when the instance is destroyed.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)

local Cleanup = {}
Cleanup.type = "SpecialKey"
Cleanup.kind = "Cleanup"
Cleanup.stage = "observer"

function Cleanup:apply(userTask: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	table.insert(cleanupTasks, userTask)
end

return Cleanup
end)() end,
    [25] = function()local wax,script,require=ImportGlobals(25)local ImportGlobals return (function(...)--!strict

--[[
	Processes and returns an existing instance, with options for setting
	properties, event handlers and other attributes on the instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local applyInstanceProps = require(Package.Instances.applyInstanceProps)

local function Hydrate(target: Instance)
	return function(props: PubTypes.PropertyTable): Instance
		applyInstanceProps(props, target)
		return target
	end
end

return Hydrate
end)() end,
    [26] = function()local wax,script,require=ImportGlobals(26)local ImportGlobals return (function(...)--!strict

--[[
	Constructs and returns a new instance, with options for setting properties,
	event handlers and other attributes on the instance right away.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local defaultProps = require(Package.Instances.defaultProps)
local applyInstanceProps = require(Package.Instances.applyInstanceProps)
local logError= require(Package.Logging.logError)

local function New(className: string)
	return function(props: PubTypes.PropertyTable): Instance
		local ok, instance = pcall(Instance.new, className)

		if not ok then
			logError("cannotCreateClass", nil, className)
		end

		local classDefaults = defaultProps[className]
		if classDefaults ~= nil then
			for defaultProp, defaultValue in pairs(classDefaults) do
				instance[defaultProp] = defaultValue
			end
		end

		applyInstanceProps(props, instance)

		return instance
	end
end

return New
end)() end,
    [27] = function()local wax,script,require=ImportGlobals(27)local ImportGlobals return (function(...)--!strict

--[[
	Constructs special keys for property tables which connect property change
	listeners to an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)

local function OnChange(propertyName: string): PubTypes.SpecialKey
	local changeKey = {}
	changeKey.type = "SpecialKey"
	changeKey.kind = "OnChange"
	changeKey.stage = "observer"

	function changeKey:apply(callback: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
		local ok, event = pcall(applyTo.GetPropertyChangedSignal, applyTo, propertyName)
		if not ok then
			logError("cannotConnectChange", nil, applyTo.ClassName, propertyName)
		elseif typeof(callback) ~= "function" then
			logError("invalidChangeHandler", nil, propertyName)
		else
			table.insert(cleanupTasks, event:Connect(function()
				callback((applyTo :: any)[propertyName])
			end))
		end
	end

	return changeKey
end

return OnChange
end)() end,
    [28] = function()local wax,script,require=ImportGlobals(28)local ImportGlobals return (function(...)--!strict

--[[
	Constructs special keys for property tables which connect event listeners to
	an instance.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)

local function getProperty_unsafe(instance: Instance, property: string)
	return (instance :: any)[property]
end

local function OnEvent(eventName: string): PubTypes.SpecialKey
	local eventKey = {}
	eventKey.type = "SpecialKey"
	eventKey.kind = "OnEvent"
	eventKey.stage = "observer"

	function eventKey:apply(callback: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
		local ok, event = pcall(getProperty_unsafe, applyTo, eventName)
		if not ok or typeof(event) ~= "RBXScriptSignal" then
			logError("cannotConnectEvent", nil, applyTo.ClassName, eventName)
		elseif typeof(callback) ~= "function" then
			logError("invalidEventHandler", nil, eventName)
		else
			table.insert(cleanupTasks, event:Connect(callback))
		end
	end

	return eventKey
end

return OnEvent
end)() end,
    [29] = function()local wax,script,require=ImportGlobals(29)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which allows users to extract values from
	an instance into an automatically-updated Value object.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)
local xtypeof = require(Package.Utility.xtypeof)

local function Out(propertyName: string): PubTypes.SpecialKey
	local outKey = {}
	outKey.type = "SpecialKey"
	outKey.kind = "Out"
	outKey.stage = "observer"

	function outKey:apply(outState: any, applyTo: Instance, cleanupTasks: { PubTypes.Task })
		local ok, event = pcall(applyTo.GetPropertyChangedSignal, applyTo, propertyName)
		if not ok then
			logError("invalidOutProperty", nil, applyTo.ClassName, propertyName)
		elseif xtypeof(outState) ~= "State" or outState.kind ~= "Value" then
			logError("invalidOutType")
		else
			outState:set((applyTo :: any)[propertyName])
			table.insert(
				cleanupTasks,
				event:Connect(function()
					outState:set((applyTo :: any)[propertyName])
				end)
			)
			table.insert(cleanupTasks, function()
				outState:set(nil)
			end)
		end
	end

	return outKey
end

return Out

end)() end,
    [30] = function()local wax,script,require=ImportGlobals(30)local ImportGlobals return (function(...)--!strict

--[[
	A special key for property tables, which stores a reference to the instance
	in a user-provided Value object.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local logError = require(Package.Logging.logError)
local xtypeof = require(Package.Utility.xtypeof)

local Ref = {}
Ref.type = "SpecialKey"
Ref.kind = "Ref"
Ref.stage = "observer"

function Ref:apply(refState: any, applyTo: Instance, cleanupTasks: {PubTypes.Task})
	if xtypeof(refState) ~= "State" or refState.kind ~= "Value" then
		logError("invalidRefType")
	else
		refState:set(applyTo)
		table.insert(cleanupTasks, function()
			refState:set(nil)
		end)
	end
end

return Ref
end)() end,
    [31] = function()local wax,script,require=ImportGlobals(31)local ImportGlobals return (function(...)--!strict

--[[
	Applies a table of properties to an instance, including binding to any
	given state objects and applying any special keys.

	No strong reference is kept by default - special keys should take care not
	to accidentally hold strong references to instances forever.

	If a key is used twice, an error will be thrown. This is done to avoid
	double assignments or double bindings. However, some special keys may want
	to enable such assignments - in which case unique keys should be used for
	each occurence.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local cleanup = require(Package.Utility.cleanup)
local xtypeof = require(Package.Utility.xtypeof)
local logError = require(Package.Logging.logError)
local Observer = require(Package.State.Observer)

local function setProperty_unsafe(instance: Instance, property: string, value: any)
	(instance :: any)[property] = value
end

local function testPropertyAssignable(instance: Instance, property: string)
	(instance :: any)[property] = (instance :: any)[property]
end

local function setProperty(instance: Instance, property: string, value: any)
	if not pcall(setProperty_unsafe, instance, property, value) then
		if not pcall(testPropertyAssignable, instance, property) then
			if instance == nil then
				-- reference has been lost
				logError("setPropertyNilRef", nil, property, tostring(value))
			else
				-- property is not assignable
				logError("cannotAssignProperty", nil, instance.ClassName, property)
			end
		else
			-- property is assignable, but this specific assignment failed
			-- this typically implies the wrong type was received
			local givenType = typeof(value)
			local expectedType = typeof((instance :: any)[property])
			logError("invalidPropertyType", nil, instance.ClassName, property, expectedType, givenType)
		end
	end
end

local function bindProperty(instance: Instance, property: string, value: PubTypes.CanBeState<any>, cleanupTasks: {PubTypes.Task})
	if xtypeof(value) == "State" then
		-- value is a state object - assign and observe for changes
		local willUpdate = false
		local function updateLater()
			if not willUpdate then
				willUpdate = true
				task.defer(function()
					willUpdate = false
					setProperty(instance, property, value:get(false))
				end)
			end
		end

		setProperty(instance, property, value:get(false))
		table.insert(cleanupTasks, Observer(value :: any):onChange(updateLater))
	else
		-- value is a constant - assign once only
		setProperty(instance, property, value)
	end
end

local function applyInstanceProps(props: PubTypes.PropertyTable, applyTo: Instance)
	local specialKeys = {
		self = {} :: {[PubTypes.SpecialKey]: any},
		descendants = {} :: {[PubTypes.SpecialKey]: any},
		ancestor = {} :: {[PubTypes.SpecialKey]: any},
		observer = {} :: {[PubTypes.SpecialKey]: any}
	}
	local cleanupTasks = {}

	for key, value in pairs(props) do
		local keyType = xtypeof(key)

		if keyType == "string" then
			if key ~= "Parent" then
				bindProperty(applyTo, key :: string, value, cleanupTasks)
			end
		elseif keyType == "SpecialKey" then
			local stage = (key :: PubTypes.SpecialKey).stage
			local keys = specialKeys[stage]
			if keys == nil then
				logError("unrecognisedPropertyStage", nil, stage)
			else
				keys[key] = value
			end
		else
			-- we don't recognise what this key is supposed to be
			logError("unrecognisedPropertyKey", nil, xtypeof(key))
		end
	end

	for key, value in pairs(specialKeys.self) do
		key:apply(value, applyTo, cleanupTasks)
	end
	for key, value in pairs(specialKeys.descendants) do
		key:apply(value, applyTo, cleanupTasks)
	end

	if props.Parent ~= nil then
		bindProperty(applyTo, "Parent", props.Parent, cleanupTasks)
	end

	for key, value in pairs(specialKeys.ancestor) do
		key:apply(value, applyTo, cleanupTasks)
	end
	for key, value in pairs(specialKeys.observer) do
		key:apply(value, applyTo, cleanupTasks)
	end

	applyTo.Destroying:Connect(function()
		cleanup(cleanupTasks)
	end)
end

return applyInstanceProps
end)() end,
    [32] = function()local wax,script,require=ImportGlobals(32)local ImportGlobals return (function(...)--!strict

--[[
	Stores 'sensible default' properties to be applied to instances created by
	the New function.
]]

return {
	ScreenGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	},

	BillboardGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	},

	SurfaceGui = {
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,

		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
		PixelsPerStud = 50
	},

	Frame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	ScrollingFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ScrollBarImageColor3 = Color3.new(0, 0, 0)
	},

	TextLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	TextButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	TextBox = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		ClearTextOnFocus = false,

		Font = Enum.Font.SourceSans,
		Text = "",
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 14
	},

	ImageLabel = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	ImageButton = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,

		AutoButtonColor = false
	},

	ViewportFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},

	VideoFrame = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	},
	
	CanvasGroup = {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0
	}
}

end)() end,
    [34] = function()local wax,script,require=ImportGlobals(34)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific error.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local messages = require(Package.Logging.messages)

local function logError(messageID: string, errObj: Types.Error?, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	local errorString
	if errObj == nil then
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...)
	else
		formatString = formatString:gsub("ERROR_MESSAGE", errObj.message)
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")\n---- Stack trace ----\n" .. errObj.trace, ...)
	end

	error(errorString:gsub("\n", "\n    "), 0)
end

return logError
end)() end,
    [35] = function()local wax,script,require=ImportGlobals(35)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific error, without halting execution.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local messages = require(Package.Logging.messages)

local function logErrorNonFatal(messageID: string, errObj: Types.Error?, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	local errorString
	if errObj == nil then
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...)
	else
		formatString = formatString:gsub("ERROR_MESSAGE", errObj.message)
		errorString = string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")\n---- Stack trace ----\n" .. errObj.trace, ...)
	end

	task.spawn(function(...)
		error(errorString:gsub("\n", "\n    "), 0)
	end, ...)
end

return logErrorNonFatal
end)() end,
    [36] = function()local wax,script,require=ImportGlobals(36)local ImportGlobals return (function(...)--!strict

--[[
	Utility function to log a Fusion-specific warning.
]]

local Package = script.Parent.Parent
local messages = require(Package.Logging.messages)

local function logWarn(messageID, ...)
	local formatString: string

	if messages[messageID] ~= nil then
		formatString = messages[messageID]
	else
		messageID = "unknownMessage"
		formatString = messages[messageID]
	end

	warn(string.format("[Fusion] " .. formatString .. "\n(ID: " .. messageID .. ")", ...))
end

return logWarn
end)() end,
    [37] = function()local wax,script,require=ImportGlobals(37)local ImportGlobals return (function(...)--!strict

--[[
	Stores templates for different kinds of logging messages.
]]

return {
	cannotAssignProperty = "The class type '%s' has no assignable property '%s'.",
	cannotConnectChange = "The %s class doesn't have a property called '%s'.",
	cannotConnectEvent = "The %s class doesn't have an event called '%s'.",
	cannotCreateClass = "Can't create a new instance of class '%s'.",
	computedCallbackError = "Computed callback error: ERROR_MESSAGE",
	destructorNeededValue = "To save instances into Values, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededComputed = "To return instances from Computeds, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	multiReturnComputed = "Returning multiple values from Computeds is discouraged, as behaviour will change soon - see discussion #189 on GitHub.",
	destructorNeededForKeys = "To return instances from ForKeys, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededForValues = "To return instances from ForValues, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	destructorNeededForPairs = "To return instances from ForPairs, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.",
	duplicatePropertyKey = "",
	forKeysProcessorError = "ForKeys callback error: ERROR_MESSAGE",
	forKeysKeyCollision = "ForKeys should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previously input key: '%s'; New input key: '%s'",
	forKeysDestructorError = "ForKeys destructor error: ERROR_MESSAGE",
	forPairsDestructorError = "ForPairs destructor error: ERROR_MESSAGE",
	forPairsKeyCollision = "ForPairs should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previous input pair: '[%s] = %s'; New input pair: '[%s] = %s'",
	forPairsProcessorError = "ForPairs callback error: ERROR_MESSAGE",
	forValuesProcessorError = "ForValues callback error: ERROR_MESSAGE",
	forValuesDestructorError = "ForValues destructor error: ERROR_MESSAGE",
	invalidChangeHandler = "The change handler for the '%s' property must be a function.",
	invalidEventHandler = "The handler for the '%s' event must be a function.",
	invalidPropertyType = "'%s.%s' expected a '%s' type, but got a '%s' type.",
	invalidRefType = "Instance refs must be Value objects.",
	invalidOutType = "[Out] properties must be given Value objects.",
	invalidOutProperty = "The %s class doesn't have a property called '%s'.",
	invalidSpringDamping = "The damping ratio for a spring must be >= 0. (damping was %.2f)",
	invalidSpringSpeed = "The speed of a spring must be >= 0. (speed was %.2f)",
	mistypedSpringDamping = "The damping ratio for a spring must be a number. (got a %s)",
	mistypedSpringSpeed = "The speed of a spring must be a number. (got a %s)",
	mistypedTweenInfo = "The tween info of a tween must be a TweenInfo. (got a %s)",
	springTypeMismatch = "The type '%s' doesn't match the spring's type '%s'.",
	strictReadError = "'%s' is not a valid member of '%s'.",
	unknownMessage = "Unknown error: ERROR_MESSAGE",
	unrecognisedChildType = "'%s' type children aren't accepted by `[Children]`.",
	unrecognisedPropertyKey = "'%s' keys aren't accepted in property tables.",
	unrecognisedPropertyStage = "'%s' isn't a valid stage for a special key to be applied at."
}
end)() end,
    [38] = function()local wax,script,require=ImportGlobals(38)local ImportGlobals return (function(...)--!strict

--[[
	An xpcall() error handler to collect and parse useful information about
	errors, such as clean messages and stack traces.

	TODO: this should have a 'type' field for runtime type checking!
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)

local function parseError(err: string): Types.Error
	return {
		type = "Error",
		raw = err,
		message = err:gsub("^.+:%d+:%s*", ""),
		trace = debug.traceback(nil, 2)
	}
end

return parseError
end)() end,
    [39] = function()local wax,script,require=ImportGlobals(39)local ImportGlobals return (function(...)--!strict

--[[
	Stores common public-facing type information for Fusion APIs.
]]

type Set<T> = {[T]: any}

--[[
	General use types
]]

-- A unique symbolic value.
export type Symbol = {
	type: string, -- replace with "Symbol" when Luau supports singleton types
	name: string
}

-- Types that can be expressed as vectors of numbers, and so can be animated.
export type Animatable =
	number |
	CFrame |
	Color3 |
	ColorSequenceKeypoint |
	DateTime |
	NumberRange |
	NumberSequenceKeypoint |
	PhysicalProperties |
	Ray |
	Rect |
	Region3 |
	Region3int16 |
	UDim |
	UDim2 |
	Vector2 |
	Vector2int16 |
	Vector3 |
	Vector3int16

-- A task which can be accepted for cleanup.
export type Task =
	Instance |
	RBXScriptConnection |
	() -> () |
	{destroy: (any) -> ()} |
	{Destroy: (any) -> ()} |
	{Task}

-- Script-readable version information.
export type Version = {
	major: number,
	minor: number,
	isRelease: boolean
}
--[[
	Generic reactive graph types
]]

-- A graph object which can have dependents.
export type Dependency = {
	dependentSet: Set<Dependent>
}

-- A graph object which can have dependencies.
export type Dependent = {
	update: (Dependent) -> boolean,
	dependencySet: Set<Dependency>
}

-- An object which stores a piece of reactive state.
export type StateObject<T> = Dependency & {
	type: string, -- replace with "State" when Luau supports singleton types
	kind: string,
	get: (StateObject<T>, asDependency: boolean?) -> T
}

-- Either a constant value of type T, or a state object containing type T.
export type CanBeState<T> = StateObject<T> | T

--[[
	Specific reactive graph types
]]

-- A state object whose value can be set at any time by the user.
export type Value<T> = StateObject<T> & {
	-- kind: "State" (add this when Luau supports singleton types)
 	set: (Value<T>, newValue: any, force: boolean?) -> ()
}

-- A state object whose value is derived from other objects using a callback.
export type Computed<T> = StateObject<T> & Dependent & {
	-- kind: "Computed" (add this when Luau supports singleton types)
}

-- A state object whose value is derived from other objects using a callback.
export type ForPairs<KO, VO> = StateObject<{ [KO]: VO }> & Dependent & {
	-- kind: "ForPairs" (add this when Luau supports singleton types)
}
-- A state object whose value is derived from other objects using a callback.
export type ForKeys<KO, V> = StateObject<{ [KO]: V }> & Dependent & {
	-- kind: "ForKeys" (add this when Luau supports singleton types)
}
-- A state object whose value is derived from other objects using a callback.
export type ForValues<K, VO> = StateObject<{ [K]: VO }> & Dependent & {
	-- kind: "ForKeys" (add this when Luau supports singleton types)
}

-- A state object which follows another state object using tweens.
export type Tween<T> = StateObject<T> & Dependent & {
	-- kind: "Tween" (add this when Luau supports singleton types)
}

-- A state object which follows another state object using spring simulation.
export type Spring<T> = StateObject<T> & Dependent & {
	-- kind: "Spring" (add this when Luau supports singleton types)
	-- Uncomment when ENABLE_PARAM_SETTERS is enabled
	-- setPosition: (Spring<T>, newValue: Animatable) -> (),
	-- setVelocity: (Spring<T>, newValue: Animatable) -> (),
	-- addVelocity: (Spring<T>, deltaValue: Animatable) -> ()
}

-- An object which can listen for updates on another state object.
export type Observer = Dependent & {
	-- kind: "Observer" (add this when Luau supports singleton types)
  	onChange: (Observer, callback: () -> ()) -> (() -> ())
}

--[[
	Instance related types
]]

-- Denotes children instances in an instance or component's property table.
export type SpecialKey = {
	type: string, -- replace with "SpecialKey" when Luau supports singleton types
	kind: string,
	stage: string, -- replace with "self" | "descendants" | "ancestor" | "observer" when Luau supports singleton types
	apply: (SpecialKey, value: any, applyTo: Instance, cleanupTasks: {Task}) -> ()
}

-- A collection of instances that may be parented to another instance.
export type Children = Instance | StateObject<Children> | {[any]: Children}

-- A table that defines an instance's properties, handlers and children.
export type PropertyTable = {[string | SpecialKey]: any}

return nil
end)() end,
    [41] = function()local wax,script,require=ImportGlobals(41)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs and returns objects which can be used to model derived reactive
	state.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logWarn = require(Package.Logging.logWarn)
local isSimilar = require(Package.Utility.isSimilar)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the last cached value calculated by this Computed object.
	The computed object will be registered as a dependency unless `asDependency`
	is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._value
end

--[[
	Recalculates this Computed's cached value and dependencies.
	Returns true if it changed, or false if it's identical.
]]
function class:update(): boolean
	-- remove this object from its dependencies' dependent sets
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	-- we need to create a new, empty dependency set to capture dependencies
	-- into, but in case there's an error, we want to restore our old set of
	-- dependencies. by using this table-swapping solution, we can avoid the
	-- overhead of allocating new tables each update.
	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	local ok, newValue, newMetaValue = captureDependencies(self.dependencySet, self._processor)

	if ok then
		if self._destructor == nil and needsDestruction(newValue) then
			logWarn("destructorNeededComputed")
		end

		if newMetaValue ~= nil then
			logWarn("multiReturnComputed")
		end

		local oldValue = self._value
		local similar = isSimilar(oldValue, newValue)
		if self._destructor ~= nil then
			self._destructor(oldValue)
		end
		self._value = newValue

		-- add this object to the dependencies' dependent sets
		for dependency in pairs(self.dependencySet) do
			dependency.dependentSet[self] = true
		end

		return not similar
	else
		-- this needs to be non-fatal, because otherwise it'd disrupt the
		-- update process
		logErrorNonFatal("computedCallbackError", newValue)

		-- restore old dependencies, because the new dependencies may be corrupt
		self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet

		-- restore this object in the dependencies' dependent sets
		for dependency in pairs(self.dependencySet) do
			dependency.dependentSet[self] = true
		end

		return false
	end
end

local function Computed<T>(processor: () -> T, destructor: ((T) -> ())?): Types.Computed<T>
	local self = setmetatable({
		type = "State",
		kind = "Computed",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},
		_processor = processor,
		_destructor = destructor,
		_value = nil,
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return Computed
end)() end,
    [42] = function()local wax,script,require=ImportGlobals(42)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForKeys state object which maps keys of an array using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up
	calculated keys. If omitted, the default cleanup function will be used instead.

	Optionally, a `meta` value can be returned in the processor function as the
	second value to pass data from the processor to the destructor.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logError = require(Package.Logging.logError)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForKeys object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end


--[[
	Called when the original table is changed.

	This will firstly find any keys meeting any of the following criteria:

	- they were not previously present
	- a dependency used during generation of this value has changed

	It will recalculate those key pairs, storing information about any
	dependencies used in the processor callback during output key generation,
	and save the new key to the output array with the same value. If it is
	overwriting an older value, that older value will be passed to the
	destructor for cleanup.

	Finally, this function will find keys that are no longer present, and remove
	their output keys from the output table and pass them to the destructor.
]]

function class:update(): boolean
	local inputIsState = self._inputIsState
	local newInputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local oldInputTable = self._oldInputTable
	local outputTable = self._outputTable

	local keyOIMap = self._keyOIMap
	local keyIOMap = self._keyIOMap
	local meta = self._meta

	local didChange = false


	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end


	-- STEP 1: find keys that changed or were not previously present
	for newInKey, value in pairs(newInputTable) do
		-- get or create key data
		local keyData = self._keyData[newInKey]

		if keyData == nil then
			keyData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
			self._keyData[newInKey] = keyData
		end

		-- check if the key is new
		local shouldRecalculate = oldInputTable[newInKey] == nil

		-- check if the key's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(keyData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end


		-- recalculate the output key if necessary
		if shouldRecalculate then
			keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet
			table.clear(keyData.dependencySet)

			local processOK, newOutKey, newMetaValue = captureDependencies(
				keyData.dependencySet,
				self._processor,
				newInKey
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutKey) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForKeys")
				end

				local oldInKey = keyOIMap[newOutKey]
				local oldOutKey = keyIOMap[newInKey]

				-- check for key collision
				if oldInKey ~= newInKey and newInputTable[oldInKey] ~= nil then
					logError("forKeysKeyCollision", nil, tostring(newOutKey), tostring(oldInKey), tostring(newOutKey))
				end

				-- check for a changed output key
				if oldOutKey ~= newOutKey and keyOIMap[oldOutKey] == newInKey then
					-- clean up the old calculated value
					local oldMetaValue = meta[oldOutKey]

					local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldOutKey, oldMetaValue)
					if not destructOK then
						logErrorNonFatal("forKeysDestructorError", err)
					end

					keyOIMap[oldOutKey] = nil
					outputTable[oldOutKey] = nil
					meta[oldOutKey] = nil
				end

				-- update the stored data for this key
				oldInputTable[newInKey] = value
				meta[newOutKey] = newMetaValue
				keyOIMap[newOutKey] = newInKey
				keyIOMap[newInKey] = newOutKey
				outputTable[newOutKey] = value

				-- if we had to recalculate the output, then we did change
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet

				logErrorNonFatal("forKeysProcessorError", newOutKey)
			end
		end


		-- save dependency values and add to main dependency set
		for dependency in pairs(keyData.dependencySet) do
			keyData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end


	-- STEP 2: find keys that were removed
	for outputKey, inputKey in pairs(keyOIMap) do
		if newInputTable[inputKey] == nil then
			-- clean up the old calculated value
			local oldMetaValue = meta[outputKey]

			local destructOK, err = xpcall(self._destructor or cleanup, parseError, outputKey, oldMetaValue)
			if not destructOK then
				logErrorNonFatal("forKeysDestructorError", err)
			end

			-- remove data
			oldInputTable[inputKey] = nil
			meta[outputKey] = nil
			keyOIMap[outputKey] = nil
			keyIOMap[inputKey] = nil
			outputTable[outputKey] = nil
			self._keyData[inputKey] = nil

			-- if we removed a key, then the table/state changed
			didChange = true
		end
	end

	return didChange
end

local function ForKeys<KI, KO, M>(
	inputTable: PubTypes.CanBeState<{ [KI]: any }>,
	processor: (KI) -> (KO, M?),
	destructor: (KO, M?) -> ()?
): Types.ForKeys<KI, KO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForKeys",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_oldInputTable = {},
		_outputTable = {},
		_keyOIMap = {},
		_keyIOMap = {},
		_keyData = {},
		_meta = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForKeys
end)() end,
    [43] = function()local wax,script,require=ImportGlobals(43)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForPairs object which maps pairs of a table using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up values.
	If omitted, the default cleanup function will be used instead.

	Additionally, a `meta` table/value can optionally be returned to pass data created
	when running the processor to the destructor when the created object is cleaned up.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logError = require(Package.Logging.logError)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForPairs object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end

--[[
	Called when the original table is changed.

	This will firstly find any keys meeting any of the following criteria:

	- they were not previously present
	- their associated value has changed
	- a dependency used during generation of this value has changed

	It will recalculate those key/value pairs, storing information about any
	dependencies used in the processor callback during value generation, and
	save the new key/value pair to the output array. If it is overwriting an
	older key/value pair, that older pair will be passed to the destructor
	for cleanup.

	Finally, this function will find keys that are no longer present, and remove
	their key/value pairs from the output table and pass them to the destructor.
]]
function class:update(): boolean
	local inputIsState = self._inputIsState
	local newInputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local oldInputTable = self._oldInputTable

	local keyIOMap = self._keyIOMap
	local meta = self._meta

	local didChange = false


	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end

	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end

	-- clean out output table
	self._oldOutputTable, self._outputTable = self._outputTable, self._oldOutputTable

	local oldOutputTable = self._oldOutputTable
	local newOutputTable = self._outputTable
	table.clear(newOutputTable)

	-- Step 1: find key/value pairs that changed or were not previously present

	for newInKey, newInValue in pairs(newInputTable) do
		-- get or create key data
		local keyData = self._keyData[newInKey]

		if keyData == nil then
			keyData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
			self._keyData[newInKey] = keyData
		end


		-- check if the pair is new or changed
		local shouldRecalculate = oldInputTable[newInKey] ~= newInValue

		-- check if the pair's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(keyData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end


		-- recalculate the output pair if necessary
		if shouldRecalculate then
			keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet
			table.clear(keyData.dependencySet)

			local processOK, newOutKey, newOutValue, newMetaValue = captureDependencies(
				keyData.dependencySet,
				self._processor,
				newInKey,
				newInValue
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutKey) or needsDestruction(newOutValue) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForPairs")
				end

				-- if this key was already written to on this run-through, throw a fatal error.
				if newOutputTable[newOutKey] ~= nil then
					-- figure out which key/value pair previously wrote to this key
					local previousNewKey, previousNewValue
					for inKey, outKey in pairs(keyIOMap) do
						if outKey == newOutKey then
							previousNewValue = newInputTable[inKey]
							if previousNewValue ~= nil then
								previousNewKey = inKey
								break
							end
						end
					end

					if previousNewKey ~= nil then
						logError(
							"forPairsKeyCollision",
							nil,
							tostring(newOutKey),
							tostring(previousNewKey),
							tostring(previousNewValue),
							tostring(newInKey),
							tostring(newInValue)
						)
					end
				end

				local oldOutValue = oldOutputTable[newOutKey]

				if oldOutValue ~= newOutValue then
					local oldMetaValue = meta[newOutKey]
					if oldOutValue ~= nil then
						local destructOK, err = xpcall(self._destructor or cleanup, parseError, newOutKey, oldOutValue, oldMetaValue)
						if not destructOK then
							logErrorNonFatal("forPairsDestructorError", err)
						end
					end

					oldOutputTable[newOutKey] = nil
				end

				-- update the stored data for this key/value pair
				oldInputTable[newInKey] = newInValue
				keyIOMap[newInKey] = newOutKey
				meta[newOutKey] = newMetaValue
				newOutputTable[newOutKey] = newOutValue

				-- if we had to recalculate the output, then we did change
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				keyData.oldDependencySet, keyData.dependencySet = keyData.dependencySet, keyData.oldDependencySet

				logErrorNonFatal("forPairsProcessorError", newOutKey)
			end
		else
			local storedOutKey = keyIOMap[newInKey]

			-- check for key collision
			if newOutputTable[storedOutKey] ~= nil then
				-- figure out which key/value pair previously wrote to this key
				local previousNewKey, previousNewValue
				for inKey, outKey in pairs(keyIOMap) do
					if storedOutKey == outKey then
						previousNewValue = newInputTable[inKey]

						if previousNewValue ~= nil then
							previousNewKey = inKey
							break
						end
					end
				end

				if previousNewKey ~= nil then
					logError(
						"forPairsKeyCollision",
						nil,
						tostring(storedOutKey),
						tostring(previousNewKey),
						tostring(previousNewValue),
						tostring(newInKey),
						tostring(newInValue)
					)
				end
			end

			-- copy the stored key/value pair into the new output table
			newOutputTable[storedOutKey] = oldOutputTable[storedOutKey]
		end


		-- save dependency values and add to main dependency set
		for dependency in pairs(keyData.dependencySet) do
			keyData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end

	-- STEP 2: find keys that were removed
	for oldOutKey, oldOutValue in pairs(oldOutputTable) do
		-- check if this key/value pair is in the new output table
		if newOutputTable[oldOutKey] ~= oldOutValue then
			-- clean up the old output pair
			local oldMetaValue = meta[oldOutKey]
			if oldOutValue ~= nil then
				local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldOutKey, oldOutValue, oldMetaValue)
				if not destructOK then
					logErrorNonFatal("forPairsDestructorError", err)
				end
			end

			-- check if the key was completely removed from the output table
			if newOutputTable[oldOutKey] == nil then
				meta[oldOutKey] = nil
				self._keyData[oldOutKey] = nil
			end

			didChange = true
		end
	end

	for key in pairs(oldInputTable) do
		if newInputTable[key] == nil then
			oldInputTable[key] = nil
			keyIOMap[key] = nil
		end
	end

	return didChange
end

local function ForPairs<KI, VI, KO, VO, M>(
	inputTable: PubTypes.CanBeState<{ [KI]: VI }>,
	processor: (KI, VI) -> (KO, VO, M?),
	destructor: (KO, VO, M?) -> ()?
): Types.ForPairs<KI, VI, KO, VO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForPairs",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_oldInputTable = {},
		_outputTable = {},
		_oldOutputTable = {},
		_keyIOMap = {},
		_keyData = {},
		_meta = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForPairs
end)() end,
    [44] = function()local wax,script,require=ImportGlobals(44)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new ForValues object which maps values of a table using
	a `processor` function.

	Optionally, a `destructor` function can be specified for cleaning up values.
	If omitted, the default cleanup function will be used instead.

	Additionally, a `meta` table/value can optionally be returned to pass data created
	when running the processor to the destructor when the created object is cleaned up.
]]
local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local captureDependencies = require(Package.Dependencies.captureDependencies)
local initDependency = require(Package.Dependencies.initDependency)
local useDependency = require(Package.Dependencies.useDependency)
local parseError = require(Package.Logging.parseError)
local logErrorNonFatal = require(Package.Logging.logErrorNonFatal)
local logWarn = require(Package.Logging.logWarn)
local cleanup = require(Package.Utility.cleanup)
local needsDestruction = require(Package.Utility.needsDestruction)

local class = {}

local CLASS_METATABLE = { __index = class }
local WEAK_KEYS_METATABLE = { __mode = "k" }

--[[
	Returns the current value of this ForValues object.
	The object will be registered as a dependency unless `asDependency` is false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._outputTable
end

--[[
	Called when the original table is changed.

	This will firstly find any values meeting any of the following criteria:

	- they were not previously present
	- a dependency used during generation of this value has changed

	It will recalculate those values, storing information about any dependencies
	used in the processor callback during value generation, and save the new value
	to the output array with the same key. If it is overwriting an older value,
	that older value will be passed to the destructor for cleanup.

	Finally, this function will find values that are no longer present, and remove
	their values from the output table and pass them to the destructor. You can re-use
	the same value multiple times and this will function will update them as little as
	possible; reusing the same values where possible.
]]
function class:update(): boolean
	local inputIsState = self._inputIsState
	local inputTable = if inputIsState then self._inputTable:get(false) else self._inputTable
	local outputValues = {}

	local didChange = false

	-- clean out value cache
	self._oldValueCache, self._valueCache = self._valueCache, self._oldValueCache
	local newValueCache = self._valueCache
	local oldValueCache = self._oldValueCache
	table.clear(newValueCache)

	-- clean out main dependency set
	for dependency in pairs(self.dependencySet) do
		dependency.dependentSet[self] = nil
	end
	self._oldDependencySet, self.dependencySet = self.dependencySet, self._oldDependencySet
	table.clear(self.dependencySet)

	-- if the input table is a state object, add it as a dependency
	if inputIsState then
		self._inputTable.dependentSet[self] = true
		self.dependencySet[self._inputTable] = true
	end


	-- STEP 1: find values that changed or were not previously present
	for inKey, inValue in pairs(inputTable) do
		-- check if the value is new or changed
		local oldCachedValues = oldValueCache[inValue]
		local shouldRecalculate = oldCachedValues == nil

		-- get a cached value and its dependency/meta data if available
		local value, valueData, meta

		if type(oldCachedValues) == "table" and #oldCachedValues > 0 then
			local valueInfo = table.remove(oldCachedValues, #oldCachedValues)
			value = valueInfo.value
			valueData = valueInfo.valueData
			meta = valueInfo.meta

			if #oldCachedValues <= 0 then
				oldValueCache[inValue] = nil
			end
		elseif oldCachedValues ~= nil then
			oldValueCache[inValue] = nil
			shouldRecalculate = true
		end

		if valueData == nil then
			valueData = {
				dependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				oldDependencySet = setmetatable({}, WEAK_KEYS_METATABLE),
				dependencyValues = setmetatable({}, WEAK_KEYS_METATABLE),
			}
		end

		-- check if the value's dependencies have changed
		if shouldRecalculate == false then
			for dependency, oldValue in pairs(valueData.dependencyValues) do
				if oldValue ~= dependency:get(false) then
					shouldRecalculate = true
					break
				end
			end
		end

		-- recalculate the output value if necessary
		if shouldRecalculate then
			valueData.oldDependencySet, valueData.dependencySet = valueData.dependencySet, valueData.oldDependencySet
			table.clear(valueData.dependencySet)

			local processOK, newOutValue, newMetaValue = captureDependencies(
				valueData.dependencySet,
				self._processor,
				inValue
			)

			if processOK then
				if self._destructor == nil and (needsDestruction(newOutValue) or needsDestruction(newMetaValue)) then
					logWarn("destructorNeededForValues")
				end

				-- pass the old value to the destructor if it exists
				if value ~= nil then
					local destructOK, err = xpcall(self._destructor or cleanup, parseError, value, meta)
					if not destructOK then
						logErrorNonFatal("forValuesDestructorError", err)
					end
				end

				-- store the new value and meta data
				value = newOutValue
				meta = newMetaValue
				didChange = true
			else
				-- restore old dependencies, because the new dependencies may be corrupt
				valueData.oldDependencySet, valueData.dependencySet = valueData.dependencySet, valueData.oldDependencySet

				logErrorNonFatal("forValuesProcessorError", newOutValue)
			end
		end


		-- store the value and its dependency/meta data
		local newCachedValues = newValueCache[inValue]
		if newCachedValues == nil then
			newCachedValues = {}
			newValueCache[inValue] = newCachedValues
		end

		table.insert(newCachedValues, {
			value = value,
			valueData = valueData,
			meta = meta,
		})

		outputValues[inKey] = value


		-- save dependency values and add to main dependency set
		for dependency in pairs(valueData.dependencySet) do
			valueData.dependencyValues[dependency] = dependency:get(false)

			self.dependencySet[dependency] = true
			dependency.dependentSet[self] = true
		end
	end


	-- STEP 2: find values that were removed
	-- for tables of data, we just need to check if it's still in the cache
	for _oldInValue, oldCachedValueInfo in pairs(oldValueCache) do
		for _, valueInfo in ipairs(oldCachedValueInfo) do
			local oldValue = valueInfo.value
			local oldMetaValue = valueInfo.meta

			local destructOK, err = xpcall(self._destructor or cleanup, parseError, oldValue, oldMetaValue)
			if not destructOK then
				logErrorNonFatal("forValuesDestructorError", err)
			end

			didChange = true
		end

		table.clear(oldCachedValueInfo)
	end

	self._outputTable = outputValues

	return didChange
end

local function ForValues<VI, VO, M>(
	inputTable: PubTypes.CanBeState<{ [any]: VI }>,
	processor: (VI) -> (VO, M?),
	destructor: (VO, M?) -> ()?
): Types.ForValues<VI, VO, M>

	local inputIsState = inputTable.type == "State" and typeof(inputTable.get) == "function"

	local self = setmetatable({
		type = "State",
		kind = "ForValues",
		dependencySet = {},
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_oldDependencySet = {},

		_processor = processor,
		_destructor = destructor,
		_inputIsState = inputIsState,

		_inputTable = inputTable,
		_outputTable = {},
		_valueCache = {},
		_oldValueCache = {},
	}, CLASS_METATABLE)

	initDependency(self)
	self:update()

	return self
end

return ForValues
end)() end,
    [45] = function()local wax,script,require=ImportGlobals(45)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs a new state object which can listen for updates on another state
	object.

	FIXME: enabling strict types here causes free types to leak
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local Types = require(Package.Types)
local initDependency = require(Package.Dependencies.initDependency)

type Set<T> = {[T]: any}

local class = {}
local CLASS_METATABLE = {__index = class}

-- Table used to hold Observer objects in memory.
local strongRefs: Set<Types.Observer> = {}

--[[
	Called when the watched state changes value.
]]
function class:update(): boolean
	for _, callback in pairs(self._changeListeners) do
		task.spawn(callback)
	end
	return false
end

--[[
	Adds a change listener. When the watched state changes value, the listener
	will be fired.

	Returns a function which, when called, will disconnect the change listener.
	As long as there is at least one active change listener, this Observer
	will be held in memory, preventing GC, so disconnecting is important.
]]
function class:onChange(callback: () -> ()): () -> ()
	local uniqueIdentifier = {}

	self._numChangeListeners += 1
	self._changeListeners[uniqueIdentifier] = callback

	-- disallow gc (this is important to make sure changes are received)
	strongRefs[self] = true

	local disconnected = false
	return function()
		if disconnected then
			return
		end
		disconnected = true
		self._changeListeners[uniqueIdentifier] = nil
		self._numChangeListeners -= 1

		if self._numChangeListeners == 0 then
			-- allow gc if all listeners are disconnected
			strongRefs[self] = nil
		end
	end
end

local function Observer(watchedState: PubTypes.Value<any>): Types.Observer
	local self = setmetatable({
		type = "State",
		kind = "Observer",
		dependencySet = {[watchedState] = true},
		dependentSet = {},
		_changeListeners = {},
		_numChangeListeners = 0,
	}, CLASS_METATABLE)

	initDependency(self)
	-- add this object to the watched state's dependent set
	watchedState.dependentSet[self] = true

	return self
end

return Observer
end)() end,
    [46] = function()local wax,script,require=ImportGlobals(46)local ImportGlobals return (function(...)--!nonstrict

--[[
	Constructs and returns objects which can be used to model independent
	reactive state.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)
local useDependency = require(Package.Dependencies.useDependency)
local initDependency = require(Package.Dependencies.initDependency)
local updateAll = require(Package.Dependencies.updateAll)
local isSimilar = require(Package.Utility.isSimilar)

local class = {}

local CLASS_METATABLE = {__index = class}
local WEAK_KEYS_METATABLE = {__mode = "k"}

--[[
	Returns the value currently stored in this State object.
	The state object will be registered as a dependency unless `asDependency` is
	false.
]]
function class:get(asDependency: boolean?): any
	if asDependency ~= false then
		useDependency(self)
	end
	return self._value
end

--[[
	Updates the value stored in this State object.

	If `force` is enabled, this will skip equality checks and always update the
	state object and any dependents - use this with care as this can lead to
	unnecessary updates.
]]
function class:set(newValue: any, force: boolean?)
	local oldValue = self._value
	if force or not isSimilar(oldValue, newValue) then
		self._value = newValue
		updateAll(self)
	end
end

local function Value<T>(initialValue: T): Types.State<T>
	local self = setmetatable({
		type = "State",
		kind = "Value",
		-- if we held strong references to the dependents, then they wouldn't be
		-- able to get garbage collected when they fall out of scope
		dependentSet = setmetatable({}, WEAK_KEYS_METATABLE),
		_value = initialValue
	}, CLASS_METATABLE)

	initDependency(self)

	return self
end

return Value
end)() end,
    [47] = function()local wax,script,require=ImportGlobals(47)local ImportGlobals return (function(...)--!strict

--[[
	A common interface for accessing the values of state objects or constants.
]]

local Package = script.Parent.Parent
local PubTypes = require(Package.PubTypes)
local xtypeof = require(Package.Utility.xtypeof)

local function unwrap<T>(item: PubTypes.CanBeState<T>, useDependency: boolean?): T
	return if xtypeof(item) == "State" then (item :: PubTypes.StateObject<T>):get(useDependency) else (item :: T)
end

return unwrap
end)() end,
    [48] = function()local wax,script,require=ImportGlobals(48)local ImportGlobals return (function(...)--!strict

--[[
	Stores common type information used internally.

	These types may be used internally so Fusion code can type-check, but
	should never be exposed to public users, as these definitions are fair game
	for breaking changes.
]]

local Package = script.Parent
local PubTypes = require(Package.PubTypes)

type Set<T> = {[T]: any}

--[[
	General use types
]]

-- A symbol that represents the absence of a value.
export type None = PubTypes.Symbol & {
	-- name: "None" (add this when Luau supports singleton types)
}

-- Stores useful information about Luau errors.
export type Error = {
	type: string, -- replace with "Error" when Luau supports singleton types
	raw: string,
	message: string,
	trace: string
}

--[[
	Specific reactive graph types
]]

-- A state object whose value can be set at any time by the user.
export type State<T> = PubTypes.Value<T> & {
	_value: T
}

-- A state object whose value is derived from other objects using a callback.
export type Computed<T> = PubTypes.Computed<T> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_callback: () -> T,
	_value: T
}

-- A state object whose value is derived from other objects using a callback.
export type ForPairs<KI, VI, KO, VO, M> = PubTypes.ForPairs<KO, VO> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (KI, VI) -> (KO, VO),
	_destructor: (VO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [KI]: VI }>,
	_oldInputTable: { [KI]: VI },
	_outputTable: { [KO]: VO },
	_oldOutputTable: { [KO]: VO },
	_keyIOMap: { [KI]: KO },
	_meta: { [KO]: M? },
	_keyData: {
		[KI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object whose value is derived from other objects using a callback.
export type ForKeys<KI, KO, M> = PubTypes.ForKeys<KO, any> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (KI) -> (KO),
	_destructor: (KO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [KI]: KO }>,
	_oldInputTable: { [KI]: KO },
	_outputTable: { [KO]: any },
	_keyOIMap: { [KO]: KI },
	_meta: { [KO]: M? },
	_keyData: {
		[KI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object whose value is derived from other objects using a callback.
export type ForValues<VI, VO, M> = PubTypes.ForValues<any, VO> & {
	_oldDependencySet: Set<PubTypes.Dependency>,
	_processor: (VI) -> (VO),
	_destructor: (VO, M?) -> (),
	_inputIsState: boolean,
	_inputTable: PubTypes.CanBeState<{ [VI]: VO }>,
	_outputTable: { [any]: VI },
	_valueCache: { [VO]: any },
	_oldValueCache: { [VO]: any },
	_meta: { [VO]: M? },
	_valueData: {
		[VI]: {
			dependencySet: Set<PubTypes.Dependency>,
			oldDependencySet: Set<PubTypes.Dependency>,
			dependencyValues: { [PubTypes.Dependency]: any },
		},
	},
}

-- A state object which follows another state object using tweens.
export type Tween<T> = PubTypes.Tween<T> & {
	_goalState: State<T>,
	_tweenInfo: TweenInfo,
	_prevValue: T,
	_nextValue: T,
	_currentValue: T,
	_currentTweenInfo: TweenInfo,
	_currentTweenDuration: number,
	_currentTweenStartTime: number,
	_currentlyAnimating: boolean
}

-- A state object which follows another state object using spring simulation.
export type Spring<T> = PubTypes.Spring<T> & {
	_speed: PubTypes.CanBeState<number>,
	_speedIsState: boolean,
	_lastSpeed: number,
	_damping: PubTypes.CanBeState<number>,
	_dampingIsState: boolean,
	_lastDamping: number,
	_goalState: State<T>,
	_goalValue: T,
	_currentType: string,
	_currentValue: T,
	_springPositions: {number},
	_springGoals: {number},
	_springVelocities: {number}
}

-- An object which can listen for updates on another state object.
export type Observer = PubTypes.Observer & {
	_changeListeners: Set<() -> ()>,
	_numChangeListeners: number
}

return nil
end)() end,
    [50] = function()local wax,script,require=ImportGlobals(50)local ImportGlobals return (function(...)--!strict

--[[
	A symbol for representing nil values in contexts where nil is not usable.
]]

local Package = script.Parent.Parent
local Types = require(Package.Types)

return {
	type = "Symbol",
	name = "None"
} :: Types.None
end)() end,
    [51] = function()local wax,script,require=ImportGlobals(51)local ImportGlobals return (function(...)--!strict

--[[
	Cleans up the tasks passed in as the arguments.
	A task can be any of the following:

	- an Instance - will be destroyed
	- an RBXScriptConnection - will be disconnected
	- a function - will be run
	- a table with a `Destroy` or `destroy` function - will be called
	- an array - `cleanup` will be called on each item
]]

local function cleanupOne(task: any)
	local taskType = typeof(task)

	-- case 1: Instance
	if taskType == "Instance" then
		task:Destroy()

	-- case 2: RBXScriptConnection
	elseif taskType == "RBXScriptConnection" then
		task:Disconnect()

	-- case 3: callback
	elseif taskType == "function" then
		task()

	elseif taskType == "table" then
		-- case 4: destroy() function
		if typeof(task.destroy) == "function" then
			task:destroy()

		-- case 5: Destroy() function
		elseif typeof(task.Destroy) == "function" then
			task:Destroy()

		-- case 6: array of tasks
		elseif task[1] ~= nil then
			for _, subtask in ipairs(task) do
				cleanupOne(subtask)
			end
		end
	end
end

local function cleanup(...: any)
	for index = 1, select("#", ...) do
		cleanupOne(select(index, ...))
	end
end

return cleanup
end)() end,
    [52] = function()local wax,script,require=ImportGlobals(52)local ImportGlobals return (function(...)--!strict

--[[
	An empty function. Often used as a destructor to indicate no destruction.
]]

local function doNothing(...: any)
end

return doNothing
end)() end,
    [53] = function()local wax,script,require=ImportGlobals(53)local ImportGlobals return (function(...)--!strict
--[[
    Returns true if A and B are 'similar' - i.e. any user of A would not need
    to recompute if it changed to B.
]]

local function isSimilar(a: any, b: any): boolean
    -- HACK: because tables are mutable data structures, don't make assumptions
    -- about similarity from equality for now (see issue #44)
    if typeof(a) == "table" then
        return false
    else
        return a == b
    end
end

return isSimilar
end)() end,
    [54] = function()local wax,script,require=ImportGlobals(54)local ImportGlobals return (function(...)--!strict

--[[
    Returns true if the given value is not automatically memory managed, and
    requires manual cleanup.
]]

local function needsDestruction(x: any): boolean
    return typeof(x) == "Instance"
end

return needsDestruction
end)() end,
    [55] = function()local wax,script,require=ImportGlobals(55)local ImportGlobals return (function(...)--!strict

--[[
	Restricts the reading of missing members for a table.
]]

local Package = script.Parent.Parent
local logError = require(Package.Logging.logError)

type table = {[any]: any}

local function restrictRead(tableName: string, strictTable: table): table
	-- FIXME: Typed Luau doesn't recognise this correctly yet
	local metatable = getmetatable(strictTable :: any)

	if metatable == nil then
		metatable = {}
		setmetatable(strictTable, metatable)
	end

	function metatable:__index(memberName)
		logError("strictReadError", nil, tostring(memberName), tableName)
	end

	return strictTable
end

return restrictRead
end)() end,
    [56] = function()local wax,script,require=ImportGlobals(56)local ImportGlobals return (function(...)--!strict

--[[
	Extended typeof, designed for identifying custom objects.
	If given a table with a `type` string, returns that.
	Otherwise, returns `typeof()` the argument.
]]

local function xtypeof(x: any)
	local typeString = typeof(x)

	if typeString == "table" and typeof(x.type) == "string" then
		return x.type
	else
		return typeString
	end
end

return xtypeof
end)() end,
    [57] = function()local wax,script,require=ImportGlobals(57)local ImportGlobals return (function(...)local MathModule = {}
local JaroWSCheck = false
local ModuleClasses = {
	"Value",
	"Chance",
	"Sequence",
	"String",
	"Convert",
	"Check",
	"Notation",
	"Random",
	"Matrix",
	"Special"
}
for i = 1, #ModuleClasses, 1 do
	MathModule[ModuleClasses[i]] = {}
end
--[[
CLASS Value
]]
function MathModule.Value:EulersNumber()
	return math.exp(1)
end
function MathModule.Value:EulersConstant()
	return 0.577215664901
end
function MathModule.Value:GammaCoeff()
	return -0.65587807152056
end
function MathModule.Value:GammaQuad()
	return -0.042002635033944
end
function MathModule.Value:GammaQui()
	return 0.16653861138228
end
function MathModule.Value:GammaSet()
	return -0.042197734555571
end
function MathModule.Value:GoldenRatio()
	return (1 + math.sqrt(5)) / 2
end
function MathModule.Value:Tau()
	return math.pi * 2
end
function MathModule.Value:AperysConstant()
	return 423203577229 / 352066176000
end
function MathModule.Value:BelphegorsPrimeNumber()
	return 1000000000000066600000000000001
end
--[[
CLASS Chance
]]
function MathModule.Chance:Mean(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	local Sum = 0
	for i = 1, #Table, 1 do
		Sum += Table[i]
	end
	return Sum / #Table
end
function MathModule.Chance:Median(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	if #Table ~= 1 and #Table ~= 2 then
		repeat wait()
			table.remove(Table, 1)
			table.remove(Table, #Table)
		until #Table == 1 or #Table == 2
	end
	if #Table == 2 then
		local Difference = Table[#Table] - Table[1]
		return Table[1] + (Difference / 2)
	else
		return Table[#Table]
	end
end
function MathModule.Chance:Mode(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	table.sort(Table)
	local ModeTable1 = {}
	local ModeTable2 = {}
	local ModeCount = 0
	for i, v in pairs(Table) do
		ModeTable1[v] = ModeTable1[v] and ModeTable1[v] + 1 or 1
	end
	for i, v in pairs(ModeTable1) do
		if v > ModeCount then
			ModeCount = v
			ModeTable2 = {i}
		elseif v == ModeCount then
			table.insert(ModeTable2, i)
		end
	end
	return ModeTable2, ModeCount
end
function MathModule.Chance:Range(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	return Table[#Table] - Table[1]
end
function MathModule.Chance:MidRange(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	return (Table[#Table] + Table[1]) / 2
end
function MathModule.Chance:FirstQuartile(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	if #Table % 2 == 0 then
		for i = 1, #Table / 2, 1 do
			table.remove(Table, #Table)
		end
	else
		for i = 1, ((#Table - 1) / 2) + 1, 1 do
			table.remove(Table, #Table)
		end
	end
	return MathModule.Chance:Median(Table)
end
function MathModule.Chance:ThirdQuartile(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	if #Table % 2 == 0 then
		for i = 1, #Table / 2, 1 do
			table.remove(Table, 1)
		end
	else
		for i = 1, ((#Table - 1) / 2) + 1, 1 do
			table.remove(Table, 1)
		end
	end
	return MathModule.Chance:Median(Table)
end
function MathModule.Chance:InterquartileRange(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	local Table1 = {}
	local Table2 = {}
	for i = 1, #Table, 1 do
		table.insert(Table1, Table[i])
		table.insert(Table2, Table[i])
	end
	return MathModule.Chance:ThirdQuartile(Table1) - MathModule.Chance:FirstQuartile(Table2)
end
function MathModule.Chance:StandardDeviation(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	table.sort(Table)
	local Mean = MathModule.Chance:Mean(Table)
	for i = 1, #Table, 1 do
		Table[i] = (Table[i] - Mean)^2
	end
	return math.sqrt(MathModule.Chance:Mean(Table))
end
function MathModule.Chance:ZScore(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Table1 = {}
	local Table2 = {}
	for i = 1, #Table, 1 do
		table.insert(Table1, Table[i])
		table.insert(Table2, Table[i])
	end
	table.sort(Table1)
	table.sort(Table2)
	local Mean = MathModule.Chance:Mean(Table1)
	local StandardDeviation = MathModule.Chance:StandardDeviation(Table2)
	for i = 1, #Table, 1 do
		Table[i] = (Table[i] - Mean) / StandardDeviation
	end
	return Table
end
function MathModule.Chance:Permutation(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local n = Table[1]
	local r = Table[2]
	return MathModule.Special:Factorial(n) / MathModule.Special:Factorial(n - r)
end
function MathModule.Chance:Combination(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local n = Table[1]
	local r = Table[2]
	return MathModule.Special:Factorial(n) / (MathModule.Special:Factorial(r) * MathModule.Special:Factorial(n - r))
end
--[[
CLASS Sequence
]]
function MathModule.Sequence:ThueMorse(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n % 1 == 0 and math.abs(n) + n ~= 0 then else return warn("number has to be a positive whole number") end
	local Morse = "0"
	for i = 1, n, 1 do
		local String = ""
		for Character in Morse:gmatch(".") do
			String ..= math.abs(tonumber(Character) - 1)
		end
		Morse ..= String
	end
	return Morse
end
function MathModule.Sequence:Integer(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	local Total = {}
	if Min > Max then return warn("min can't be greater than max") end
	if Min % 1 ~= 0 or Max % 1 ~= 0 then return warn("min and max have to be whole numbers") end
	if Min <= 0 or Max <= 0 then return warn("min or max can't be lower than or equal to 0") end
	table.insert(Total, "0")
	for i = 1, Max - 1, 1 do
		if i >= Min then
			table.insert(Total, "±"..i)
		end
	end
	return Total
end
function MathModule.Sequence:Prime(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	local Total = {}
	if Min > Max then return warn("min can't be greater than max") end
	if Min % 1 ~= 0 or Max % 1 ~= 0 then return warn("min and max have to be whole numbers") end
	if Min <= 0 or Max <= 0 then return warn("min or max can't be lower than or equal to 0") end
	local Count = 2
	while true do wait()
		if #Total == Max then
			break
		end
		if MathModule.Check:Prime(Count) then
			table.insert(Total, Count)
		end
		if Count == 2 then
			Count += 1
		else
			Count += 2
		end
	end
	for i = 1, Min - 1, 1 do
		table.remove(Total, 1)
	end
	return Total
end
function MathModule.Sequence:Unprimeable(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	local Total = {}
	if Min > Max then return warn("min can't be greater than max") end
	if Min % 1 ~= 0 or Max % 1 ~= 0 then return warn("min and max have to be whole numbers") end
	if Min <= 0 or Max <= 0 then return warn("min or max can't be lower than or equal to 0") end
	local Count = 200
	while true do wait()
		if #Total == Max then
			break
		end
		if MathModule.Check:Unprimeable(Count) then
			table.insert(Total, Count)
		end
		Count += 1
	end
	for i = 1, Min - 1, 1 do
		table.remove(Total, 1)
	end
	return Total
end
--[[
CLASS String
]]
function MathModule.String:JaroSimilarity(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "string" then else return warn("only strings are allowed in the table") end
	end
	local JWSC = false
	if JaroWSCheck == true then
		JaroWSCheck = false
		JWSC = true
	end
	local String1 = Table[1]
	local String2 = Table[2]
	local Length1 = string.len(String1)
	local Length2 = string.len(String2)
	local Table1 = {}
	local Table2 = {}
	local Table3 = {}
	local Table4 = {}
	local Table5 = {}
	local Table6 = {}
	if Length1 == 0 and Length2 == 0 then return 1 end
	if Length1 == 0 or Length2 == 0 then return 0 end
	local Matches = 0
	local Transposition = 0
	for Character in String1:gmatch(".") do
		if not table.find(Table1, Character) then
			table.insert(Table1, Character)
		else
			local AddCharacter = 0
			while true do wait()
				AddCharacter += 1
				if not table.find(Table1, Character..AddCharacter) then
					table.insert(Table1, Character..AddCharacter)
					break					
				end
			end
		end
	end
	for Character in String2:gmatch(".") do
		if not table.find(Table2, Character) then
			table.insert(Table2, Character)
		else
			local AddCharacter = 0
			while true do wait()
				AddCharacter += 1
				if not table.find(Table2, Character..AddCharacter) then
					table.insert(Table2, Character..AddCharacter)
					break					
				end
			end
		end
	end
	for i, v in pairs(Table1) do
		for ii, vv in pairs(Table2) do
			if Table1[i] == Table2[ii] then
				table.insert(Table3, Table1[i])
				table.insert(Table4, Table2[ii])
				Matches += 1
				break
			end
		end
	end
	if Matches == 0 then return 0 end
	for i = 1, #Table1, 1 do
		if table.find(Table3, Table1[i]) then
			table.insert(Table5, Table1[i])
		end
	end
	for i = 1, #Table2, 1 do
		if table.find(Table4, Table2[i]) then
			table.insert(Table6, Table2[i])
		end
	end
	for i = 1, #Table1 or #Table2, 1 do
		if Table1[i] ~= Table2[i] then
			if JWSC == true then
				return i - 1
			end
		end
	end
	for i = 1, #Table5 or #Table6, 1 do
		if Table5[i] ~= Table6[i] then
			Transposition += 0.5
		end
	end
	return ((Matches / Length1) + (Matches / Length2) + ((Matches - Transposition) / Matches)) / 3
end
function MathModule.String:JaroDistance(Table)
	return 1 - MathModule.String:JaroSimilarity(Table)
end
function MathModule.String:JaroWinklerSimilarity(Table)
	local JaroS = MathModule.String:JaroSimilarity(Table)
	JaroWSCheck = true
	local Prefix = MathModule.String:JaroSimilarity(Table)
	Prefix = math.min(Prefix, 4)
	return JaroS + 0.1 * Prefix * (1 - JaroS)
end
function MathModule.String:JaroWinklerDistance(Table)
	return 1 - MathModule.String:JaroWinklerSimilarity(Table)
end
function MathModule.String:LevenshteinDistance(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "string" then else return warn("only strings are allowed in the table") end
	end
	local String1 = Table[1]
	local String2 = Table[2]
	local Length1 = string.len(String1)
	local Length2 = string.len(String2)
	if String1 == '' then return Length2 end
	if String2 == '' then return Length1 end
	local String1Sub = String1:sub(2, -1)
	local String2Sub = String2:sub(2, -1)
	if String1:sub(0, 1) == String2:sub(0, 1) then
		return MathModule.String:LevenshteinDistance({String1Sub, String2Sub})
	end
	return 1 + math.min(MathModule.String:LevenshteinDistance({String1Sub, String2Sub}), MathModule.String:LevenshteinDistance({String1, String2Sub}), MathModule.String:LevenshteinDistance({String1Sub, String2}))
end
--[[
CLASS Convert
]]
function MathModule.Convert:DecimalToBase(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" and Table[2] % 1 == 0 then else return warn("only numbers are allowed in the table, also bases have to be whole numbers") end
	end
	if Table[2] > 36 then return warn("no bases above 36 are allowed") end
	if Table[2] < 1 then return warn("no bases below 1 are allowed") end
	if Table[2] == 10 then return warn("base 10 is not allowed") end
	local Decimal = Table[1]
	local Base = Table[2]
	local Fraction = ""
	local Sign = ""
	local BaseTable = {}
	local FractionTable = {}
	local RepeatTable = {}
	local Base11To36 = {
		[10] = "A",
		[11] = "B",
		[12] = "C",
		[13] = "D",
		[14] = "E",
		[15] = "F",
		[16] = "G",
		[17] = "H",
		[18] = "I",
		[19] = "J",
		[20] = "K",
		[21] = "L",
		[22] = "M",
		[23] = "N",
		[24] = "O",
		[25] = "P",
		[26] = "Q",
		[27] = "R",
		[28] = "S",
		[29] = "T",
		[30] = "U",
		[31] = "V",
		[32] = "W",
		[33] = "X",
		[34] = "Y",
		[35] = "Z"
	}
	if math.abs(Decimal) + Decimal == 0 and Decimal ~= 0 then
		Decimal = math.abs(Decimal)
		Sign = "-"
	end
	if Decimal % 1 ~= 0 then
		local DF = math.floor(Decimal - (Decimal % 1))
		Fraction = DF
		local Digits = 0
		while true do wait()
			Digits += 1
			if (Decimal * (10^Digits)) % 1 == 0 then
				break
			end
		end
		Fraction = tonumber(string.format("%."..(Digits or 0).."f", Decimal - Fraction))
		Decimal = DF
		local MaxPlace = 10^-math.log10(Fraction)
		Fraction *= MaxPlace
		repeat wait()
			if table.find(RepeatTable, Fraction) then
				break
			end
			table.insert(RepeatTable, Fraction)
			Fraction *= Base
			local TableData = math.floor(Fraction / MaxPlace)
			if TableData >= 10 then
				for i, v in pairs(Base11To36) do
					if i == TableData then
						TableData = v
					end
				end
			end
			table.insert(FractionTable, TableData)
			if TableData >= 1 and not (Fraction == MaxPlace) then
				Fraction -= (TableData * MaxPlace)
			end
		until Fraction == MaxPlace
		if DF == 0 then
			Fraction = "0."
		else
			Fraction = "."
		end
		for i = 1, #FractionTable, 1 do
			Fraction ..= FractionTable[i]
		end
		if DF == 0 then
			return Sign..Fraction
		end
	end
	repeat wait()
		local TableData = Decimal % Base
		if TableData >= 10 then
			for i, v in pairs(Base11To36) do
				if i == TableData then
					TableData = v
				end
			end
		end
		table.insert(BaseTable, TableData)
		Decimal = math.floor(Decimal / Base)
	until Decimal / Base == 0
	for i = 1, math.floor(#BaseTable / 2), 1 do
		local v = #BaseTable - i + 1
		BaseTable[i], BaseTable[v] = BaseTable[v], BaseTable[i]
	end
	Base = ""
	for i = 1, #BaseTable, 1 do
		Base ..= BaseTable[i]
	end
	return Sign..Base..Fraction
end
function MathModule.Convert:BaseToDecimal(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if Table[2] % 1 == 0 then else return warn("bases have to be whole numbers") end
	end
	if Table[2] > 36 then return warn("no bases above 36 are allowed") end
	if Table[2] < 1 then return warn("no bases below 1 are allowed") end
	if Table[2] == 10 then return warn("base 10 is not allowed") end
	local BaseValue = Table[1]
	local Base = Table[2]
	local Fraction = ""
	local Sign = ""
	local UnlockFraction = false
	local BaseValueTable = {}
	local Base1To36 = {
		[0] = "0",
		[1] = "1",
		[2] = "2",
		[3] = "3",
		[4] = "4",
		[5] = "5",
		[6] = "6",
		[7] = "7",
		[8] = "8",
		[9] = "9",
		[10] = "A",
		[11] = "B",
		[12] = "C",
		[13] = "D",
		[14] = "E",
		[15] = "F",
		[16] = "G",
		[17] = "H",
		[18] = "I",
		[19] = "J",
		[20] = "K",
		[21] = "L",
		[22] = "M",
		[23] = "N",
		[24] = "O",
		[25] = "P",
		[26] = "Q",
		[27] = "R",
		[28] = "S",
		[29] = "T",
		[30] = "U",
		[31] = "V",
		[32] = "W",
		[33] = "X",
		[34] = "Y",
		[35] = "Z"
	}
	if math.abs(BaseValue) + BaseValue == 0 and BaseValue ~= 0 then
		BaseValue = math.abs(BaseValue)
		Sign = "-"
	end
	for Character in tostring(BaseValue):gmatch(".") do
		if UnlockFraction == true then
			table.insert(BaseValueTable, Character)
		end
		if Character == "." then
			UnlockFraction = true
		end
		for i = 1, #Base1To36, 1 do
			if table.find(Base1To36, Character, i) and i >= Base then return warn("make sure your base value is in order with your base") end
		end
	end
	for i = 1, math.floor(#BaseValueTable / 2), 1 do
		local v = #BaseValueTable - i + 1
		BaseValueTable[i], BaseValueTable[v] = BaseValueTable[v], BaseValueTable[i]
	end
	local DF = math.floor(BaseValue - (BaseValue % 1))
	local FractionCheck = BaseValue % 1 ~= 0
	Fraction = DF
	local Digits = 0
	while true do wait()
		Digits += 1
		if (BaseValue * (10^Digits)) % 1 == 0 then
			break
		end
	end
	Fraction = tonumber(string.format("%."..(Digits or 0).."f", BaseValue - Fraction))
	BaseValue = DF
	if FractionCheck then
		for i = 1, #BaseValueTable, 1 do
			local Data = BaseValueTable[i]
			for ii = 1, #Base1To36, 1 do
				if table.find(Base1To36, Data, ii) then
					Data = Base1To36[ii]
				end
			end
			if i == 1 then
				Fraction = (Data + 0) / Base
			else
				Fraction = (Data + Fraction) / Base
			end
		end
		if DF == 0 then
			return Sign..Fraction
		end
	end
	Base = tonumber(BaseValue, Base)
	return Sign..Base + Fraction
end
function MathModule.Convert:BaseToBase(Table)
	if type(Table) == "table" and Table[3] then else return warn("only tables are allowed in this function") end
	if Table[4] then return warn("you can't have four table values") end
	for i = 1, #Table, 1 do
		if Table[2] % 1 == 0 and Table[3] % 1 == 0 then else return warn("bases have to be whole numbers") end
	end
	if Table[2] > 36 or Table[3] > 36 then return warn("no bases above 36 are allowed") end
	if Table[2] < 1 or Table[3] < 1 then return warn("no bases below 1 are allowed") end
	local BaseValue = Table[1]
	local Base1 = Table[2]
	local Base2 = Table[3]
	local Base1To36 = {
		[0] = "0",
		[1] = "1",
		[2] = "2",
		[3] = "3",
		[4] = "4",
		[5] = "5",
		[6] = "6",
		[7] = "7",
		[8] = "8",
		[9] = "9",
		[10] = "A",
		[11] = "B",
		[12] = "C",
		[13] = "D",
		[14] = "E",
		[15] = "F",
		[16] = "G",
		[17] = "H",
		[18] = "I",
		[19] = "J",
		[20] = "K",
		[21] = "L",
		[22] = "M",
		[23] = "N",
		[24] = "O",
		[25] = "P",
		[26] = "Q",
		[27] = "R",
		[28] = "S",
		[29] = "T",
		[30] = "U",
		[31] = "V",
		[32] = "W",
		[33] = "X",
		[34] = "Y",
		[35] = "Z"
	}
	for Character in tostring(BaseValue):gmatch(".") do
		for i = 1, #Base1To36, 1 do
			if table.find(Base1To36, Character, i) and i >= Base1 then return warn("make sure your base value is in order with your base") end
		end
	end
	return MathModule.Convert:DecimalToBase({tonumber(MathModule.Convert:BaseToDecimal({BaseValue, Base1})), Base2})
end
function MathModule.Convert:DecimalToRomanNumeral(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n == 0 then return warn("number can't be 0") end
	local RomanNumerals = ""
	local RomanTable = {
		{1000, "M"},
		{900, "CM"},
		{500, "D"},
		{400, "CD"},
		{100, "C"},
		{90, "XC"},
		{50, "L"},
		{40, "XL"},
		{10, "X"},
		{9, "IX"},
		{5, "V"},
		{4, "IV"},
		{1, "I"}
	}
	for i, v in pairs(RomanTable) do
		local ii, vv = unpack(v)
		while n >= ii do
			n -= ii
			RomanNumerals ..= vv
		end
	end
	return RomanNumerals
end
function MathModule.Convert:RomanNumeralToDecimal(s)
	if typeof(s) == "string" then else return warn("only roman numerals are allowed") end
	local Decimal = 0
	local i = 1
	local RomanNumeralLength = string.len(s)
	local RomanTable = {
		["M"] = 1000,
		["D"] = 500,
		["C"] = 100,
		["L"] = 50,
		["X"] = 10,
		["V"] = 5,
		["I"] = 1
	}
	for Character in tostring(s):gmatch(".") do
		local StringCheck = false
		for i, v in pairs(RomanTable) do
			if Character == i then StringCheck = true end
		end
		if StringCheck == false then return warn("make sure your Roman Numerals are using the correct letters") end
	end
	while i < RomanNumeralLength do
		local Z1 = RomanTable[string.sub(s, i, i)]
		local Z2 = RomanTable[string.sub(s, i + 1, i + 1)]
		if Z1 < Z2 then
			Decimal += (Z2 - Z1)
			i += 2
		else
			Decimal += Z1
			i += 1
		end
	end
	if i <= RomanNumeralLength then
		Decimal += RomanTable[string.sub(s, i, i)]
	end
	return Decimal
end
function MathModule.Convert:FahrenheitToCelsius(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	return (n - 32) * (5 / 9)
end
function MathModule.Convert:CelsiusToFahrenheit(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	return (n * (9 / 5)) + 32
end
--[[
CLASS Check
]]
function MathModule.Check:Integer(n)
	if typeof(n) == "number" then else return false end
	if n % 1 == 0 then
		return true
	else
		return false
	end
end
function MathModule.Check:NonInteger(n)
	if typeof(n) == "number" then else return false end
	if n % 1 ~= 0 then
		return true
	else
		return false
	end
end
function MathModule.Check:Prime(n)
	if typeof(n) == "number" then else return false end
	if n < 1 then return false end
	if n % 1 ~= 0 then return false end
	if n > 2 and n % 2 == 0 then return false end
	for i = 2, n^(1 / 2) do
		if (n % i) == 0 then
			return false
		end
	end
	return true
end
function MathModule.Check:Unprimeable(n)
	if typeof(n) == "number" then else return false end
	if MathModule.Check:Prime(n) == true then return false end
	if n % 1 ~= 0 then return false end
	local StringN1 = tostring(n)
	local StringN2 = tostring(n)
	local Digits = string.len(StringN1)
	local PastDigit = 0
	for i = 1, Digits * 10, 1 do
		local Digit = math.ceil(i / 10)
		if Digit > PastDigit then
			StringN1 = StringN2
		end
		PastDigit = Digit
		local DigitReplace = i - (9 * (Digit - 1)) - Digit
		StringN1 = table.concat{StringN1:sub(1, Digit - 1), DigitReplace, StringN1:sub(Digit + 1)}
		if MathModule.Check:Prime(tonumber(StringN1)) == true then return false end
	end
	return true
end
--[[
CLASS Notation
]]
function MathModule.Notation:Scientific(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n == 0 then return warn("number can't be 0") end
	local Repeat = 0
	if math.abs(n) >= 10 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n /= 10
			until n > -10
			return n.." * 10^"..Repeat
		else
			repeat
				Repeat += 1
				n /= 10
			until n < 10
			return n.." * 10^"..Repeat
		end
	elseif math.abs(n) < 1 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n *= 10
			until n <= -1
			return n.." * 10^"..-Repeat
		else
			repeat
				Repeat += 1
				n *= 10
			until n >= 1
			return n.." * 10^"..-Repeat
		end
	end
end
function MathModule.Notation:E(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n == 0 then return warn("number can't be 0") end
	local Repeat = 0
	if math.abs(n) >= 10 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n /= 10
			until n > -10
			return n.."e+"..Repeat
		else
			repeat
				Repeat += 1
				n /= 10
			until n < 10
			return n.."e+"..Repeat
		end
	elseif math.abs(n) < 1 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n *= 10
			until n <= -1
			return n.."e"..-Repeat
		else
			repeat
				Repeat += 1
				n *= 10
			until n >= 1
			return n.."e"..-Repeat
		end
	end
end
function MathModule.Notation:Engineering(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n == 0 then return warn("number can't be 0") end
	local Repeat = 0
	if math.abs(n) >= 10 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n /= 10
			until n > -10
		else
			repeat
				Repeat += 1
				n /= 10
			until n < 10
		end
		if Repeat % 3 == 0 or Repeat == 0 then
			return n.." * 10^"..Repeat
		else
			repeat
				Repeat -= 1
				n *= 10
			until Repeat % 3 == 0 or Repeat == 0
			return n.." * 10^"..Repeat
		end
	elseif math.abs(n) < 1 then
		if string.match(n, "^-") then
			repeat
				Repeat += 1
				n *= 10
			until n <= -1
		else
			repeat
				Repeat += 1
				n *= 10
			until n >= 1
		end
		if Repeat % 3 == 0 or Repeat == 0 then
			return n.." * 10^"..-Repeat
		else
			repeat
				Repeat += 1
				n *= 10
			until Repeat % 3 == 0 or Repeat == 0
			return n.." * 10^"..Repeat
		end
	end
end
--[[
CLASS Random
]]
function MathModule.Random:Addition(Table)
	if type(Table) == "table" and Table[4] then else return warn("only tables are allowed in this function") end
	if Table[5] then return warn("you can't have five table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	local EndProduct = Table[3]
	local RepeatN = Table[4]
	if RepeatN % 1 ~= 0 or RepeatN == 0 then return warn("The total numbers have to be a whole number above 0") end
	if Max * RepeatN >= EndProduct then else return warn("End Product has to be less than or equal to the max number possible") end
	if Min <= EndProduct / Max then else return warn("Minimum has to be less than or equal to the min divider possible") end
	if Min > Max then return warn("min can't be greater than max") end
	local RandomTable = {}
	if RepeatN % 2 == 0 then
		local SplitN = RepeatN / 2
		local DividN = EndProduct / SplitN
		local RangeN = (2 - (DividN / Max)) * Max
		for i = 1, SplitN, 1 do
			local SplitProduct = DividN
			for i = 1, 2, 1 do
				if i ~= 2 then
					local RandomNumber = Random.new():NextNumber(Max - RangeN, Max)
					table.insert(RandomTable, RandomNumber)
					SplitProduct -= RandomNumber
				else
					table.insert(RandomTable, SplitProduct)
					SplitProduct -= SplitProduct
				end
			end
		end
	else
		if RepeatN ~= 1 then
			local RN = Random.new():NextNumber(Min, Max)
			table.insert(RandomTable, RN)
			local SplitN = (RepeatN - 1) / 2
			local DividN = (EndProduct - RN) / SplitN
			local RangeN = (2 - (DividN / Max)) * Max
			for i = 1, SplitN, 1 do
				local SplitProduct = DividN
				for i = 1, 2, 1 do
					if i ~= 2 then
						local RandomNumber = Random.new():NextNumber(Max - RangeN, Max)
						table.insert(RandomTable, RandomNumber)
						SplitProduct -= RandomNumber
					else
						table.insert(RandomTable, SplitProduct)
						SplitProduct -= SplitProduct
					end
				end
			end
		else
			table.insert(RandomTable, Max)
		end
	end
	return RandomTable
end
function MathModule.Random:Multiplication(Table)
	if type(Table) == "table" and Table[4] then else return warn("only tables are allowed in this function") end
	if Table[5] then return warn("you can't have five table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	local EndProduct = Table[3]
	local RepeatN = Table[4]
	if RepeatN % 1 ~= 0 or RepeatN == 0 then return warn("The total numbers have to be a whole number above 0") end
	if Max^RepeatN >= EndProduct then else return warn("End Product has to be less than or equal to the max number possible") end
	if Min <= RepeatN * math.sqrt(Max) then else return warn("Minimum has to be less than or equal to the min divider possible") end
	if Min > Max then return warn("min can't be greater than max") end
	local RandomTable = {}
	local function SNToDN(EP, SN)
		local DN = EP
		for i = 1, SN - 1, 1 do
			DN = math.sqrt(DN)
		end
		return DN
	end
	if RepeatN % 2 == 0 then
		local SplitN = RepeatN / 2
		local DividN = SNToDN(EndProduct, SplitN)
		local RangeN = EndProduct / Max
		for i = 1, SplitN, 1 do
			local SplitProduct = DividN
			for i = 1, 2, 1 do
				if i ~= 2 then
					local RandomNumber = Random.new():NextNumber(RangeN, Max)
					table.insert(RandomTable, RandomNumber)
					SplitProduct /= RandomNumber
				else
					table.insert(RandomTable, SplitProduct)
					SplitProduct -= SplitProduct
				end
			end
		end
	else
		if RepeatN ~= 1 then
			local RN = Random.new():NextNumber(Min, Max)
			table.insert(RandomTable, RN)
			local SplitN = (RepeatN - 1) / 2
			local DividN = SNToDN(EndProduct / RN, SplitN)
			local RangeN = (EndProduct / RN) / Max
			for i = 1, SplitN, 1 do
				local SplitProduct = DividN
				for i = 1, 2, 1 do
					if i ~= 2 then
						local RandomNumber = Random.new():NextNumber(RangeN, Max)
						table.insert(RandomTable, RandomNumber)
						SplitProduct /= RandomNumber
					else
						table.insert(RandomTable, SplitProduct)
						SplitProduct -= SplitProduct
					end
				end
			end
		else
			table.insert(RandomTable, Max)
		end
	end
	return RandomTable
end
function MathModule.Random:Integer(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have five table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	if Min > Max then return warn("min can't be greater than max") end
	return Random.new():NextInteger(Min, Max)
end
function MathModule.Random:NonInteger(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have five table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Min = Table[1]
	local Max = Table[2]
	if Min > Max then return warn("min can't be greater than max") end
	return Random.new():NextNumber(Min, Max)
end
--[[
CLASS Matrix
]]
function MathModule.Matrix:Multiplication(Table)
	local Table1 = Table[1]
	local Table2 = Table[2]
	local Table3 = Table[3]
	if type(Table1) == "table" and Table1[1] then else return warn("only tables are allowed in this function") end
	if type(Table2) == "table" and Table2[1] then else return warn("only tables are allowed in this function") end
	if Table3 then return warn("you can't enter more then two tables into the function") end
	for i = 1, #Table1, 1 do
		if typeof(Table1[i]) == "table" then
			for ii = 1, #Table1[i], 1 do
				if typeof(Table1[i][ii]) == "number" then else return warn("only numbers are allowed in the table") end
			end
		else
			return warn("only matrices are allowed in this function")
		end
	end
	for i = 1, #Table2, 1 do
		if typeof(Table2[i]) == "table" then
			for ii = 1, #Table2[i], 1 do
				if typeof(Table2[i][ii]) == "number" then else return warn("only numbers are allowed in the table") end
			end
		else
			return warn("only matrices are allowed in this function")
		end
	end
	if #Table1 > #Table2 then
		for i = 1, #Table2, 1 do
			if #Table2[i] ~= #Table1 then
				return warn("inner matrix dimensions have to agree")
			end			
		end
	elseif #Table1 < #Table2 or #Table1 == #Table2 then
		for i = 1, #Table1, 1 do
			if #Table1[i] ~= #Table2 then
				return warn("inner matrix dimensions have to agree")
			end			
		end
	end
	local Matrix = {}
	for i = 1, #Table1, 1 do
		Matrix[i] = {}
		for j = 1, #Table2[1], 1 do
			Matrix[i][j] = 0
			for k = 1, #Table2, 1 do
				Matrix[i][j] = Matrix[i][j] + Table1[i][k] * Table2[k][j]
			end
		end
	end
	return Matrix
end
function MathModule.Matrix:DotProduct(Table)
	local Table1 = Table[1]
	local Table2 = Table[2]
	local Table3 = Table[3]
	if type(Table1) == "table" then else return warn("only tables are allowed in this function") end
	if type(Table2) == "table" then else return warn("only tables are allowed in this function") end
	if Table3 then return warn("you can't have three tables") end
	if #Table1 ~= #Table2 then return warn("both tables need the same amount of values inside") end
	if #Table1 == 3 and #Table2 == 3 then else return warn("both tables need 3 values each") end
	for i = 1, #Table1, 1 do
		if typeof(Table1[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	for i = 1, #Table2, 1 do
		if typeof(Table2[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Product = 0
	for i = 1, #Table1 do
		Product += Table1[i] * Table2[i]
	end
	return Product
end
function MathModule.Matrix:CrossProduct(Table)
	local Table1 = Table[1]
	local Table2 = Table[2]
	local Table3 = Table[3]
	if type(Table1) == "table" then else return warn("only tables are allowed in this function") end
	if type(Table2) == "table" then else return warn("only tables are allowed in this function") end
	if Table3 then return warn("you can't have three tables") end
	if #Table1 ~= #Table2 then return warn("both tables need the same amount of values inside") end
	if #Table1 == 3 and #Table2 == 3 then else return warn("both tables need 3 values each") end
	for i = 1, #Table1, 1 do
		if typeof(Table1[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	for i = 1, #Table2, 1 do
		if typeof(Table2[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local TableX = Table1[2] * Table2[3] - Table1[3] * Table2[2]
	local TableY = Table1[3] * Table2[1] - Table1[1] * Table2[3]
	local TableZ = Table1[1] * Table2[2] - Table1[2] * Table2[1]
	return {TableX, TableY, TableZ}
end
function MathModule.Matrix:TensorProduct(Table)
	local Table1 = Table[1]
	local Table2 = Table[2]
	local Table3 = Table[3]
	if type(Table1) == "table" and Table1[1] then else return warn("only tables are allowed in this function") end
	if type(Table2) == "table" and Table2[1] then else return warn("only tables are allowed in this function") end
	if Table3 then return warn("you can't enter more then two tables into the function") end
	for i = 1, #Table1, 1 do
		if typeof(Table1[i]) == "table" then
			for ii = 1, #Table1[i], 1 do
				if typeof(Table1[i][ii]) == "number" then else return warn("only numbers are allowed in the table") end
			end
		else
			return warn("only matrices are allowed in this function")
		end
	end
	for i = 1, #Table2, 1 do
		if typeof(Table2[i]) == "table" then
			for ii = 1, #Table2[i], 1 do
				if typeof(Table2[i][ii]) == "number" then else return warn("only numbers are allowed in the table") end
			end
		else
			return warn("only matrices are allowed in this function")
		end
	end
	local Matrix = {}
	for m = 1, #Table1, 1 do
		for p = 1, #Table2, 1 do
			local Array = {}
			for n = 1, #Table1[m], 1 do
				for q = 1, #Table2[p], 1 do
					table.insert(Array, string.format("%3d ", Table1[m][n] * Table2[p][q]))
				end
			end
			table.insert(Matrix, Array)
		end
	end
	return Matrix
end
function MathModule.Matrix:Transposition(Table)
	if type(Table) == "table" and Table[1] then else return warn("only tables are allowed in this function") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "table" then
			for ii = 1, #Table[i], 1 do
				if typeof(Table[i][ii]) == "number" then else return warn("only numbers are allowed in the table") end
			end
		else
			return warn("only matrices are allowed in this function")
		end
	end
	local Tranposition = {}
	for i = 1, #Table[1], 1 do
		Tranposition[i] = {}
		for j = 1, #Table, 1 do
			Tranposition[i][j] = Table[j][i]
		end
	end
	return Tranposition
end
function MathModule.Matrix:ZigZag(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	if n % 1 == 0 and n >= 2 then else return warn("number has to be a whole number and can't be smaller than 2") end
	local ZigZagMatrix = {}
	local i = 0
	local j = 0
	for j = 1, n do
		ZigZagMatrix[j] = {}
		for i = 1, n do
			ZigZagMatrix[j][i] = 0
		end
	end
	i = 1
	j = 1
	local di = 0
	local dj = 0
	local k = 0
	while k < n * n do
		ZigZagMatrix[j][i] = k
		k = k + 1
		if i == n then
			j += 1
			ZigZagMatrix[j][i] = k
			k += 1
			di = -1
			dj = 1
		end
		if j == 1 then
			i += 1
			ZigZagMatrix[j][i] = k
			k += 1
			di = -1
			dj = 1
		end
		if j == n then
			i += 1
			ZigZagMatrix[j][i] = k
			k += 1
			di = 1
			dj = -1
		end
		if i == 1 then
			j += 1
			ZigZagMatrix[j][i] = k
			k += 1
			di = 1
			dj = -1
		end
		i += di
		j += dj
	end
	return ZigZagMatrix
end
--[[
CLASS Special
]]
function MathModule.Special:Factorial(n)
	if typeof(n) == "number" then else return warn("only numbers are allowed") end
	local function gammafunction(z)
		local gamma = MathModule.Value:EulersConstant()
		local coeff = MathModule.Value:GammaCoeff()
		local quad = MathModule.Value:GammaQuad()
		local qui = MathModule.Value:GammaQui()
		local set = MathModule.Value:GammaSet()
		local function recigamma(rz)
			return rz + gamma * rz^2 + coeff * rz^3 + quad * rz^4 + qui * rz^5 + set * rz^6
		end
		if z == 1 then
			return 1
		elseif math.abs(z) <= 0.5 then
			return 1 / recigamma(z)
		else
			return (z - 1) * gammafunction(z - 1)
		end
	end
	if math.abs(n) + n == 0 and n ~= 0 then
		n *= -1
		local N = gammafunction(n + 1)
		N *= -1
		return N
	else
		return gammafunction(n + 1)
	end
end
function MathModule.Special:NthRoot(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only whole numbers are allowed in the table") end
	end
	local Number = Table[1]
	local NthRoot = Table[2]
	local FractionCheck = false
	if NthRoot % 1 ~= 0 then
		FractionCheck = true
	end
	if math.abs(Number) + Number == 0 and Number ~= 0 then
		local EvenCheck = 2
		if FractionCheck == true then
			EvenCheck = -2
		end
		if NthRoot % EvenCheck == 0 then
			return ((-Number)^(1 / NthRoot)).."i"
		else
			return -((-Number)^(1 / NthRoot))
		end
	end
	return Number^(1 / NthRoot)
end
function MathModule.Special:PerNth(Table)
	if type(Table) == "table" and Table[2] then else return warn("only tables are allowed in this function") end
	if Table[3] then return warn("you can't have three table values") end
	for i = 1, #Table, 1 do
		if typeof(Table[i]) == "number" then else return warn("only numbers are allowed in the table") end
	end
	local Number = Table[1]
	local NthValue = Table[2]
	local Answer = Number / NthValue
	return Answer.." or "..(Answer * 100).."%"
end

return MathModule
end)() end,
    [68] = function()local wax,script,require=ImportGlobals(68)local ImportGlobals return (function(...)local randomString = require(script.Parent.Parent.utilities.randomString)
local customFunctions = require(script.Parent.Parent.utilities.customFunctions)
local fusion = require(script.Parent.Fusion)
local value = fusion.Value

local data
if customFunctions.getgenv then
    customFunctions.getgenv().data = customFunctions.getgenv().data or {}
    data = customFunctions.getgenv().data
else
    _G.data = _G.data or {}
    data = _G.data
end
local dataFunctions = {}

type uid = string
type tag = string

function dataFunctions.update(uid:string, index:string, new:string)
    if index ~= "uid" and dataFunctions.find(uid) and dataFunctions.find(uid)[index] then
        local dataToEdit = dataFunctions.find(uid)
        dataToEdit[index]:set(new)
    elseif not dataFunctions.find(uid) then
        error("couldn't find uid: "..uid)
    elseif index == "uid" or index == "tag" then
        error("cannot edit property "..index)
    elseif not dataFunctions.find(uid)[index] then
        error("index returned nil")
    else
        error("how?")
    end
end
function dataFunctions.find(identifier:uid | tag):table
    local returnData = nil
    for i=1, #data do
        if data[i].uid == identifier or data[i].tag == identifier then
            returnData = data[i]
        end
    end
    if not returnData then
        warn("no data found by identifier: "..tostring(identifier))
        return returnData
    end
    return returnData
end
function dataFunctions.delete(uid:string)
    local dataToDelete = dataFunctions.find(uid)
    local index = table.find(data, dataToDelete)
    local newData = {}
    for i=1, #data do
        if i ~= index then
            table.insert(newData, data[i])
        end
    end
    data = newData
    newData =  nil
end
function dataFunctions.add(newData:table, tag:string):table
    for i,v in newData do
        newData[i] = value(v)
    end
    newData.tag = tag or nil
    newData.uid = randomString(16)
    setmetatable(newData, {
        __index = {
            ["update"] = function(tbl, dataType, info)
                dataFunctions.update(tbl.uid, dataType, info)
            end,
            ["delete"] = function()
                dataFunctions.delete(newData.uid)
            end
        }
    })
    table.insert(data, newData)
    return dataFunctions.find(newData.uid)
end

return dataFunctions

end)() end,
    [69] = function()local wax,script,require=ImportGlobals(69)local ImportGlobals return (function(...)return {
    ['lock'] = "rbxassetid://10723434711",
    ['dropdown'] = "rbxassetid://15555233897",
    ['chevron'] = "rbxassetid://10709790948",
    ['emptyBox'] = "rbxassetid://15555208034",
    ['filledBox'] = "rbxassetid://15555206993",
    ['maximize'] = "rbxassetid://15556636376",
    ['minimize'] = "rbxassetid://15556637715",
    ['close'] = "rbxassetid://10747384394"
}
end)() end,
    [70] = function()local wax,script,require=ImportGlobals(70)local ImportGlobals return (function(...)local cF = require(script.Parent.Parent.utilities.customFunctions)
local cloneref = cF.cloneref

local services = {}

services.UserInputService = cloneref(game:GetService("UserInputService"))
services.RunService = cloneref(game:GetService("RunService"))
services.TextService = cloneref(game:GetService("TextService"))
services.ContextActionService = cloneref(game:GetService("ContextActionService"))

return services
end)() end,
    [71] = function()local wax,script,require=ImportGlobals(71)local ImportGlobals return (function(...)local themeSystem = {}
local fusion = require(script.Parent.Fusion)
local default = require(script.default)
local value = fusion.Value
local observe = fusion.Observer

local get = require(script.Parent.Parent.utilities.get)
local animate = require(script.Parent.Parent.utilities.animate)
local preservedConfig = require(script.Parent.Parent.preservedConfig)
local functionsOnChange = {}

local currentTheme = value({})
observe(currentTheme):onChange(function()
    for _,func in ipairs(functionsOnChange) do
        task.spawn(func)
    end
end)

local paletteCheck = {
    defaultTab = "Color3",
	background = "Color3",
	secondaryBackground = "Color3",
	tertiaryBackground = "Color3",
	text = "Color3",
	image = "Color3",
	placeholder = "Color3",
	close = "Color3"
}

function themeSystem.create(palette)
    for i,_ in paletteCheck do
        if palette[i] == nil then
            palette[i] = preservedConfig[i]
        end
        if typeof(palette[i]) ~= "Color3" then
            error(i.." isn't type Color3")
        end
    end
    for i,_ in palette do
        if paletteCheck[i] == nil then
            warn('Incorrect value removed "'..tostring(i)..'"')
            palette[i] = nil
        end
    end
    currentTheme:set(palette)
end

function themeSystem.get(name:string, animation:boolean)
    local theme = get(currentTheme)
    if theme[name] then
        if animation then
            return animate(function()
                return get(currentTheme)[name]
            end,40,1)
        else
            return theme[name]
        end
    else
        error(name.." isn't a theme element")
    end
end
currentTheme:set(default)
function themeSystem.onChange(func)
    table.insert(functionsOnChange, func)
end

return themeSystem
end)() end,
    [72] = function()local wax,script,require=ImportGlobals(72)local ImportGlobals return (function(...)return {
    defaultTab = Color3.fromHex("#a49ae6"),
	background = Color3.fromRGB(40, 44, 50),
	secondaryBackground = Color3.fromRGB(49, 56, 66),
	tertiaryBackground = Color3.fromRGB(57, 63, 75),
	text = Color3.fromRGB(220,221,225),
	image = Color3.fromRGB(220,221,225),
	placeholder = Color3.fromRGB(165,166,169),
	close = Color3.fromRGB(190, 100, 105)
}
end)() end,
    [74] = function()local wax,script,require=ImportGlobals(74)local ImportGlobals return (function(...)local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(buttonProperty)
	assert(buttonProperty.Name, ":Button missing property Name")
	assert(typeof(buttonProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(buttonProperty.Name)))
	assert(buttonProperty.Callback, ":Button missing property Callback")
	assert(typeof(buttonProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(buttonProperty.Callback)))

	local name = value(buttonProperty.Name)
	local callback = value(buttonProperty.Callback)

	local tabColor = buttonProperty.tabColor or nil

	local isDown = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local newButton = new "TextButton" {
		Parent = buttonProperty.Parent,
		ZIndex = 2,
		Size = UDim2.new(1,0,0,40),
		AutoButtonColor = false,
		Interactable = computed(function()
			return not get(isLocked)
		end),
		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[onevent "MouseButton1Down"] = function()
			isDown:set(true)
		end,
		[onevent "MouseButton1Up"] = function()
			isDown:set(false)
		end,
		[onevent "MouseLeave"] = function()
			isDown:set(false)
		end,
		[onevent "Activated"] = function()
			task.spawn(get(callback))
		end,


		[children] = {
			new "UICorner" {
				CornerRadius = UDim.new(0,6)
			},
			{ -- Lock
				new "Frame" {
					ZIndex = 3,
					Size = UDim2.fromScale(1,1),
					BackgroundTransparency = 0.1,
					BackgroundColor3 = animate(function()
						return theme.get("tertiaryBackground")
					end,40,1),
					Visible = computed(function()
						return get(isLocked)
					end),

					[children] = {
						new "ImageLabel" {
							AnchorPoint = Vector2.new(0,0.5),
							Size = UDim2.fromOffset(24,24),
							Position = UDim2.new(0,10,0.5),
							BackgroundTransparency = 1,
							Image = icons['lock'],
							ImageColor3 = animate(function()
								return theme.get("image")
							end,40,1)
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
							TextSize = 16,
							TextScaled = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = animate(function()
								return theme.get("text")
							end,40,1),

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
			new "Frame" { -- Background
				ZIndex = 2,
				Size = UDim2.new(1,0,1,0),
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(0.5,0,0.5,0),
				BackgroundColor3 = animate(function()
					return tabColor or theme.get("defaultTab")
				end,40,1),
				BackgroundTransparency = animate(function()
					if get(isDown) then
						return 0.95
					end
					return 0.85
				end,50,1),

				[children] = {
					new "UICorner" {
						CornerRadius = UDim.new(0,6)
					}
				}
			},
			new "TextLabel" { -- Name
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-20,0,14),
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,10,0.5,0),
				Font = Enum.Font.Gotham,
				TextScaled = true,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Text = computed(function()
					return get(name)
				end),
				TextTransparency = animate(function()
					if get(isDown) then
						return 0.35
					end
					return 0
				end,50,1),

				[children] = {
					new "UITextSizeConstraint"{
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			}
		}
	}

	local returnFunctions = {}
	function returnFunctions:Remove()
		newButton:Destroy()
	end
	function returnFunctions:SetName(newText)
		if typeof(newText) == "string" then
			name:set(newText)
		else
			error("You didnt give "..get(name).." a string for SetName")
		end
	end
	function returnFunctions:SetCallback(newFunction)
		if typeof(newFunction) == "function" then
			callback:set(newFunction)
		else
			error("You didnt give "..get(name).." a function for SetCallback")
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
end)() end,
    [75] = function()local wax,script,require=ImportGlobals(75)local ImportGlobals return (function(...)local project = script.Parent.Parent

local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local RunSerivce = services.RunService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(colorpickerProperty)
    assert(colorpickerProperty.Name, ":ColorPicker missing property Name")
	assert(typeof(colorpickerProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(colorpickerProperty.Name)))
	assert(colorpickerProperty.Callback, ":ColorPicker missing property Callback")
	assert(typeof(colorpickerProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(colorpickerProperty.Callback)))
    assert(colorpickerProperty.Color, ":ColorPicker missing property Color")
    assert(typeof(colorpickerProperty.Color) == "Color3", ("Color accepts type Color3 got %s"):format(typeof(colorpickerProperty.Color)))

    local name = value(colorpickerProperty.Name)
    local color = value(colorpickerProperty.Color)
    local callback = value(colorpickerProperty.Callback)

    local tabColor = colorpickerProperty.tabColor or nil

    local isLocked = value(false)
	local lockReason = value("")

    local colorAsTable = {get(color):ToHSV()}
    local hueValue = value(colorAsTable[1])
    local saturationValue = value(colorAsTable[2])
    local valueValue = value(colorAsTable[3])

    local function generateColor()
        return Color3.fromHSV(get(hueValue),get(saturationValue),get(valueValue))
    end
    local function setCreatedColor(...)
        local args = {...}
        local hueToSet,saturationToSet,valueToSet
        if typeof(args[1]) == "Color3" then
            hueToSet,saturationToSet,valueToSet = args[1]:ToHSV()
        else
            hueToSet,saturationToSet,valueToSet = Color3.new(...):ToHSV()
        end
        hueValue:set(hueToSet)
        saturationValue:set(saturationToSet)
        valueValue:set(valueToSet)
    end
    local function roundTo(decimal, number)
        local point = 1
        for _=1,decimal do
            point = point*10
        end
        return math.round(number*point)/point
    end

    local isDropped = value(false)
    local SVFrameDown = value(false)
    local SVFrameConnection
    local HFrameDown = value(false)
    local HFrameConnection

    local colorPicker
    colorPicker = new "TextButton" {
        ClipsDescendants = true,
        Interactable = computed(function()
			return not get(isLocked)
		end),
		ZIndex = 2,
		Parent = colorpickerProperty.Parent,
		Size = animate(function()
			if get(isDropped) then
				return UDim2.new(1,0,0,160)
			end
			return UDim2.new(1,0,0,40)
		end,50,1),
        BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

        [onevent "Activated"] = function()
            isDropped:set(not get(isDropped))
        end,
        [onevent "Destroying"] = function()
            if SVFrameConnection then
                SVFrameConnection:Disconnect()
            end
        end,

        [children] = {
            { -- No clue whats in here
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
                new "Frame" { -- Background
                    ZIndex = 2,
                    Size = UDim2.new(1,0,1,0),
                    AnchorPoint = Vector2.new(0.5,0.5),
                    Position = UDim2.new(0.5,0,0.5,0),

                    BackgroundColor3 = animate(function()
                        return tabColor or theme.get("defaultTab")
                    end,40,1),
                    BackgroundTransparency = 0.85,

                    [children] = {
                        new "UICorner" {
                            CornerRadius = UDim.new(0,6)
                        }
                    }
                },
                new "TextLabel" { -- Name
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1,-45,0,14),
                    AnchorPoint = Vector2.new(0,0),
                    Position = UDim2.new(0,10,0,13),
                    Font = Enum.Font.Gotham,
                    TextScaled = true,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTransparency = 0,

                    TextColor3 = animate(function()
                        return theme.get("text")
                    end,40,1),
                    Text = get(name),

                    [children] = {
                        new "UITextSizeConstraint" {
                            MinTextSize = 1,
                            MaxTextSize = 14
                        }
                    }
                },
                new "ImageLabel" {-- Icon
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(1,0),
                    Position = UDim2.new(1,-7,0,8),
                    Size = UDim2.fromOffset(24,24),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://16898730641",
                    ImageRectOffset = Vector2.new(257,257),
                    ImageRectSize = Vector2.new(256,256),
                    ImageColor3 = computed(function()
                        return Color3.fromHSV(get(hueValue),get(saturationValue),get(valueValue))
                    end)
                },
            },
            new "Frame" { -- ColorPicker
                ClipsDescendants = true,
                Position = UDim2.fromOffset(10,40),
                Size = UDim2.new(1,-20,0,110),
                BackgroundTransparency = 1,
                ZIndex = 3,

                [children] = {
                    new "UIListLayout" {
                        Padding = UDim.new(0,10),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    },
                    new "TextBox" { -- HexTextBox
                        Name = "HexTextBox",
                        Size = UDim2.fromOffset(145,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        Text = computed(function()
                            return "#"..generateColor():ToHex()
                        end),
                        TextColor3 = animate(function()
                            return generateColor()
                        end,40,1),
                        TextSize = 20,
                        Font = Enum.Font.GothamMedium,

                        [onevent "FocusLost"] = function()
                            local HexTextBox = colorPicker:FindFirstChild("HexTextBox", true).Text:gsub("[^%w#]", "")
                            if not string.find(HexTextBox, "#") then
                                HexTextBox = "#"..HexTextBox
                            end
                            if string.len(HexTextBox) ~= 7 then
                                warn("Hex code malformed", HexTextBox)
                                colorPicker:FindFirstChild("HexTextBox", true).Text = "#"..generateColor():ToHex()
                            else
                                local s,e = pcall(function()
                                    return Color3.fromHex(HexTextBox)
                                end)
                                if tostring(e) == "Unable to convert characters to hex value" then
                                    warn("Hex code malformed", HexTextBox)
                                    colorPicker:FindFirstChild("HexTextBox", true).Text = "#"..generateColor():ToHex()
                                else
                                    setCreatedColor(Color3.fromHex(HexTextBox))
                                end
                            end
                        end,

                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            }
                        }
                    },
                    new "Frame" { -- HSVTextBoxes
                        Name = "HSVTextBoxes",
                        Size = UDim2.fromOffset(55,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            },
                            new "UIListLayout" {
                                Padding = UDim.new(0,5),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                FillDirection = Enum.FillDirection.Vertical,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            },
                            new "TextLabel" {
                                Text = "H",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "HText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(hueValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(hueTextChange)
                                    local newHue = tonumber(colorPicker:FindFirstChild("HText", true).Text)
                                    if hueTextChange:lower() == "text" then
                                        if newHue then
                                            newHue = math.clamp(newHue, 0,1)
                                            if roundTo(2,get(hueValue)) ~= newHue then
                                                hueValue:set(newHue)
                                            end
                                        end
                                        colorPicker:FindFirstChild("HText", true).Text = tostring(roundTo(2,get(hueValue)))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "S",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "SText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(saturationValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(saturationTextChange)
                                    local newSaturation = tonumber(colorPicker:FindFirstChild("SText", true).Text)
                                    if saturationTextChange:lower() == "text" then
                                        if newSaturation then
                                            newSaturation = math.clamp(newSaturation, 0,1)
                                            if roundTo(2,get(saturationValue)) ~= newSaturation then
                                                saturationValue:set(newSaturation)
                                            end
                                        end
                                        colorPicker:FindFirstChild("SText", true).Text = tostring(roundTo(2,get(saturationValue)))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "V",
                                TextColor3 = animate(function()
                                    return tabColor or theme.get("defaultTab")
                                end,40,1),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "VText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(roundTo(2,get(valueValue)))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "Changed"] = function(valuePropertyChange)
                                    local newValue = tonumber(colorPicker:FindFirstChild("VText", true).Text)
                                    if valuePropertyChange:lower() == "text" then
                                        if newValue then
                                            newValue = math.clamp(newValue, 0,1)
                                            if roundTo(2,get(valueValue)) ~= newValue then
                                                valueValue:set(newValue)
                                            end
                                        end
                                        colorPicker:FindFirstChild("VText", true).Text = tostring(roundTo(2,get(valueValue)))
                                    end
                                end
                            }
                        }
                    },
                    new "Frame" { -- RGBTextBoxes
                        Name = "RGBTextBoxes",
                        Size = UDim2.fromOffset(55,110),
                        BackgroundColor3 = animate(function()
                            return theme.get("background")
                        end,40,1),
                        BackgroundTransparency = 0.3,
                        [children] = {
                            new "UICorner" {
                                CornerRadius = UDim.new(0,4)
                            },
                            new "UIListLayout" {
                                Padding = UDim.new(0,5),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                FillDirection = Enum.FillDirection.Vertical,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            },
                            new "TextLabel" {
                                Text = "R",
                                TextColor3 = Color3.fromRGB(200,0,0),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "RText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().R*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newR = tonumber(colorPicker:FindFirstChild("RText", true).Text)
                                    local oldColor = generateColor()
                                    if newR then
                                        if math.clamp(math.round(oldColor.R*255),0,255) ~= newR then
                                            setCreatedColor(math.clamp(newR,0,255)/255,oldColor.G,oldColor.B)
                                        end
                                    else
                                        colorPicker:FindFirstChild("RText", true).Text = tostring(math.round(oldColor.R*255))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "G",
                                TextColor3 = Color3.fromRGB(0,200,0),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "GText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().G*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newG = tonumber(colorPicker:FindFirstChild("GText", true).Text)
                                    local oldColor = generateColor()
                                    if newG then
                                        if math.clamp(math.round(oldColor.G*255),0,255) ~= newG then
                                            setCreatedColor(oldColor.R,math.clamp(newG,0,255)/255,oldColor.B)
                                        end
                                    else
                                        colorPicker:FindFirstChild("GText", true).Text = tostring(math.round(oldColor.G*255))
                                    end
                                end
                            },
                            new "TextLabel" {
                                Text = "B",
                                TextColor3 = Color3.fromRGB(0,0,125),
                                Font = Enum.Font.GothamMedium,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromOffset(55,14)
                            },
                            new "TextBox" {
                                Name = "BText",
                                TextColor3 = animate(function()
                                    return theme.get("text")
                                end,40,1),
                                Font = Enum.Font.Gotham,
                                BackgroundTransparency = 1,
                                Text = computed(function()
                                    return tostring(math.round(generateColor().B*255))
                                end),
                                Size = UDim2.fromOffset(55,14),

                                [onevent "FocusLost"] = function()
                                    local newB = tonumber(colorPicker:FindFirstChild("BText", true).Text)
                                    local oldColor = generateColor()
                                    if newB then
                                        if math.clamp(math.round(oldColor.B*255),0,255) ~= newB then
                                            setCreatedColor(oldColor.R,oldColor.G,math.clamp(newB,0,255)/255)
                                        end
                                    else
                                        print("B needs to be a number")
                                        colorPicker:FindFirstChild("BText", true).Text = tostring(math.round(oldColor.B*255))
                                    end
                                end
                            }
                        }
                    },
                    new "TextButton" { -- SVPicker
                        ZIndex = 2,
                        Name = "SVPicker",
                        ClipsDescendants = true,
                        Size = UDim2.fromOffset(110,110),

                        [onevent "InputBegan"] = function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                SVFrameDown:set(true)
                                local connection
                                connection = input.Changed:Connect(function()
                                    if input.UserInputState == Enum.UserInputState.End then
                                        SVFrameDown:set(false)
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end,

                        [children] = {
                            new "UIGradient" {
                                Color = computed(function()
                                    return ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromHSV(get(hueValue),1,1)),
                                      })
                                end)
                            },
                            new "ImageLabel" {
                                AnchorPoint = Vector2.new(0.5,0.5),
                                Position = UDim2.fromScale(0.5,0),
                                Size = UDim2.fromScale(1,2),
                                BackgroundTransparency = 1,
                                Image = "rbxassetid://13611892279"
                            },
                            new "Frame" {
                                ZIndex = 2,
                                Name = "dot",
                                AnchorPoint = Vector2.new(0.5,0.5),
                                BackgroundColor3 = computed(function()
                                    local h
                                    if get(hueValue) > 0.95 or get(hueValue) <= 0.05 then
                                        h = 0.5
                                    elseif get(hueValue) < 0.56 and get(hueValue) > 0.45 then
                                        h = 1
                                    else
                                        if get(hueValue) + 1 > 1 then
                                            h = 1 - get(hueValue)
                                        else
                                            h = 1 + get(hueValue)
                                        end
                                    end
                                    return Color3.fromHSV(h,1,1)
                                end),
                                Size = UDim2.fromOffset(4,4),
                                Position = computed(function()
                                    return UDim2.fromScale(get(saturationValue), 1-get(valueValue))
                                end)
                            }
                        }
                    },
                    new "TextButton" { -- HPicker
                        ZIndex = 2,
                        Name = "HPicker",
                        Size = UDim2.fromOffset(55,110),

                        [onevent "InputBegan"] = function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                HFrameDown:set(true)
                                local connection
                                connection = input.Changed:Connect(function()
                                    if input.UserInputState == Enum.UserInputState.End then
                                        HFrameDown:set(false)
                                        connection:Disconnect()
                                    end
                                end)
                            end
                        end,

                        [children] = {
                            new "UIGradient" {
                                Rotation = 90,
                                Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.fromHSV(1, 1, 1)),
                                    ColorSequenceKeypoint.new(0.1, Color3.fromHSV(0.9, 1, 1)),
                                    ColorSequenceKeypoint.new(0.2, Color3.fromHSV(0.8, 1, 1)),
                                    ColorSequenceKeypoint.new(0.3, Color3.fromHSV(0.7, 1, 1)),
                                    ColorSequenceKeypoint.new(0.4, Color3.fromHSV(0.6, 1, 1)),
                                    ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                                    ColorSequenceKeypoint.new(0.6, Color3.fromHSV(0.4, 1, 1)),
                                    ColorSequenceKeypoint.new(0.7, Color3.fromHSV(0.3, 1, 1)),
                                    ColorSequenceKeypoint.new(0.8, Color3.fromHSV(0.2, 1, 1)),
                                    ColorSequenceKeypoint.new(0.9, Color3.fromHSV(0.1, 1, 1)),
                                    ColorSequenceKeypoint.new(1, Color3.fromHSV(0, 1, 1)),
                                })
                            },
                            new "Frame" {
                                Name = "slide",
                                AnchorPoint = Vector2.new(0,0.5),
                                Size = UDim2.new(1,0,0,2),
                                Position = computed(function()
                                    return UDim2.fromScale(0,1-get(hueValue))
                                end)
                            }
                        }
                    }
                }
            }
        }
    }

    observe(SVFrameDown):onChange(function()
        if get(SVFrameDown) then
            SVFrameConnection = RunSerivce.Heartbeat:Connect(function()
                local SatuarationValue = (UserInputService:GetMouseLocation() - colorPicker:FindFirstChild("SVPicker", true).AbsolutePosition)
                SatuarationValue = Vector2.new(math.clamp(SatuarationValue.X, 0, 110), math.clamp(SatuarationValue.Y, 0, 110))
                saturationValue:set(SatuarationValue.X/110)
                valueValue:set((110-SatuarationValue.Y)/110)
            end)
        else
            if SVFrameConnection then
                SVFrameConnection:Disconnect()
            end
        end
    end)
    observe(HFrameDown):onChange(function()
        if get(HFrameDown) then
            HFrameConnection = RunSerivce.Heartbeat:Connect(function()
                local Hue = (UserInputService:GetMouseLocation() - colorPicker:FindFirstChild("HPicker", true).AbsolutePosition)
                Hue = Vector2.new(Hue.X, math.clamp(Hue.Y, 0, 110))
                hueValue:set((110-Hue.Y)/110)
            end)
        else
            if HFrameConnection then
                HFrameConnection:Disconnect()
            end
        end
    end)
    observe(hueValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)
    observe(saturationValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)
    observe(valueValue):onChange(function()
        task.spawn(get(callback), generateColor())
    end)

    local returnFunctions = {}
    function returnFunctions:Lock(reason)
		isLocked:set(true)
        isDropped:set(false)
		lockReason:set(reason or "Locked")
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
	end
    function returnFunctions:Remove()
        colorPicker:Destroy()
    end
    function returnFunctions:SetColor(newColor)
        setCreatedColor(newColor)
    end
    return returnFunctions
end
end)() end,
    [76] = function()local wax,script,require=ImportGlobals(76)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [77] = function()local wax,script,require=ImportGlobals(77)local ImportGlobals return (function(...)local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(groupProperty)
    assert(groupProperty.Name, ":Group missing property Name")
	assert(typeof(groupProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(groupProperty.Name)))
    if groupProperty.Icon then
        assert(typeof(groupProperty.Icon) == "string", ("Icon accepts type string got %s"):format(typeof(groupProperty.Icon)))
    end

    local name = value(groupProperty.Name)
    local icon = value(groupProperty.Icon or "")

    local tabColor = groupProperty.tabColor or nil

    local size = value(40)
    local isClosed = value(false)
    local isLocked = value(false)
    local oldisClosed = value(false)
    local lockReason = value("")
    local hasImage = value(false)

    local newGroup = new "TextButton" {
        ZIndex = 2,
        Parent = groupProperty.Parent,
        ClipsDescendants = true,
        Size = computed(function()
            if get(isClosed) then
                return UDim2.new(1,0,0,40)
            end
            return UDim2.new(1,0,0,get(size))
        end),
        BackgroundTransparency = animate(function()
            if get(isClosed) then
                return 0
            end
            return 1
        end,30,1),
        BackgroundColor3 = animate(function()
            if get(isClosed) then
                return theme.get("secondaryBackground")
            end
            return theme.get("background")
        end,30,1),

        [onevent "Activated"] = function()
            isClosed:set(not get(isClosed))
        end,

        [children] = {
            { -- Lock
				new "Frame" {
					ZIndex = 3,
                    Name = "Lock",
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
            new "UICorner" {CornerRadius = UDim.new(0,4)},
            new "TextLabel" {
                Text =  computed(function()
                    return get(name)
                end),
                TextColor3 = animate(function()
                    if get(isClosed) then
                        return theme.get("text")
                    end
                    return tabColor or theme.get("defaultTab")
                end,40,1),
                BackgroundTransparency = 1,
                Font = Enum.Font.GothamMedium,
                Size = computed(function()
                    if get(hasImage) then
                        return UDim2.new(1,-54,0,16)
                    end
                    return UDim2.new(1,-20,0,16)
                end),
                TextSize = 16,
                Position = computed(function()
                    if get(hasImage) then
                        return UDim2.fromOffset(44,12)
                    end
                    return UDim2.fromOffset(10,12)
                end),
                AnchorPoint = Vector2.new(0,0),
                TextXAlignment = Enum.TextXAlignment.Left
            },
            new "ImageLabel" {
                Visible = computed(function()
                    if get(hasImage) then
                        return true
                    end
                    return false
                end),
                BackgroundTransparency = 1,
                ImageColor3 = animate(function()
                    return theme.get("image")
                end,40,1),
                Image = computed(function()
                    if get(hasImage) then
                        return get(icon)
                    end
                    return ""
                end),
                Size = UDim2.fromOffset(24,24),
                Position = UDim2.fromOffset(10,8)
            },
            new "Frame" {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(24,24),
                Position = UDim2.new(1,-34,0,8),

                [children] = {
                    new "ImageLabel" {
                        AnchorPoint = Vector2.new(0.5,0.5),
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1,1),
                        Position = UDim2.fromScale(0.5,0.5),
                        ImageColor3 = animate(function()
                            if get(isClosed) then
                                return theme.get("image")
                            end
                            return tabColor or theme.get("defaultTab")
                        end,40,1),
                        Image = icons['chevron'],
                        Rotation = animate(function()
                            if get(isClosed) then
                                return 0
                            end
                            return 180
                        end,30,1)
                    }
                }
            },
            new "Frame" {
                Name = "componentHolder",
                Size = computed(function()
                    return UDim2.new(1,0,0,get(size) - 40)
                end),
                Position = UDim2.fromOffset(0,40),
                BackgroundTransparency = 1,

                [onevent "ChildAdded"] = function(child)
                    if typeof(child) == "Instance" and not child:IsA("UIListLayout") then
                        local oldY = child.AbsoluteSize.Y
                        size:set(get(size) + child.AbsoluteSize.Y + 5)
                        --print(get(size), child.Name)

                        child.Changed:Connect(function(groupPropertyerty)
                            if groupPropertyerty:lower() == "absolutesize" then
                                if oldY ~= math.round(child.AbsoluteSize.Y) then
                                    size:set(get(size) - oldY + math.round(child.AbsoluteSize.Y))
                                    oldY = math.round(child.AbsoluteSize.Y)
                                end
                            end
                        end)
                    end
                end,

                [children] = {
                    new "UIListLayout" {
                        Padding = UDim.new(0,5),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    },
                    new "UIPadding" {
                        PaddingLeft = UDim.new(0,5),
                        PaddingRight = UDim.new(0,5),
                    }
                }
            }
        }
    }
    if get(icon) ~= "" then
        hasImage:set(true)
    end

    local returnFunctions = {}
    function returnFunctions:SetName(n)
        if typeof(n) == "string" then
            name:set(n)
        else
            error("You entered a "..typeof(n).." instead of a string")
        end
    end
    function returnFunctions:SetIcon(n)
        if typeof(n) == "string" then
            icon:set(n)
        else
            error("You entered a "..typeof(n).." instead of a string")
        end
    end
    function returnFunctions:Lock(reason)
		isLocked:set(true)
        oldisClosed:set(get(isClosed))
        isClosed:set(true)
		lockReason:set(reason or "Locked")
	end
	function returnFunctions:Unlock()
		isLocked:set(false)
        isClosed:set(get(oldisClosed))
	end
    return newGroup.componentHolder,returnFunctions
end
end)() end,
    [78] = function()local wax,script,require=ImportGlobals(78)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [79] = function()local wax,script,require=ImportGlobals(79)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [80] = function()local wax,script,require=ImportGlobals(80)local ImportGlobals return (function(...)local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local tween = require(project.utilities.tween)
local getStringBounds = require(project.utilities.getStringBounds)

local function roundTo(decimal, number)
    local point = 1
    for i=1,decimal do
        point = point*10
    end
    local stringed = tostring(math.round(number*point)/point)
    local tstringed = string.split(stringed, ".")
    if #tstringed == 1 then
        local zeros = ""
        for i=1,decimal do
            zeros = zeros.."0"
        end
        stringed = stringed.."."..zeros
    end
    return stringed
end

return function(notificationProperty)
    assert(notificationProperty.Title, "Notify needs a Title")
	assert(typeof(notificationProperty.Title) == "string", ("Title accepts type string got %s"):format(typeof(notificationProperty.Title)))
    assert(notificationProperty.Body, "Notfiy needs a Body")
    assert(typeof(notificationProperty.Body) == "string", ("Body accepts type string got %s"):format(typeof(notificationProperty.Body)))
    assert(notificationProperty.Duration, "Notify needs a Duration")
    assert(typeof(notificationProperty.Duration) == "number", ("Duration accepts type number got %s"):format(typeof(notificationProperty.Duration)))

    local parent = value(notificationProperty.Parent)

    local title = value(notificationProperty.Title)
    local body = value(notificationProperty.Body)
    local duration = value(notificationProperty.Duration)
    local bodySize = value(getStringBounds(notificationProperty.Body, {
        TextSize = 13,
        Font = Enum.Font.Gotham,
        VectorSize = Vector2.new(230,1000)
    }).Y)
    local loaded = value(false)
    local resized = value(false)
    local tickText = value("")

    local newNotification

    newNotification = new "Frame" {
        AnchorPoint = Vector2.new(0,0.5),
        BackgroundTransparency = 1,

        Parent = get(parent),
        Size = animate(function()
            if get(loaded) then
                task.delay(0.4,function()
                    resized:set(true)
                end)
                return UDim2.fromOffset(230,25 + get(bodySize) + 15)
            end
            return UDim2.fromOffset(230,0)
        end,20,1),

        [children] = {
            new "TextButton" {
                AnchorPoint = Vector2.new(0,0.5),
                BackgroundTransparency = 0,

                BackgroundColor3 = animate(function()
                    return theme.get("background")
                end,40,1),
                Size = computed(function()
                    return UDim2.fromOffset(230,25 + get(bodySize) + 15)
                end),
                Position = animate(function()
                    if get(resized) then
                        return UDim2.fromScale(0,0.5)
                    end
                    return UDim2.fromScale(1.2,0.5)
                end,30,1),

                [onevent "Activated"] = function()
                    resized:set(false)
                    task.wait(0.4)
                    loaded:set(false)
                    task.wait(2)
                    newNotification:Destroy()
                end,

                [children] = {
                    new "UICorner" {CornerRadius = UDim.new(0,4)},
                    new "TextLabel" {
                        Name = "Title",
                        Size = UDim2.new(1,-5,0,18),
                        Position = UDim2.new(0,5,0,5),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.GothamMedium,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = 18,

                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Text = get(title)
                    },
                    new "TextLabel" {
                        Name = "Body",
                        Size = UDim2.new(1,-8,0,get(bodySize)),
                        Position = UDim2.fromOffset(8,25),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.Gotham,
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextTransparency = 0.2,
                        TextWrapped = true,

                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Text = get(body)
                    },
                    new "TextLabel" {
                        Size = UDim2.fromOffset(100,10),
                        AnchorPoint = Vector2.new(1,1),
                        Position = UDim2.new(1,-5,1,-5),
                        Text = computed(function()
                            return get(tickText)
                        end),
                        TextColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Right
                    },
                    new "Frame" {
                        Name = "timer",
                        ZIndex = 0,
                        AnchorPoint = Vector2.new(0,1),
                        Position = UDim2.fromScale(0,1),

                        BackgroundColor3 = animate(function()
                            return theme.get("text")
                        end,40,1),
                        Size = tween(function()
                            if get(resized) then
                                return UDim2.new(1,0,0,10)
                            end
                            return UDim2.new(0,0,0,10)
                        end,TweenInfo.new(get(duration), Enum.EasingStyle.Linear)),

                        [children] = {
                            new "UICorner" {CornerRadius = UDim.new(0,4)},
                            new "Frame" {
                                AnchorPoint = Vector2.new(0.5,0),
                                Size = UDim2.fromScale(1,0.6),
                                Position = UDim2.fromScale(0.5,0),
                                BackgroundColor3 = animate(function()
                                    return theme.get("background")
                                end,40,1)
                            }
                        }
                    }
                }
            }
        }
    }
    task.spawn(function()
        repeat task.wait() until get(resized)
        local startTick = tick()
        local endTick
        repeat
            endTick = tick() - startTick
            tickText:set(roundTo(1,math.clamp(endTick,0,get(duration))))
            task.wait()
        until endTick > get(duration)
    end)
    task.spawn(function()
        task.wait()
        loaded:set(true)
        repeat task.wait() until get(resized)
        task.wait(get(duration))
        resized:set(false)
        task.wait(0.4)
        loaded:set(false)
        task.wait(2)
        newNotification:Destroy()
    end)
end
end)() end,
    [81] = function()local wax,script,require=ImportGlobals(81)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [82] = function()local wax,script,require=ImportGlobals(82)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [83] = function()local wax,script,require=ImportGlobals(83)local ImportGlobals return (function(...)local project = script.Parent.Parent

local services = require(project.Bundles.services)
local RunService = services.RunService
local UserInputService = services.UserInputService
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

return function(sliderProperty)
	assert(sliderProperty.Name, ":Slider needs a Name")
	assert(typeof(sliderProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(sliderProperty.Name)))
	assert(sliderProperty.Max, ":Slider needs a Max")
	assert(typeof(sliderProperty.Max) == "number", ("Max accepts type number got %s"):format(typeof(sliderProperty.Max)))
	assert(sliderProperty.Min, ":Slider needs a Min")
	assert(typeof(sliderProperty.Min) == "number", ("Min accepts type number got %s"):format(typeof(sliderProperty.Min)))
	assert(sliderProperty.Callback, ":Slider needs a Callback")
	assert(typeof(sliderProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(sliderProperty.Callback)))
	if sliderProperty.Placement then
		assert(typeof(sliderProperty.Placement) == "number", ("Placement accepts type number got %s"):format(typeof(sliderProperty.Placement)))
	end
	if sliderProperty.InitialValue then
		assert(typeof(sliderProperty.InitialValue) == "number", ("InitialValue accepts type number got %s"):format(typeof(sliderProperty.InitialValue)))
	end

	local name = value(sliderProperty.Name)
	local callback = value(sliderProperty.Callback)
	local max = value(sliderProperty.Max)
	local min = value(sliderProperty.Min)
	local roundTo = value(sliderProperty.Placement or 0)
	local initialValue = value(sliderProperty.InitialValue or get(min))

	local tabColor = sliderProperty.tabColor or nil

	local sliderRef = value()
	local buttonRef = value()

	local mouseEntered = value(false)
	local button1Down = value(false)
	local isLocked = value(false)
	local lockReason = value("")

	local function Round(Value)
		if get(roundTo) == 0 then
			return math.floor(Value)
		end
		return tonumber(string.format('%.' .. get(roundTo) .. 'f', Value))
	end
	local function mapValue(Value, MinA, MaxA, MinB, MaxB)
		return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB
	end
	local function GetValueFromXOffset(X)
		return Round(mapValue(X, 0, 180, get(min), get(max)))
	end

	local percentage = value(0)
	local percentageOf = value(get(min))
	observe(percentageOf):onChange(function()
		percentage:set(mapValue(get(percentageOf), get(min), get(max), 0, 1))
		if not get(isLocked) then
			task.spawn(get(callback), get(percentageOf))
		end
	end)

	if get(initialValue) < get(min) or get(initialValue) > get(max) then
		warn("InitialValue for "..get(name).." is either too big or too small! InitialValue = "..tostring(get(min)))
		initialValue:set(get(min))
	end

	UserInputService.InputEnded:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and get(button1Down) then
			button1Down:set(false)
		end
	end)

	local newSlider = new "Frame" {
		Size = UDim2.new(1,0,0,40),
		ClipsDescendants = true,

		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),
		Parent = sliderProperty.Parent,

		[onevent "MouseEnter"] = function()
			mouseEntered:set(true)
		end,
		[onevent "MouseLeave"] = function()
			mouseEntered:set(false)
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
					Size = UDim2.fromScale(1,1),
					AnchorPoint = Vector2.new(0.5,0),
					Position = UDim2.fromScale(0.5,0),
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
					Size = UDim2.new(1,-220,0,14),
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(0,10,0.5,0),
					Font = Enum.Font.Gotham,
					TextScaled = true,
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTransparency = 0,

					TextColor3 = animate(function()
						return theme.get("text")
					end,40,1),
					Text = get(name),

					[children] = {
						new "UITextSizeConstraint" {
							MinTextSize = 1,
							MaxTextSize = 14
						}
					}
				}
			},
			new "CanvasGroup" {
				AnchorPoint = Vector2.new(1,0.5),
				Position = UDim2.new(1,-10,0.5,0),

				BackgroundColor3 = animate(function()
					return theme.get("image")
				end,40,1),
				Size = animate(function()
					if get(mouseEntered) and not get(isLocked) then
						return UDim2.fromOffset(180,16)
					end
					return UDim2.fromOffset(180,4)
				end,40,1),

				[children] = {
					new "UICorner" {
						CornerRadius = animate(function()
							if get(mouseEntered) then
								return UDim.new(0,4)
							end
							return UDim.new(0,6)
						end,40,1),
					},
					new "TextButton" {
						Interactable = computed(function()
							return not get(isLocked)
						end),
						AnchorPoint = Vector2.new(0.5,0.5),
						Size = UDim2.fromScale(1,1),
						Position = UDim2.fromScale(0.5,0.5),
						BackgroundTransparency = 1,

						[onevent "MouseButton1Down"] = function()
							button1Down:set(true)
						end,
						[onevent "TouchLongPress"] = function()
							button1Down:set(true)
						end,
						[onevent "InputBegan"] = function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								local mPos = UserInputService:GetMouseLocation().X
								local gPos = get(sliderRef).Size.X.Offset
								local Diff = mPos - (get(sliderRef).AbsolutePosition.X + gPos)

								while get(button1Down) and not get(isLocked) and task.wait() do
									local nMPos = UserInputService:GetMouseLocation().X
                    				local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, 180)
									
									percentageOf:set(GetValueFromXOffset(nX))
									RunService.RenderStepped:Wait()
								end
							end
						end,

						[ref] = buttonRef,
						[children] = {
							new "Frame" {
								Name = "ChangeThing",
								AnchorPoint = Vector2.new(0,0.5),
								Position = UDim2.fromScale(0,0.5),

								BackgroundColor3 = animate(function()
									return tabColor or theme.get("defaultTab")
								end,40,1),
								Size = animate(function()
									return UDim2.fromScale(get(percentage),1)
								end,60,1),

								[ref] = sliderRef
							}
						}
					},
				}
			},
			new "TextLabel" {
				AnchorPoint = Vector2.new(1,0.5),
				Size = UDim2.fromOffset(20,14),
				Position = UDim2.new(1,-195,0.5,0),
				BackgroundTransparency = 1,
				Text = computed(function()
					return tostring(get(percentageOf))
				end),
				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Font = Enum.Font.Gotham,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextScaled = true,

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			}
		}
	}

	percentageOf:set(get(initialValue))

	local returnFunctions = {}
	function returnFunctions:Remove()
		newSlider:Destroy()
	end
	function returnFunctions:SetValue(newValue)
		if typeof(newValue) == "number" and (newValue <= get(max)) and (newValue >= get(min)) then

			percentageOf:set(newValue)
		elseif typeof(newValue) ~= "number" then
			error("You didn't give "..get(name).." a number for SetValue")
		else
			error("Your SetValue for "..get(name).." is great or smaller than the maximum or minimum")
		end
	end
	function returnFunctions:SetMin(newMin)
		if typeof(newMin) == "number" and (newMin < get(max)) then
			min:set(newMin)
			local button = get(buttonRef)
			button.ChangeThing.ZIndex = 2
			button.ChangeThing.ZIndex = 1
		elseif typeof(newMin) ~= "number" then
			error("You didn't give "..get(name).." a number for SetMin")
		else
			error("Your SetMin for "..get(name).." is great than the maximum")
		end
	end
	function returnFunctions:SetMax(newMax)
		if typeof(newMax) == "number" and (newMax < get(min)) then
			max:set(newMax)
			local button = get(buttonRef)
			button.ChangeThing.ZIndex = 2
			button.ChangeThing.ZIndex = 1
		elseif typeof(newMax) ~= "number" then
			error("You didn't give "..get(name).." a number for SetMax")
		else
			error("Your SetMax for "..get(name).." is smaller than the minimum")
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
end)() end,
    [84] = function()local wax,script,require=ImportGlobals(84)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [85] = function()local wax,script,require=ImportGlobals(85)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [86] = function()local wax,script,require=ImportGlobals(86)local ImportGlobals return (function(...)local project = script.Parent.Parent

local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local computed = Fusion.Computed
local observe = Fusion.Observer

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local icons = require(project.Bundles.icons)

return function(toggleProperty)
	assert(toggleProperty.Name, ":Toggle missing property Name")
	assert(typeof(toggleProperty.Name) == "string", ("Name accepts type string got %s"):format(typeof(toggleProperty.Name)))
	assert(toggleProperty.Callback, ":Toggle missing property Callback")
	assert(typeof(toggleProperty.Callback) == "function", ("Callback accepts type function got %s"):format(typeof(toggleProperty.Callback)))
	if toggleProperty.Default then
		assert(typeof(toggleProperty.Default) == "boolean", ("Default accepts type boolean got %s"):format(typeof(toggleProperty.Default)))

	end

	local name = value(toggleProperty.Name)
	local callback = value(toggleProperty.Callback)
	local default = value(toggleProperty.Default or false)

	local tabColor = toggleProperty.tabColor or nil

	local toggled = value(false)
	local isLocked = value(false)
	local lockReason = value("")
	observe(toggled):onChange(function()
		if not get(isLocked) then
			task.spawn(get(callback), get(toggled))
		end
	end)

	local newToggle = new "TextButton" {
		Parent = toggleProperty.Parent,
		Interactable = computed(function()
			return not get(isLocked)
		end),
		Size = UDim2.new(1,0,0,40),
		AutoButtonColor = false,

		BackgroundColor3 = animate(function()
			return theme.get("secondaryBackground")
		end,40,1),

		[onevent "Activated"] = function()
			toggled:set(not get(toggled))
		end,

		[children] = {
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
				Size = UDim2.new(1,-45,0,14),
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,10,0.5,0),
				Font = Enum.Font.Gotham,
				TextScaled = true,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTransparency = 0,

				TextColor3 = animate(function()
					return theme.get("text")
				end,40,1),
				Text = get(name),

				[children] = {
					new "UITextSizeConstraint" {
						MinTextSize = 1,
						MaxTextSize = 14
					}
				}
			},
			new "ImageLabel" {
				AnchorPoint = Vector2.new(1,0),
				Position = UDim2.new(1,-5,0,6),
				Size = UDim2.fromOffset(28,28),
				BackgroundTransparency = 1,
				Image = icons['emptyBox'],
				
				ImageColor3 = animate(function()
					return theme.get("image")
				end,40,1),

				[children] = {
					new "UICorner" {
						CornerRadius = UDim.new(1,0)
					},
					new "ImageLabel" {
						AnchorPoint = Vector2.new(0.5,0.5),
						Position = UDim2.fromScale(0.5,0.5),
						Size = UDim2.new(1,0,1,0),
						BackgroundTransparency = 1,
						Image = icons['filledBox'],
						
						ImageColor3 = animate(function()
							return theme.get("image")
						end,40,1),
						ImageTransparency = animate(function()
							if get(toggled) then
								return 0
							end
							return 1
						end,30,1),

						[children] = {
							new "UICorner" {
								CornerRadius = UDim.new(1,0)
							}
						}
					}
				}

			}
		}
	}

	toggled:set(get(default))

	local returnFunctions = {}
	function returnFunctions:Remove()
		newToggle:Destroy()
	end
	function returnFunctions:SetValue(newValue)
		if typeof(newValue) == "boolean" then
			toggled:set(newValue)
		else
			error("You didn't give "..get(name).." a boolean for SetValue")
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
end)() end,
    [87] = function()local wax,script,require=ImportGlobals(87)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [89] = function()local wax,script,require=ImportGlobals(89)local ImportGlobals return (function(...)local project = script.Parent.Parent

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
end)() end,
    [90] = function()local wax,script,require=ImportGlobals(90)local ImportGlobals return (function(...)local project = script.Parent.Parent

local data = require(project.Bundles.data)
local services = require(project.Bundles.services)
local UserInputService = services.UserInputService
local Fusion = require(project.Bundles.Fusion)
local new = Fusion.New
local onevent = Fusion.OnEvent
local children = Fusion.Children
local value = Fusion.Value
local ref = Fusion.Ref
local observe = Fusion.Observer
local computed = Fusion.Computed

local get = require(project.utilities.get)
local theme = require(project.Bundles.themeSystem)
local animate = require(project.utilities.animate)
local references = require(project.utilities.references)

return function(windowProperty)
    local mobileQuake

    local selectedTab = data.find("selectedTab")

    local isOpen = value(false)
    local isToggled = data.find("isToggled")
    local keyCode = data.find("keyCode")

	local sideBarRef = value()
	references.add(sideBarRef)
	local windowsRef = value()
	references.add(windowsRef)
	local uipagelayoutRef = value()
	references.add(uipagelayoutRef)
	local notificationListRef = value()
	references.add(notificationListRef)

    local isToggledConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode and input.KeyCode == get(keyCode.EnumItem) then
			isToggled:update("boolean", not get(isToggled.boolean))
		end
	end)

    observe(selectedTab.data):onChange(function()
		local tab_data = get(selectedTab.data)
		local uipagelayout = get(uipagelayoutRef)
		uipagelayout:JumpTo(tab_data.tabPage)
	end)

    mobileQuake = new "ScreenGui" {
        Name = windowProperty.Title,
        Parent = windowProperty.Parent,
        IgnoreGuiInset = false,
		ResetOnSpawn = false,
        Enabled = computed(function()
			return get(isToggled.boolean)
		end),

        [onevent "Destroying"] = function()
            isToggledConnection:Disconnect()
        end,

        [children] = {
            new "Frame" {
                Name = "container",
                AnchorPoint = Vector2.new(0,1),
                Position = UDim2.new(0,5,1,-5),
                ClipsDescendants = true,

                BackgroundColor3 = animate(function()
					return theme.get("background")
				end,40,1),
                Size = animate(function()
                    if get(isOpen) then
                        return UDim2.new(0.75,0,1,-10)
                    else
                        return UDim2.fromOffset(40,40)
                    end
                end,45,1),

                [children] = {
                    {
                        new "UICorner" {
                            CornerRadius = UDim.new(0,6)
                        },
                        new "TextButton" { -- activator
                            Name = "activator",
                            ZIndex = 2,
                            AnchorPoint = Vector2.new(0,1),
                            Size = UDim2.fromOffset(40,40),
                            Position = UDim2.fromScale(0,1),
                            BackgroundTransparency = 1,
                            ClipsDescendants = true,

                            [onevent "Activated"] = function()
                                isOpen:set(not get(isOpen))
                            end,

                            [children] = {
                                new "UICorner" {
                                    CornerRadius = UDim.new(0,6)
                                },
                                new "ImageLabel" {
                                    Name = "maximizeIcon",
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromOffset(30,30),
                                    Image = "rbxassetid://15556636376",

                                    ImageColor3 = animate(function()
                                        return theme.get("image")
                                    end,40,1),
                                    ImageTransparency = animate(function()
                                        if get(isOpen) then
                                            return 1
                                        else
                                            return 0
                                        end
                                    end,45,1),
                                    Position = animate(function()
                                        if get(isOpen) then
                                            return UDim2.fromScale(0.5,1.5)
                                        else
                                            return UDim2.fromScale(0.5,0.5)
                                        end
                                    end,25,1),
                                },
                                new "ImageLabel" {
                                    Name = "minimizeIcon",
                                    AnchorPoint = Vector2.new(0.5,0.5),
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromOffset(30,30),
                                    Image = "rbxassetid://15556637715",

                                    ImageColor3 = animate(function()
                                        return theme.get("image")
                                    end,40,1),
                                    ImageTransparency = animate(function()
                                        if get(isOpen) then
                                            return 0
                                        else
                                            return 1
                                        end
                                    end,45,1),
                                    Position = animate(function()
                                        if get(isOpen) then
                                            return UDim2.fromScale(0.5,0.5)
                                        else
                                            return UDim2.fromScale(0.5,1.5)
                                        end
                                    end,25,1),
                                }
                            }
                        },
                        new "ScrollingFrame" { -- tabsList
                            Name = "sideBar",
                            Size = UDim2.new(0,50,1,-80),
                            Position = UDim2.fromOffset(0,40),
                            BackgroundTransparency = 1,
                            ScrollBarThickness = 0,
                            ClipsDescendants = false,
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
                                new "UIPadding" {
                                    PaddingLeft = UDim.new(0,10)
                                }
                            }
                        },
                        new "Frame" { -- topBar
                            Name = "topBar",
                            Size = UDim2.new(1,0,0,40),
                            BackgroundTransparency = 1,
                            ZIndex = 0,

                            [children] = {
                                new "TextLabel" {
                                    AnchorPoint = Vector2.new(0,0.5),
                                    Position = UDim2.fromScale(0,0.5),
                                    Size = UDim2.new(1,-40,0,24),
                                    BackgroundTransparency = 1,
                                    Font = Enum.Font.GothamBold,
                                    TextScaled = true,
                                    TextSize = 24,
                                    TextXAlignment = Enum.TextXAlignment.Left,

                                    Text = windowProperty.Title,
                                    TextColor3 = animate(function()
                                        return get(selectedTab.data).tabColor or theme.get("defaultTab")
                                    end,15,1),
                                    TextTransparency = animate(function()
                                        if get(isOpen) then
                                            return 0
                                        else
                                            return 1
                                        end
                                    end,45,1),
                                    [children] = {
                                        new "UIPadding" {PaddingLeft = UDim.new(0,10)},
                                        new "UITextSizeConstraint" {
                                            MaxTextSize = 24,
                                            MinTextSize = 1
                                        }
                                    }
                                },
                                new "TextButton" {
                                    AnchorPoint = Vector2.new(1,0.5),
                                    Position = UDim2.fromScale(1,0.5),
                                    Size = UDim2.fromOffset(40,40),
                                    BackgroundTransparency = 1,
                                    Text = "",
                                    ZIndex = 0,

                                    [onevent "Activated"] = function()
                                        mobileQuake:Destroy()
                                    end,

                                    [children] = {
                                        new "ImageLabel" {
                                            AnchorPoint = Vector2.new(0.5,0.5),
                                            Position = UDim2.fromScale(0.5,0.5),
                                            Size = UDim2.fromScale(0.9,0.9),
                                            Rotation = 45,
                                            BackgroundTransparency = 1,
                                            Image = "rbxassetid://15556635005",

                                            ImageColor3 = animate(function()
                                                return theme.get("close")
                                            end,40,1),
                                            ImageTransparency = animate(function()
                                                if get(isOpen) then
                                                    return 0
                                                else
                                                    return 1
                                                end
                                            end,45,1),
                                        }
                                    }
                                }
                            }
                        },
                        new "Frame" { -- windowsList
                            Name = "windowsList",
                            ZIndex = 0,
                            Position = UDim2.fromOffset(50,40),
                            Size = UDim2.new(1,-50,1,-40),
                            BackgroundTransparency = 1,
                            ClipsDescendants = true,

                            [ref] = windowsRef,

                            [children] = {
                                new "UIPadding" {
                                    PaddingLeft = UDim.new(0,5),
                                    PaddingRight = UDim.new(0,10),
                                    PaddingTop = UDim.new(0,5),
                                    PaddingBottom = UDim.new(0,5)
                                },
                                new "UIPageLayout" {
                                    Name = "UIPageLayout",
                                    EasingDirection = Enum.EasingDirection.In,
                                    EasingStyle = Enum.EasingStyle.Sine,
                                    TweenTime = 0.2,
                                    FillDirection = Enum.FillDirection.Vertical,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    Padding = UDim.new(0,20),

                                    [ref] = uipagelayoutRef
                                },
                            }
                        }
                    }
                }
            },
            new "ScrollingFrame" { -- notifications
                Name = "notifications",
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

    return mobileQuake
end
end)() end,
    [91] = function()local wax,script,require=ImportGlobals(91)local ImportGlobals return (function(...)return {
	defaultTab = Color3.fromHex("#a49ae6"),
	background = Color3.fromRGB(40, 44, 50),
	secondaryBackground = Color3.fromRGB(49, 56, 66),
	tertiaryBackground = Color3.fromRGB(57, 63, 75),
	text = Color3.fromRGB(220,221,225),
	image = Color3.fromRGB(220,221,225),
	placeholder = Color3.fromRGB(165,166,169),
	close = Color3.fromRGB(190, 100, 105)
}
end)() end,
    [92] = function()local wax,script,require=ImportGlobals(92)local ImportGlobals return (function(...)local project = require(script.Parent)

local themes = {
    ["Dracula"] = {
        defaultTab = Color3.fromRGB(254, 126, 92),
        background = Color3.fromRGB(40, 42, 54),
        secondaryBackground = Color3.fromRGB(50, 52, 64),
        tertiaryBackground = Color3.fromRGB(45, 47, 59),
        text = Color3.fromRGB(204, 204, 204),
        image = Color3.fromRGB(204, 204, 204),
        placeholder = Color3.fromRGB(165,166,169),
        close = Color3.fromRGB(190, 100, 105)
    },
    ["Dark"] = {
        defaultTab = Color3.fromRGB(150, 150, 150),
        background = Color3.fromRGB(26, 27, 33),
        secondaryBackground = Color3.fromRGB(34, 35, 39),
        tertiaryBackground = Color3.fromRGB(22, 22, 22),
        text = Color3.fromRGB(230, 230, 230),
        image = Color3.fromRGB(94, 93, 93),
        placeholder = Color3.fromRGB(79, 79, 79),
        close = Color3.fromRGB(190, 100, 105)
    },
    ["Default"] = {},
    ["Eyebleed"] = {
        defaultTab = Color3.fromRGB(255, 67, 211),
        background = Color3.fromRGB(195, 198, 217),
        secondaryBackground = Color3.fromRGB(127, 130, 140),
        tertiaryBackground = Color3.fromRGB(116, 137, 100),
        text = Color3.fromRGB(116, 57, 108),
        image = Color3.fromRGB(244, 162, 162),
        placeholder = Color3.fromRGB(57, 181, 103),
        close = Color3.fromRGB(181, 177, 67)
    }
}

return function(target)
    local window = project:Window({
        Title = "Quake Window",
        Parent = target,
        isMobile = true,

        --KeyCode = Enum.KeyCode.Q
    })

    local tab1 = window:Tab({
        Name = "Quake Tab 1",
        Image = "rbxassetid://10734908793"
    })
    local tab2 = window:Tab({
        Name = "Quake Tab 2",
        tabColor = Color3.fromRGB(255,120,222),
        Image = "rbxassetid://10734919691"
    })
    local tab3 = window:Tab({
        Name = "Quake Tab 3",
        tabColor = Color3.fromRGB(65,253,123),
        Image = "rbxassetid://10734950309"
    })

    tab1:Button({
        Name = "Quake Button",
        Callback = function()
            print("Quake Button")
        end
    })
    tab1:Toggle({
        Name = "Quake Toggle",
        Default = false,
        Callback = function(var)
            print("Quake Toggle", var)
        end
    })
    tab1:Slider({
        Name = "Quake Slider",
        Min = 0,
        Max = 100,
        InitialValue = 0,
        Callback = function(var)
            print("Quake Slider", var)
        end
    })
    tab1:Dropdown({
        Name = "Quake Multiselect Dropdown",
        Items = {"Apple", "Banana", "Carrot","Dingleberry"},
        Default = "Apple",
        Multiselect = true,
        Callback = function(var)
            print("Quake Dropdown", var)
        end
    })
    tab1:TextBox({
        Name = "Quake TextBox",
        Default = "heyy",
        OnLeave = true,
        OnlyNumbers = true,
        Callback = function(var)
            print("Quake TextBox", var)
        end
    })
    tab1:Keybind({
        Name = "Quake Keybind",
        Default = "F",
        Callback = function()
            project:ToggleQuake()
        end
    })
    tab1:ColorPicker({
        Name = "Quake Color Picker",
        Color = Color3.fromHex("#a49ae6"),
        Callback = function(var)
            print("Quake Color Picker", var)
        end
    })
    
    tab1:Label("Quake Label")
    tab1:Section("Quake Section")
    tab1:Paragraph({
        Title = "Quake Paragraph",
        Body = "Quake Paragraph"
    })
    tab2:Label("Quake Group Below")
    local group1 = tab2:Group({
        Name = "Quake Group",
        Icon = "rbxassetid://10734950309"
    })

    group1:Button({
        Name = "Quake Button",
        Callback = function()
            print("Quake Button")
        end
    })
    group1:Toggle({
        Name = "Quake Toggle",
        Default = false,
        Callback = function(var)
            print("Quake Toggle", var)
        end
    })
    group1:Slider({
        Name = "Quake Slider",
        Min = 0,
        Max = 100,
        Step = 1,
        InitialValue = 0,
        Callback = function(var)
            print("Quake Slider", var)
        end
    })
    group1:Dropdown({
        Name = "Quake Dropdown",
        Items = {"Apple", "Banana", "Carrot","Dingleberry"},
        Multiselect = false,
        Callback = function(var)
            print("Quake Dropdown", var)
        end
    })
    group1:TextBox({
        Name = "Quake TextBox",
        Default = "",
        Callback = function(var)
            print("Quake TextBox", var)
        end
    })
    group1:Keybind({
        Name = "Quake Keybind",
        Default = "E",
        Callback = function()
            print("Quake Keybind")
        end
    })
    group1:ColorPicker({
        Name = "Quake Color Picker",
        Color = Color3.fromHex("#a49ae6"),
        Callback = function(var)
            print("Quake Color Picker", var)
        end
    })
    group1:Label("Quake Label")
    group1:Section("Quake Section")
    group1:Paragraph({
        Title = "Quake Paragraph",
        Body = "Quake Paragraph"
    })

    tab2:Dropdown({
        Name = "Switch Theme",
        Items = {"Dracula","Dark","Default","Eyebleed"},
        Default = "Default",
        Callback = function(value)
            project:SetCustomTheme(themes[value])
        end
    })

    local slider = tab3:Slider({
        Name = "Slider To Lock",
        Max = 150,
        Min = 37,
        Callback = function(value)
        end
    })
    tab3:Toggle({
        Name = "Lock Slider",
        Default = false,
        Callback = function(value)
            if value then
                slider:Lock("Buy Premium!!")
            else
                slider:Unlock()
            end
        end
    })

    return function()
        project:Destroy()
    end
end

end)() end,
    [94] = function()local wax,script,require=ImportGlobals(94)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed,spring = Fusion.Computed,Fusion.Spring

return function(callback, speed, damping)
	return spring(computed(callback), speed, damping)
end
end)() end,
    [95] = function()local wax,script,require=ImportGlobals(95)local ImportGlobals return (function(...)local connections = {}
local connectionsFunction = {}

local services = require(script.Parent.Parent.Bundles.services)
local ContextActionService = services.ContextActionService

function connectionsFunction.add(connection)
    table.insert(connections, connection)
end
function connectionsFunction.deleteConnections()
    for i,v in connections do
        v:Disconnect()
        connections[i] = nil
    end
    ContextActionService:UnbindAllActions()
end

return connectionsFunction
end)() end,
    [96] = function()local wax,script,require=ImportGlobals(96)local ImportGlobals return (function(...)local functions = {}

function functions.cloneref(service)
    if cloneref then
        return cloneref(service)
    else
        return service
    end
end

functions.getgenv = getgenv or nil
return functions
end)() end,
    [97] = function()local wax,script,require=ImportGlobals(97)local ImportGlobals return (function(...)return function(o,s)
	local services = require(script.Parent.Parent.Bundles.services)
	local DRAG_SPEED = s or 10
	local UserInputService = services.UserInputService
	local runService = services.RunService
	local gui = o
	local dragging, lastMousePos, lastGoalPos, startPos
	local function Lerp(a, b, m)
		return a + (b - a) * m
	end
	
	local function Update(dt)
		if not (startPos) then return end;
		
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end
		
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	local connection = runService.Heartbeat:Connect(Update)
	return connection
end

end)() end,
    [98] = function()local wax,script,require=ImportGlobals(98)local ImportGlobals return (function(...)return function(value, dependency)
	if typeof(value) == "table" and value.type == "State" then
		return value:get(dependency)
	end
	return value
end
end)() end,
    [99] = function()local wax,script,require=ImportGlobals(99)local ImportGlobals return (function(...)return function(text:string, properties)
    text = text or ""
    properties = properties or {
        TextSize = 14,
        Font = Enum.Font.Arial,
        VectorSize = Vector2.new(200,50)
    }
    local TextService = game:GetService("TextService")
    return TextService:GetTextSize(text,properties.TextSize,properties.Font,properties.VectorSize)
end
end)() end,
    [100] = function()local wax,script,require=ImportGlobals(100)local ImportGlobals return (function(...)local black = Color3.new(0, 0, 0)
local white = Color3.new(1, 1, 1)

return function(color: Color3, BorW: string, lerpAmount: number) 
	local check = string.lower(BorW)
	if BorW == "black" then
		return color:Lerp(black, lerpAmount)
	elseif BorW == "white" then
		return color:Lerp(white, lerpAmount)
	else
		return error("hey its not white or black")
	end
end
end)() end,
    [101] = function()local wax,script,require=ImportGlobals(101)local ImportGlobals return (function(...)return function(Color1, Color2)
    if Color1.R == Color2.R and Color1.G == Color2.G and Color1.B == Color2.B then
        return true
    end
    return false
end
end)() end,
    [102] = function()local wax,script,require=ImportGlobals(102)local ImportGlobals return (function(...)local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end
local function randomString(length)
    if length > 0 then
        return randomString(length - 1) .. charset[math.random(1, #charset)]
    else
        return ""
    end
end
return randomString
end)() end,
    [103] = function()local wax,script,require=ImportGlobals(103)local ImportGlobals return (function(...)local references = {}
local returnFunctions = {}
local observe = require(script.Parent.Parent.Bundles.Fusion).Observer

local get = require(script.Parent.get)

function returnFunctions.add(REF)
    if typeof(get(REF)) ~= "Instance" then
        observe(REF):onChange(function()
            if typeof(get(REF)) == "Instance" then
                if not references[get(REF).Name] then
                    references[get(REF).Name] = get(REF)
                else
                    warn(get(REF).Name, " REF was already added")
                end
            end
        end)
    else
        if not references[get(REF).Name] then
            references[get(REF).Name] = get(REF)
        else
            warn(get(REF).Name, " REF was already added")
        end
    end
end
function returnFunctions.get(name)
    if references[name] then
        return references[name]
    end
end
function returnFunctions.remove(name)
    if references[name] then
        references[name] = nil
    else
        warn(name, "isn't in the references list")
    end
end
function returnFunctions.clear()
    for i,v in references do
        references[i] = nil
        if typeof(v) == "Instance" then
            v:Destroy()
        end
    end
end

return returnFunctions
end)() end,
    [104] = function()local wax,script,require=ImportGlobals(104)local ImportGlobals return (function(...)local Fusion = require(script.Parent.Parent.Bundles.Fusion)
local computed = Fusion.Computed

return function(callback,style)
	return Fusion.Tween(computed(callback), style)
end
end)() end
} -- [RefId] = Closure

-- Holds the actual DOM data
local ObjectTree = {
    {
        1,
        2,
        {
            "quake"
        },
        {
            {
                93,
                1,
                {
                    "utilities"
                },
                {
                    {
                        94,
                        2,
                        {
                            "animate"
                        }
                    },
                    {
                        100,
                        2,
                        {
                            "lerpColor"
                        }
                    },
                    {
                        103,
                        2,
                        {
                            "references"
                        }
                    },
                    {
                        96,
                        2,
                        {
                            "customFunctions"
                        }
                    },
                    {
                        95,
                        2,
                        {
                            "connections"
                        }
                    },
                    {
                        97,
                        2,
                        {
                            "drag"
                        }
                    },
                    {
                        98,
                        2,
                        {
                            "get"
                        }
                    },
                    {
                        104,
                        2,
                        {
                            "tween"
                        }
                    },
                    {
                        101,
                        2,
                        {
                            "matchColors"
                        }
                    },
                    {
                        102,
                        2,
                        {
                            "randomString"
                        }
                    },
                    {
                        99,
                        2,
                        {
                            "getStringBounds"
                        }
                    }
                }
            },
            {
                73,
                1,
                {
                    "components"
                },
                {
                    {
                        87,
                        2,
                        {
                            "newWindow"
                        }
                    },
                    {
                        79,
                        2,
                        {
                            "newLabel"
                        }
                    },
                    {
                        75,
                        2,
                        {
                            "newColorPicker"
                        }
                    },
                    {
                        86,
                        2,
                        {
                            "newToggle"
                        }
                    },
                    {
                        82,
                        2,
                        {
                            "newSection"
                        }
                    },
                    {
                        85,
                        2,
                        {
                            "newTextBox"
                        }
                    },
                    {
                        80,
                        2,
                        {
                            "newNotification"
                        }
                    },
                    {
                        84,
                        2,
                        {
                            "newTab"
                        }
                    },
                    {
                        83,
                        2,
                        {
                            "newSlider"
                        }
                    },
                    {
                        81,
                        2,
                        {
                            "newParagraph"
                        }
                    },
                    {
                        77,
                        2,
                        {
                            "newGroup"
                        }
                    },
                    {
                        76,
                        2,
                        {
                            "newDropdown"
                        }
                    },
                    {
                        78,
                        2,
                        {
                            "newKeybind"
                        }
                    },
                    {
                        74,
                        2,
                        {
                            "newButton"
                        }
                    }
                }
            },
            {
                92,
                2,
                {
                    "project.story"
                }
            },
            {
                88,
                1,
                {
                    "platforms"
                },
                {
                    {
                        90,
                        2,
                        {
                            "mobile"
                        }
                    },
                    {
                        89,
                        2,
                        {
                            "computer"
                        }
                    }
                }
            },
            {
                91,
                2,
                {
                    "preservedConfig"
                }
            },
            {
                2,
                1,
                {
                    "Bundles"
                },
                {
                    {
                        57,
                        2,
                        {
                            "betterMathModule"
                        },
                        {
                            {
                                63,
                                3,
                                {
                                    "CLASS_Notation"
                                }
                            },
                            {
                                60,
                                3,
                                {
                                    "CLASS_String"
                                }
                            },
                            {
                                62,
                                3,
                                {
                                    "CLASS_Check"
                                }
                            },
                            {
                                61,
                                3,
                                {
                                    "CLASS_Convert"
                                }
                            },
                            {
                                59,
                                3,
                                {
                                    "CLASS_Sequence"
                                }
                            },
                            {
                                64,
                                3,
                                {
                                    "CLASS_Matrix"
                                }
                            },
                            {
                                65,
                                3,
                                {
                                    "CLASS_Random"
                                }
                            },
                            {
                                67,
                                3,
                                {
                                    "CLASS_Chance"
                                }
                            },
                            {
                                58,
                                3,
                                {
                                    "CLASS_Value"
                                }
                            },
                            {
                                66,
                                3,
                                {
                                    "Class_Special"
                                }
                            }
                        }
                    },
                    {
                        69,
                        2,
                        {
                            "icons"
                        }
                    },
                    {
                        71,
                        2,
                        {
                            "themeSystem"
                        },
                        {
                            {
                                72,
                                2,
                                {
                                    "default"
                                }
                            }
                        }
                    },
                    {
                        68,
                        2,
                        {
                            "data"
                        }
                    },
                    {
                        70,
                        2,
                        {
                            "services"
                        }
                    },
                    {
                        3,
                        2,
                        {
                            "Fusion"
                        },
                        {
                            {
                                40,
                                1,
                                {
                                    "State"
                                },
                                {
                                    {
                                        47,
                                        2,
                                        {
                                            "unwrap"
                                        }
                                    },
                                    {
                                        44,
                                        2,
                                        {
                                            "ForValues"
                                        }
                                    },
                                    {
                                        46,
                                        2,
                                        {
                                            "Value"
                                        }
                                    },
                                    {
                                        41,
                                        2,
                                        {
                                            "Computed"
                                        }
                                    },
                                    {
                                        42,
                                        2,
                                        {
                                            "ForKeys"
                                        }
                                    },
                                    {
                                        45,
                                        2,
                                        {
                                            "Observer"
                                        }
                                    },
                                    {
                                        43,
                                        2,
                                        {
                                            "ForPairs"
                                        }
                                    }
                                }
                            },
                            {
                                22,
                                1,
                                {
                                    "Instances"
                                },
                                {
                                    {
                                        29,
                                        2,
                                        {
                                            "Out"
                                        }
                                    },
                                    {
                                        23,
                                        2,
                                        {
                                            "Children"
                                        }
                                    },
                                    {
                                        27,
                                        2,
                                        {
                                            "OnChange"
                                        }
                                    },
                                    {
                                        28,
                                        2,
                                        {
                                            "OnEvent"
                                        }
                                    },
                                    {
                                        31,
                                        2,
                                        {
                                            "applyInstanceProps"
                                        }
                                    },
                                    {
                                        25,
                                        2,
                                        {
                                            "Hydrate"
                                        }
                                    },
                                    {
                                        32,
                                        2,
                                        {
                                            "defaultProps"
                                        }
                                    },
                                    {
                                        30,
                                        2,
                                        {
                                            "Ref"
                                        }
                                    },
                                    {
                                        24,
                                        2,
                                        {
                                            "Cleanup"
                                        }
                                    },
                                    {
                                        26,
                                        2,
                                        {
                                            "New"
                                        }
                                    }
                                }
                            },
                            {
                                33,
                                1,
                                {
                                    "Logging"
                                },
                                {
                                    {
                                        35,
                                        2,
                                        {
                                            "logErrorNonFatal"
                                        }
                                    },
                                    {
                                        36,
                                        2,
                                        {
                                            "logWarn"
                                        }
                                    },
                                    {
                                        38,
                                        2,
                                        {
                                            "parseError"
                                        }
                                    },
                                    {
                                        37,
                                        2,
                                        {
                                            "messages"
                                        }
                                    },
                                    {
                                        34,
                                        2,
                                        {
                                            "logError"
                                        }
                                    }
                                }
                            },
                            {
                                39,
                                2,
                                {
                                    "PubTypes"
                                }
                            },
                            {
                                16,
                                1,
                                {
                                    "Dependencies"
                                },
                                {
                                    {
                                        20,
                                        2,
                                        {
                                            "updateAll"
                                        }
                                    },
                                    {
                                        17,
                                        2,
                                        {
                                            "captureDependencies"
                                        }
                                    },
                                    {
                                        19,
                                        2,
                                        {
                                            "sharedState"
                                        }
                                    },
                                    {
                                        21,
                                        2,
                                        {
                                            "useDependency"
                                        }
                                    },
                                    {
                                        18,
                                        2,
                                        {
                                            "initDependency"
                                        }
                                    }
                                }
                            },
                            {
                                49,
                                1,
                                {
                                    "Utility"
                                },
                                {
                                    {
                                        52,
                                        2,
                                        {
                                            "doNothing"
                                        }
                                    },
                                    {
                                        51,
                                        2,
                                        {
                                            "cleanup"
                                        }
                                    },
                                    {
                                        54,
                                        2,
                                        {
                                            "needsDestruction"
                                        }
                                    },
                                    {
                                        53,
                                        2,
                                        {
                                            "isSimilar"
                                        }
                                    },
                                    {
                                        56,
                                        2,
                                        {
                                            "xtypeof"
                                        }
                                    },
                                    {
                                        55,
                                        2,
                                        {
                                            "restrictRead"
                                        }
                                    },
                                    {
                                        50,
                                        2,
                                        {
                                            "None"
                                        }
                                    }
                                }
                            },
                            {
                                4,
                                1,
                                {
                                    "Animation"
                                },
                                {
                                    {
                                        9,
                                        2,
                                        {
                                            "getTweenRatio"
                                        }
                                    },
                                    {
                                        6,
                                        2,
                                        {
                                            "SpringScheduler"
                                        }
                                    },
                                    {
                                        7,
                                        2,
                                        {
                                            "Tween"
                                        }
                                    },
                                    {
                                        5,
                                        2,
                                        {
                                            "Spring"
                                        }
                                    },
                                    {
                                        12,
                                        2,
                                        {
                                            "springCoefficients"
                                        }
                                    },
                                    {
                                        10,
                                        2,
                                        {
                                            "lerpType"
                                        }
                                    },
                                    {
                                        8,
                                        2,
                                        {
                                            "TweenScheduler"
                                        }
                                    },
                                    {
                                        13,
                                        2,
                                        {
                                            "unpackType"
                                        }
                                    },
                                    {
                                        11,
                                        2,
                                        {
                                            "packType"
                                        }
                                    }
                                }
                            },
                            {
                                48,
                                2,
                                {
                                    "Types"
                                }
                            },
                            {
                                14,
                                1,
                                {
                                    "Colour"
                                },
                                {
                                    {
                                        15,
                                        2,
                                        {
                                            "Oklab"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

-- Line offsets for debugging (only included when minifyTables is false)
local LineOffsets = {
    8,
    [3] = 183,
    [5] = 257,
    [6] = 475,
    [7] = 568,
    [8] = 704,
    [9] = 779,
    [10] = 822,
    [11] = 984,
    [12] = 1083,
    [13] = 1169,
    [15] = 1258,
    [17] = 1313,
    [18] = 1370,
    [19] = 1399,
    [20] = 1423,
    [21] = 1483,
    [23] = 1513,
    [24] = 1662,
    [25] = 1683,
    [26] = 1703,
    [27] = 1739,
    [28] = 1774,
    [29] = 1811,
    [30] = 1855,
    [31] = 1885,
    [32] = 2012,
    [34] = 2123,
    [35] = 2156,
    [36] = 2191,
    [37] = 2215,
    [38] = 2261,
    [39] = 2284,
    [41] = 2431,
    [42] = 2545,
    [43] = 2794,
    [44] = 3104,
    [45] = 3351,
    [46] = 3435,
    [47] = 3498,
    [48] = 3514,
    [50] = 3661,
    [51] = 3675,
    [52] = 3729,
    [53] = 3740,
    [54] = 3758,
    [55] = 3771,
    [56] = 3800,
    [57] = 3820,
    [68] = 5202,
    [69] = 5282,
    [70] = 5293,
    [71] = 5305,
    [72] = 5373,
    [74] = 5384,
    [75] = 5574,
    [76] = 6237,
    [77] = 6759,
    [78] = 7020,
    [79] = 7260,
    [80] = 7334,
    [81] = 7532,
    [82] = 7666,
    [83] = 7730,
    [84] = 8077,
    [85] = 8232,
    [86] = 8535,
    [87] = 8752,
    [89] = 8806,
    [90] = 9191,
    [91] = 9502,
    [92] = 9513,
    [94] = 9733,
    [95] = 9740,
    [96] = 9759,
    [97] = 9772,
    [98] = 9818,
    [99] = 9825,
    [100] = 9836,
    [101] = 9850,
    [102] = 9857,
    [103] = 9870,
    [104] = 9918
}

-- Misc AOT variable imports
local WaxVersion = "0.4.1"
local EnvName = "WaxRuntime"

-- ++++++++ RUNTIME IMPL BELOW ++++++++ --

-- Localizing certain libraries and built-ins for runtime efficiency
local string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION =
      string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION

local table_insert = table.insert
local table_remove = table.remove
local table_freeze = table.freeze or function(t) return t end -- lol

local coroutine_wrap = coroutine.wrap

local string_sub = string.sub
local string_match = string.match
local string_gmatch = string.gmatch

-- The Lune runtime has its own `task` impl, but it must be imported by its builtin
-- module path, "@lune/task"
if _VERSION and string_sub(_VERSION, 1, 4) == "Lune" then
    local RequireSuccess, LuneTaskLib = pcall(require, "@lune/task")
    if RequireSuccess and LuneTaskLib then
        task = LuneTaskLib
    end
end

local task_defer = task and task.defer

-- If we're not running on the Roblox engine, we won't have a `task` global
local Defer = task_defer or function(f, ...)
    coroutine_wrap(f)(...)
end

-- ClassName "IDs"
local ClassNameIdBindings = {
    [1] = "Folder",
    [2] = "ModuleScript",
    [3] = "Script",
    [4] = "LocalScript",
    [5] = "StringValue",
}

local RefBindings = {} -- [RefId] = RealObject

local ScriptClosures = {}
local ScriptClosureRefIds = {} -- [ScriptClosure] = RefId
local StoredModuleValues = {}
local ScriptsToRun = {}

-- wax.shared __index/__newindex
local SharedEnvironment = {}

-- We're creating 'fake' instance refs soley for traversal of the DOM for require() compatibility
-- It's meant to be as lazy as possible
local RefChildren = {} -- [Ref] = {ChildrenRef, ...}

-- Implemented instance methods
local InstanceMethods = {
    GetFullName = { {}, function(self)
        local Path = self.Name
        local ObjectPointer = self.Parent

        while ObjectPointer do
            Path = ObjectPointer.Name .. "." .. Path

            -- Move up the DOM (parent will be nil at the end, and this while loop will stop)
            ObjectPointer = ObjectPointer.Parent
        end

        return Path
    end},

    GetChildren = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)
        end

        return ReturnArray
    end},

    GetDescendants = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)

            for _, Descendant in next, Child:GetDescendants() do
                table_insert(ReturnArray, Descendant)
            end
        end

        return ReturnArray
    end},

    FindFirstChild = { {"string", "boolean?"}, function(self, name, recursive)
        local Children = RefChildren[self]

        for Child in next, Children do
            if Child.Name == name then
                return Child
            end
        end

        if recursive then
            for Child in next, Children do
                -- Yeah, Roblox follows this behavior- instead of searching the entire base of a
                -- ref first, the engine uses a direct recursive call
                return Child:FindFirstChild(name, true)
            end
        end
    end},

    FindFirstAncestor = { {"string"}, function(self, name)
        local RefPointer = self.Parent
        while RefPointer do
            if RefPointer.Name == name then
                return RefPointer
            end

            RefPointer = RefPointer.Parent
        end
    end},

    -- Just to implement for traversal usage
    WaitForChild = { {"string", "number?"}, function(self, name)
        return self:FindFirstChild(name)
    end},
}

-- "Proxies" to instance methods, with err checks etc
local InstanceMethodProxies = {}
for MethodName, MethodObject in next, InstanceMethods do
    local Types = MethodObject[1]
    local Method = MethodObject[2]

    local EvaluatedTypeInfo = {}
    for ArgIndex, TypeInfo in next, Types do
        local ExpectedType, IsOptional = string_match(TypeInfo, "^([^%?]+)(%??)")
        EvaluatedTypeInfo[ArgIndex] = {ExpectedType, IsOptional}
    end

    InstanceMethodProxies[MethodName] = function(self, ...)
        if not RefChildren[self] then
            error("Expected ':' not '.' calling member function " .. MethodName, 2)
        end

        local Args = {...}
        for ArgIndex, TypeInfo in next, EvaluatedTypeInfo do
            local RealArg = Args[ArgIndex]
            local RealArgType = type(RealArg)
            local ExpectedType, IsOptional = TypeInfo[1], TypeInfo[2]

            if RealArg == nil and not IsOptional then
                error("Argument " .. RealArg .. " missing or nil", 3)
            end

            if ExpectedType ~= "any" and RealArgType ~= ExpectedType and not (RealArgType == "nil" and IsOptional) then
                error("Argument " .. ArgIndex .. " expects type \"" .. ExpectedType .. "\", got \"" .. RealArgType .. "\"", 2)
            end
        end

        return Method(self, ...)
    end
end

local function CreateRef(className, name, parent)
    -- `name` and `parent` can also be set later by the init script if they're absent

    -- Extras
    local StringValue_Value

    -- Will be set to RefChildren later aswell
    local Children = setmetatable({}, {__mode = "k"})

    -- Err funcs
    local function InvalidMember(member)
        error(member .. " is not a valid (virtual) member of " .. className .. " \"" .. name .. "\"", 3)
    end
    local function ReadOnlyProperty(property)
        error("Unable to assign (virtual) property " .. property .. ". Property is read only", 3)
    end

    local Ref = {}
    local RefMetatable = {}

    RefMetatable.__metatable = false

    RefMetatable.__index = function(_, index)
        if index == "ClassName" then -- First check "properties"
            return className
        elseif index == "Name" then
            return name
        elseif index == "Parent" then
            return parent
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            return StringValue_Value
        else -- Lastly, check "methods"
            local InstanceMethod = InstanceMethodProxies[index]

            if InstanceMethod then
                return InstanceMethod
            end
        end

        -- Next we'll look thru child refs
        for Child in next, Children do
            if Child.Name == index then
                return Child
            end
        end

        -- At this point, no member was found; this is the same err format as Roblox
        InvalidMember(index)
    end

    RefMetatable.__newindex = function(_, index, value)
        -- __newindex is only for props fyi
        if index == "ClassName" then
            ReadOnlyProperty(index)
        elseif index == "Name" then
            name = value
        elseif index == "Parent" then
            -- We'll just ignore the process if it's trying to set itself
            if value == Ref then
                return
            end

            if parent ~= nil then
                -- Remove this ref from the CURRENT parent
                RefChildren[parent][Ref] = nil
            end

            parent = value

            if value ~= nil then
                -- And NOW we're setting the new parent
                RefChildren[value][Ref] = true
            end
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            StringValue_Value = value
        else
            -- Same err as __index when no member is found
            InvalidMember(index)
        end
    end

    RefMetatable.__tostring = function()
        return name
    end

    setmetatable(Ref, RefMetatable)

    RefChildren[Ref] = Children

    if parent ~= nil then
        RefChildren[parent][Ref] = true
    end

    return Ref
end

-- Create real ref DOM from object tree
local function CreateRefFromObject(object, parent)
    local RefId = object[1]
    local ClassNameId = object[2]
    local Properties = object[3] -- Optional
    local Children = object[4] -- Optional

    local ClassName = ClassNameIdBindings[ClassNameId]

    local Name = Properties and table_remove(Properties, 1) or ClassName

    local Ref = CreateRef(ClassName, Name, parent) -- 3rd arg may be nil if this is from root
    RefBindings[RefId] = Ref

    if Properties then
        for PropertyName, PropertyValue in next, Properties do
            Ref[PropertyName] = PropertyValue
        end
    end

    if Children then
        for _, ChildObject in next, Children do
            CreateRefFromObject(ChildObject, Ref)
        end
    end

    return Ref
end

local RealObjectRoot = CreateRef("Folder", "[" .. EnvName .. "]")
for _, Object in next, ObjectTree do
    CreateRefFromObject(Object, RealObjectRoot)
end

-- Now we'll set script closure refs and check if they should be ran as a BaseScript
for RefId, Closure in next, ClosureBindings do
    local Ref = RefBindings[RefId]

    ScriptClosures[Ref] = Closure
    ScriptClosureRefIds[Ref] = RefId

    local ClassName = Ref.ClassName
    if ClassName == "LocalScript" or ClassName == "Script" then
        table_insert(ScriptsToRun, Ref)
    end
end

local function LoadScript(scriptRef)
    local ScriptClassName = scriptRef.ClassName

    -- First we'll check for a cached module value (packed into a tbl)
    local StoredModuleValue = StoredModuleValues[scriptRef]
    if StoredModuleValue and ScriptClassName == "ModuleScript" then
        return unpack(StoredModuleValue)
    end

    local Closure = ScriptClosures[scriptRef]

    local function FormatError(originalErrorMessage)
        originalErrorMessage = tostring(originalErrorMessage)

        local VirtualFullName = scriptRef:GetFullName()

        -- Check for vanilla/Roblox format
        local OriginalErrorLine, BaseErrorMessage = string_match(originalErrorMessage, "[^:]+:(%d+): (.+)")

        if not OriginalErrorLine or not LineOffsets then
            return VirtualFullName .. ":*: " .. (BaseErrorMessage or originalErrorMessage)
        end

        OriginalErrorLine = tonumber(OriginalErrorLine)

        local RefId = ScriptClosureRefIds[scriptRef]
        local LineOffset = LineOffsets[RefId]

        local RealErrorLine = OriginalErrorLine - LineOffset + 1
        if RealErrorLine < 0 then
            RealErrorLine = "?"
        end

        return VirtualFullName .. ":" .. RealErrorLine .. ": " .. BaseErrorMessage
    end

    -- If it's a BaseScript, we'll just run it directly!
    if ScriptClassName == "LocalScript" or ScriptClassName == "Script" then
        local RunSuccess, ErrorMessage = pcall(Closure)
        if not RunSuccess then
            error(FormatError(ErrorMessage), 0)
        end
    else
        local PCallReturn = {pcall(Closure)}

        local RunSuccess = table_remove(PCallReturn, 1)
        if not RunSuccess then
            local ErrorMessage = table_remove(PCallReturn, 1)
            error(FormatError(ErrorMessage), 0)
        end

        StoredModuleValues[scriptRef] = PCallReturn
        return unpack(PCallReturn)
    end
end

-- We'll assign the actual func from the top of this output for flattening user globals at runtime
-- Returns (in a tuple order): wax, script, require
function ImportGlobals(refId)
    local ScriptRef = RefBindings[refId]

    local function RealCall(f, ...)
        local PCallReturn = {pcall(f, ...)}

        local CallSuccess = table_remove(PCallReturn, 1)
        if not CallSuccess then
            error(PCallReturn[1], 3)
        end

        return unpack(PCallReturn)
    end

    -- `wax.shared` index
    local WaxShared = table_freeze(setmetatable({}, {
        __index = SharedEnvironment,
        __newindex = function(_, index, value)
            SharedEnvironment[index] = value
        end,
        __len = function()
            return #SharedEnvironment
        end,
        __iter = function()
            return next, SharedEnvironment
        end,
    }))

    local Global_wax = table_freeze({
        -- From AOT variable imports
        version = WaxVersion,
        envname = EnvName,

        shared = WaxShared,

        -- "Real" globals instead of the env set ones
        script = script,
        require = require,
    })

    local Global_script = ScriptRef

    local function Global_require(module, ...)
        local ModuleArgType = type(module)

        local ErrorNonModuleScript = "Attempted to call require with a non-ModuleScript"
        local ErrorSelfRequire = "Attempted to call require with self"

        if ModuleArgType == "table" and RefChildren[module]  then
            if module.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif module == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(module)
        elseif ModuleArgType == "string" and string_sub(module, 1, 1) ~= "@" then
            -- The control flow on this SUCKS

            if #module == 0 then
                error("Attempted to call require with empty string", 2)
            end

            local CurrentRefPointer = ScriptRef

            if string_sub(module, 1, 1) == "/" then
                CurrentRefPointer = RealObjectRoot
            elseif string_sub(module, 1, 2) == "./" then
                module = string_sub(module, 3)
            end

            local PreviousPathMatch
            for PathMatch in string_gmatch(module, "([^/]*)/?") do
                local RealIndex = PathMatch
                if PathMatch == ".." then
                    RealIndex = "Parent"
                end

                -- Don't advance dir if it's just another "/" either
                if RealIndex ~= "" then
                    local ResultRef = CurrentRefPointer:FindFirstChild(RealIndex)
                    if not ResultRef then
                        local CurrentRefParent = CurrentRefPointer.Parent
                        if CurrentRefParent then
                            ResultRef = CurrentRefParent:FindFirstChild(RealIndex)
                        end
                    end

                    if ResultRef then
                        CurrentRefPointer = ResultRef
                    elseif PathMatch ~= PreviousPathMatch and PathMatch ~= "init" and PathMatch ~= "init.server" and PathMatch ~= "init.client" then
                        error("Virtual script path \"" .. module .. "\" not found", 2)
                    end
                end

                -- For possible checks next cycle
                PreviousPathMatch = PathMatch
            end

            if CurrentRefPointer.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif CurrentRefPointer == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(CurrentRefPointer)
        end

        return RealCall(require, module, ...)
    end

    -- Now, return flattened globals ready for direct runtime exec
    return Global_wax, Global_script, Global_require
end

for _, ScriptRef in next, ScriptsToRun do
    Defer(LoadScript, ScriptRef)
end

-- AoT adjustment: Load init module (MainModule behavior)
return LoadScript(RealObjectRoot:GetChildren()[1])