local Creator = require("../../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

-- local Window
-- local WindUI

local DialogModule = {
	Holder = nil,
	--Window = nil,
	Parent = nil,
}

function DialogModule.Create(Key, Type, Window, WindUI, Parent)
	local Dialog = {
		UICorner = 28,
		UIPadding = 12,

		Window = Window,
		WindUI = WindUI,

		UIElements = {},
	}

	if Key then
		Dialog.UIPadding = 0
	end -- 16
	if Key then
		Dialog.UICorner = 26
	end

	Type = Type or "Dialog"

	if not Key then
		Dialog.UIElements.FullScreen = New("Frame", {
			ZIndex = 999,
			BackgroundTransparency = 1, -- 0.65
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 1, 0),
			Active = false, -- true
			Visible = false, -- true
			Parent = DialogModule.Parent
				or (Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main),
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0, (Window and Window.UICorner) or 16),
			}),
		})
	end

	local Blur = New("ImageLabel", { -- Shadow
		Image = "rbxassetid://8992230677",
		ThemeTag = {
			ImageColor3 = "WindowShadow",
			--ImageTransparency = "WindowShadowTransparency",
		},
		ImageTransparency = 1, -- .7
		Size = UDim2.new(1, 100, 1, 100),
		Position = UDim2.new(0, -100 / 2, 0, -100 / 2),
		ScaleType = "Slice",
		SliceCenter = Rect.new(99, 99, 99, 99),
		BackgroundTransparency = 1,
		ZIndex = -999999999999999,
		Name = "Blur",
	})

	Dialog.UIElements.Main = New("Frame", {
		Size = UDim2.new(0, 280, 0, 0),
		ThemeTag = {
			BackgroundColor3 = Type .. "Background",
		},
		AutomaticSize = "Y",
		BackgroundTransparency = 1, -- .7
		Visible = false,
		ZIndex = 99999,
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, Dialog.UIPadding),
			PaddingLeft = UDim.new(0, Dialog.UIPadding),
			PaddingRight = UDim.new(0, Dialog.UIPadding),
			PaddingBottom = UDim.new(0, Dialog.UIPadding),
		}),
	})

	Dialog.UIElements.MainContainer = Creator.NewRoundFrame(Dialog.UICorner, "Squircle", {
		Visible = false, -- true
		--GroupTransparency = 1, -- 0
		ImageTransparency = 0.15,
		Parent = Parent or Dialog.UIElements.FullScreen,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = "XY",
		ThemeTag = {
			ImageColor3 = Type .. "Background",
			ImageTransparency = Type .. "BackgroundTransparency",
		},
		ZIndex = 9999,
	}, {
		--[[Creator.NewRoundFrame(Dialog.UICorner, "SquircleGlass", {
			ImageTransparency = 0.92,
			Size = UDim2.new(1, 2, 1, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
		}),]]
		Dialog.UIElements.Main,

		-- New("UIScale", {
		--     Scale = .9
		-- }),
		-- Creator.NewRoundFrame(Dialog.UICorner, "SquircleOutline2", {
		--     Size = UDim2.new(1,0,1,0),
		--     ImageTransparency = 1,
		--     ThemeTag = {
		--         ImageColor3 = "Outline",
		--     },
		-- }, {
		--     New("UIGradient", {
		--         Rotation = 45,
		--         Transparency = NumberSequence.new({
		--             NumberSequenceKeypoint.new(0, 0.55),
		--             NumberSequenceKeypoint.new(0.5, 0.8),
		--             NumberSequenceKeypoint.new(1, 0.6)
		--         })
		--     })
		-- })
	})

	function Dialog:Open(duration)
		duration = duration or 0.35
		local mainContainer = Dialog.UIElements.MainContainer
		if not mainContainer then return end

		if not Key and Dialog.UIElements.FullScreen then
			Dialog.UIElements.FullScreen.Visible = true
			Dialog.UIElements.FullScreen.Active = true
			Dialog.UIElements.FullScreen.BackgroundTransparency = 1
			Tween(Dialog.UIElements.FullScreen, duration, { BackgroundTransparency = 0.65 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
		end

		local uiScale = mainContainer:FindFirstChildOfClass("UIScale")
		if not uiScale then
			uiScale = Instance.new("UIScale")
			uiScale.Name = "DialogScale"
			uiScale.Parent = mainContainer
		end

		uiScale.Scale = 0.88
		mainContainer.Visible = true
		Dialog.UIElements.Main.Visible = true

		Tween(uiScale, duration, { Scale = 1.0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		local targetBgTrans = 0.15
		mainContainer.ImageTransparency = 1
		Tween(mainContainer, duration, { ImageTransparency = targetBgTrans }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()

		for _, child in ipairs(mainContainer:GetDescendants()) do
			if child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("TextButton") then
				local startTrans = child.TextTransparency
				child.TextTransparency = 1
				Tween(child, duration, { TextTransparency = startTrans }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
			elseif child:IsA("ImageLabel") and child ~= mainContainer then
				local startTrans = child.ImageTransparency
				child.ImageTransparency = 1
				Tween(child, duration, { ImageTransparency = startTrans }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
			end
		end
	end

	function Dialog:Close()
		return Dialog:GenieClose(0.35)
	end

	function Dialog:CollapseClose()
		return Dialog:GenieClose(0.35)
	end

	function Dialog:GenieClose(duration)
		duration = duration or 0.35
		local mainContainer = Dialog.UIElements.MainContainer
		local fullScreen = Dialog.UIElements.FullScreen

		if not mainContainer or not mainContainer.Parent then
			return function() end
		end

		if not Key and fullScreen then
			fullScreen.Active = false
			Tween(fullScreen, duration, { BackgroundTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
		end

		local uiScale = mainContainer:FindFirstChildOfClass("UIScale")
		if not uiScale then
			uiScale = Instance.new("UIScale")
			uiScale.Name = "DialogScale"
			uiScale.Parent = mainContainer
		end

		Tween(uiScale, duration, { Scale = 0.88 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
		Tween(mainContainer, duration, { ImageTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()

		for _, child in ipairs(mainContainer:GetDescendants()) do
			if child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("TextButton") then
				Tween(child, duration, { TextTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
			elseif child:IsA("ImageLabel") and child ~= mainContainer then
				Tween(child, duration, { ImageTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
			end
		end

		task.spawn(function()
			task.wait(duration + 0.05)
			if not Key and fullScreen then
				pcall(function() fullScreen:Destroy() end)
			else
				pcall(function() mainContainer:Destroy() end)
			end
		end)

		return function() end
	end

	--Dialog:Open()
	return Dialog
end

return DialogModule
