local rbxmSuite = loadstring(game:HttpGetAsync("https://github.com/richie0866/rbxm-suite/releases/latest/download/rbxm-suite.lua"))()
local path = rbxmSuite.download("idonthaveoneatm/quake@latest", "quake.rbxm")
local model = rbxmSuite.launch(path)
return rbxmSuite.require(model)
