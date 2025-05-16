local RunService = game:GetService("RunService")

if not RunService:IsEdit() then
	return
end

local Toolbar = require("./Plugin/Toolbar")

local enabled = plugin:GetSetting("Enabled")

local function getIcon(): string
    return if enabled then "rbxassetid://18846472886" else "rbxassetid://18846474678"
end

Toolbar.Button.Icon = getIcon()

Toolbar.OnClick = function()
	enabled = not enabled

	plugin:SetSetting("Enabled", enabled)
    Toolbar.Button.Icon = getIcon()

    print(if enabled then "Enabled auto anchor" else "Disabled auto anchor")
end

workspace.DescendantAdded:Connect(function(c)
    if enabled and c:IsA("BasePart") then
        c.Anchored = true
    end
end)