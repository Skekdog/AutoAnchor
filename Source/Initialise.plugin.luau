local RunService = game:GetService("RunService")

if RunService:IsRunning() then
	return
end

local Toolbar = require("./Plugin/Toolbar")

Toolbar.OnClick = function()
	print("Button Clicked")
end