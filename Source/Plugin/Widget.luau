local GetPlugin = require("../Lib/GetPlugin")

local plugin = GetPlugin

local module = {}

local colourSyncTargets: {GuiObject} = {}

local widget = plugin:CreateDockWidgetPluginGui("ClassConvert", DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	true,
	600,
	400,
	600,
	400
	)
)

widget.Name = "Plugin Template"
widget.Title = "Plugin Template"
widget.ResetOnSpawn = false
widget.Enabled = false

local frame = Instance.new("Frame")
frame.Transparency = 1
frame.Size = UDim2.fromScale(1, 1)

do
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0.025, 0)
	padding.PaddingRight = UDim.new(0.025, 0)
	padding.PaddingTop = UDim.new(0.025, 0)
	padding.Parent = frame
end

local function syncOne(v: GuiObject, theme: StudioTheme)
	
end

local function syncColours()
	local theme = settings().Studio.Theme
	for _, v in colourSyncTargets do
		syncOne(v, theme)
	end
end

syncColours()
settings().Studio.ThemeChanged:Connect(syncColours)

function module.ToggleWidget(enabled: boolean?): ()
	widget.Enabled = if typeof(enabled) == "boolean" then enabled else not widget.Enabled
end

module.Widget = widget

return module