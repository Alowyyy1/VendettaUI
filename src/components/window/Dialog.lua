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
				CornerRadius = UDim.new(0, Window.UICorner),
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
		ImageTransparency = Key and 0.15 or 0,
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

	function Dialog:Open()
		if not Key then
			Dialog.UIElements.FullScreen.Visible = true
			Dialog.UIElements.FullScreen.Active = true
		end

		task.spawn(function()
			Dialog.UIElements.MainContainer.Visible = true

			if not Key then
				Tween(Dialog.UIElements.FullScreen, 0.1, { BackgroundTransparency = 0.65 }):Play()
			end
			Tween(Dialog.UIElements.MainContainer, 0.1, { ImageTransparency = 0 }):Play()
			--Tween(Dialog.UIElements.MainContainer.UIScale, 0.1, {Scale = 1}):Play()
			--Tween(Dialog.UIElements.MainContainer.UIStroke, 0.1, {Transparency = 1}):Play()
			task.spawn(function()
				task.wait(0.05)
				Dialog.UIElements.Main.Visible = true
			end)
		end)
	end
	function Dialog:Close()
		if not Key then
			Tween(Dialog.UIElements.FullScreen, 0.1, { BackgroundTransparency = 1 }):Play()
			Dialog.UIElements.FullScreen.Active = false
			task.spawn(function()
				task.wait(0.1)
				Dialog.UIElements.FullScreen.Visible = false
			end)
		end
		Dialog.UIElements.Main.Visible = false

		Tween(Dialog.UIElements.MainContainer, 0.1, { ImageTransparency = 1 }):Play()
		--Tween(Dialog.UIElements.MainContainer.UIScale, 0.1, {Scale = .9}):Play()
		--Tween(Dialog.UIElements.MainContainer.UIStroke, 0.1, {Transparency = 1}):Play()

		task.spawn(function()
			task.wait(0.1)
			if not Key then
				Dialog.UIElements.FullScreen:Destroy()
			else
				Dialog.UIElements.MainContainer:Destroy()
			end
		end)

		return function() end
	end

	function Dialog:CollapseClose()
		return Dialog:GenieClose(0.6)
	end

	function Dialog:GenieClose(duration)
		duration = duration or 0.6
		local RunService = cloneref(game:GetService("RunService"))
		local mainContainer = Dialog.UIElements.MainContainer
		local fullScreen = Dialog.UIElements.FullScreen

		if not mainContainer or not mainContainer.Parent then
			return function() end
		end

		local startPos = mainContainer.Position
		local startSize = mainContainer.Size
		local startAnchor = mainContainer.AnchorPoint

		local function EaseInOutQuad(t)
			return t < 0.5 and (2 * t * t) or (1 - math.pow(-2 * t + 2, 2) / 2)
		end

		if not Key and fullScreen then
			fullScreen.Active = false
			Tween(fullScreen, duration, { BackgroundTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut):Play()
		end

		local elapsedTime = 0
		local connection

		connection = RunService.RenderStepped:Connect(function(deltaTime)
			elapsedTime = elapsedTime + deltaTime
			local linearProgress = math.clamp(elapsedTime / duration, 0, 1)
			local p = EaseInOutQuad(linearProgress)

			local curPosY = (startPos.Y.Scale * (1 - p)) + (0.0 * p)
			local curAnchorY = (startAnchor.Y * (1 - p)) + (0.0 * p)
			mainContainer.AnchorPoint = Vector2.new(0.5, curAnchorY)

			local widthFactor = (1 - p)
			local stretchFactor = 1 + (0.2 * math.sin(p * math.pi))
			local curWidthOffset = startSize.X.Offset * widthFactor
			local curHeightOffset = startSize.Y.Offset * (1 - p) * stretchFactor

			mainContainer.Position = UDim2.new(0.5, 0, curPosY, startPos.Y.Offset * (1 - p))
			mainContainer.Size = UDim2.new(0, math.max(0, curWidthOffset), 0, math.max(0, curHeightOffset))

			if linearProgress >= 0.85 then
				local fadeProgress = (linearProgress - 0.85) / 0.15
				mainContainer.ImageTransparency = fadeProgress
				for _, child in ipairs(mainContainer:GetDescendants()) do
					if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
						child.TextTransparency = fadeProgress
					elseif child:IsA("ImageLabel") or child:IsA("ImageButton") then
						child.ImageTransparency = fadeProgress
					end
				end
			end

			if linearProgress >= 1 then
				if connection then
					connection:Disconnect()
				end
				if not Key and fullScreen then
					pcall(function() fullScreen:Destroy() end)
				end
				pcall(function() mainContainer:Destroy() end)
			end
		end)

		return function() end
	end

	--Dialog:Open()
	return Dialog
end

return DialogModule
