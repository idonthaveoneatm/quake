local cF = require(script.Parent.Parent.utilities.customFunctions)
local cloneref = cF.cloneref

local services = {}

services.UserInputService = cloneref(game:GetService("UserInputService"))
services.RunService = cloneref(game:GetService("RunService"))
services.TextService = cloneref(game:GetService("TextService"))
services.ContextActionService = cloneref(game:GetService("ContextActionService"))

return services