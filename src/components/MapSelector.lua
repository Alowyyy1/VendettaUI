local MapSelector = {}

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local DialogInit = require("./window/Dialog")

-- Эффект печати (Typewriter Effect)
local function Typewriter(textLabel, fullText, speed)
	speed = speed or 0.025
	textLabel.Text = fullText
	task.spawn(function()
		for i = 1, #fullText do
			if not textLabel or not textLabel.Parent then
				break
			end
			textLabel.Text = string.sub(fullText, 1, i)
			task.wait(speed)
		end
		textLabel.Text = fullText
	end)
end

function MapSelector.new(Config, OnSelectCallback)
	Config = Config or {}

	local Dialog = DialogInit.Create("MapSelectorDialog", "Dialog", nil, Config.WindUI, nil)

	local Main = Dialog.UIElements.Main
	Main.Size = UDim2.new(0, 440, 0, 0)
	Main.AutomaticSize = Enum.AutomaticSize.Y

	local userId = LocalPlayer and LocalPlayer.UserId or 1
	local displayName = Config.UserTitle or "Test Ник"
	local username = Config.UserSubTitle or (LocalPlayer and ("@" .. LocalPlayer.Name) or "@username")
	local avatarThumb = Config.UserAvatar or ("rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150")

	-- 1. Профиль пользователя (Аватарка + Плашка с текстом)
	local AvatarImageFrame = Creator.NewRoundFrame(999, "Squircle", {
		Size = UDim2.new(0, 46, 0, 46),
		ImageTransparency = 0,
		ThemeTag = {
			ImageColor3 = "ElementBackground",
		},
		ClipsDescendants = true,
	}, {
		New("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = avatarThumb,
		}),
	})

	local DisplayNameLabel = New("TextLabel", {
		Text = "",
		TextSize = 16,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
		ThemeTag = {
			TextColor3 = "Text",
		},
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
	})

	local UsernameLabel = New("TextLabel", {
		Text = "",
		TextSize = 12,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
		ThemeTag = {
			TextColor3 = "Text",
		},
		TextTransparency = 0.4,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
	})

	Typewriter(DisplayNameLabel, displayName, 0.02)
	task.delay(0.12, function()
		Typewriter(UsernameLabel, username, 0.02)
	end)

	local ProfileInfo = New("Frame", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 2),
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		DisplayNameLabel,
		UsernameLabel,
	})

	local UserHeaderContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 48),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
	}, {
		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 12),
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		AvatarImageFrame,
		ProfileInfo,
	})

	-- 2. Заголовок "Выбор карты"
	local TitleHeaderContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundTransparency = 1,
		LayoutOrder = 2,
	}, {
		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 2),
		}),
		New("TextLabel", {
			Text = Config.Title or "Выбор карты",
			TextSize = 18,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
			ThemeTag = {
				TextColor3 = "Text",
			},
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 22),
			LayoutOrder = 1,
		}),
		New("TextLabel", {
			Text = Config.SubTitle or "Выберите нужную локацию для продолжения",
			TextSize = 12,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag = {
				TextColor3 = "Text",
			},
			TextTransparency = 0.4,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			LayoutOrder = 2,
		}),
	})

	-- 3. Контейнер карточек (Old & Oldest)
	local CardsContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 185),
		BackgroundTransparency = 1,
		LayoutOrder = 3,
	}, {
		New("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 14),
		}),
		New("UIPadding", {
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		}),
	})

	UserHeaderContainer.Parent = Main
	TitleHeaderContainer.Parent = Main
	CardsContainer.Parent = Main

	local cardsData = Config.Cards or {
		{
			Title = "Old",
			SubTitle = "Классическая карта",
			Image = Config.OldImage or "rbxassetid://10734975692",
			Icon = "map",
		},
		{
			Title = "Oldest",
			SubTitle = "Старейшая карта",
			Image = Config.OldestImage or "rbxassetid://10734975692",
			Icon = "history",
		},
	}

	local isSelecting = false

	for index, cardData in ipairs(cardsData) do
		local CardFrame = Creator.NewRoundFrame(14, "Squircle", {
			Size = UDim2.new(0, 190, 0, 172),
			ImageTransparency = 0.85,
			ThemeTag = {
				ImageColor3 = "ElementBackground",
			},
			Parent = CardsContainer,
			LayoutOrder = index,
		})

		local CardScale = New("UIScale", {
			Scale = 1,
			Parent = CardFrame,
		})

		Creator.NewRoundFrame(13, "SquircleGlass", {
			Size = UDim2.new(1, 0, 1, 0),
			ImageTransparency = 0.95,
			Parent = CardFrame,
		})

		local CardOutline = Creator.NewRoundFrame(14, "SquircleOutline", {
			Size = UDim2.new(1, 0, 1, 0),
			ImageTransparency = 0.8,
			ThemeTag = {
				ImageColor3 = "Outline",
			},
			Parent = CardFrame,
		})

		local ContentLayout = New("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Parent = CardFrame,
		}, {
			New("UIPadding", {
				PaddingTop = UDim.new(0, 8),
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 10),
			}),
			New("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 6),
			}),
		})

		-- Пространство под картинку (Image / Thumbnail slot)
		local ImageContainer = Creator.NewRoundFrame(10, "Squircle", {
			Size = UDim2.new(1, 0, 0, 100),
			ImageTransparency = 0.6,
			ThemeTag = {
				ImageColor3 = "InputBackground",
			},
			Parent = ContentLayout,
			LayoutOrder = 1,
			ClipsDescendants = true,
		})

		local MapImage = New("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = cardData.Image or "",
			ScaleType = Enum.ScaleType.Crop,
			Parent = ImageContainer,
		})

		local FallbackIcon = Creator.Image(
			cardData.Icon or "map-pin",
			cardData.Title .. ":Icon",
			0,
			"MapSelector",
			"Cards",
			true
		)
		FallbackIcon.Size = UDim2.new(0, 30, 0, 30)
		FallbackIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		FallbackIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
		FallbackIcon.ImageLabel.ImageTransparency = 0.4
		FallbackIcon.Parent = ImageContainer

		MapImage.Loaded:Connect(function()
			FallbackIcon.Visible = false
		end)

		local TitleLabel = New("TextLabel", {
			Text = cardData.Title,
			TextSize = 15,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
			ThemeTag = {
				TextColor3 = "Text",
			},
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 18),
			Parent = ContentLayout,
			LayoutOrder = 2,
		})

		local SubTitleLabel = New("TextLabel", {
			Text = cardData.SubTitle or "Нажмите для выбора",
			TextSize = 11,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag = {
				TextColor3 = "Text",
			},
			TextTransparency = 0.4,
			TextXAlignment = Enum.TextXAlignment.Center,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			Parent = ContentLayout,
			LayoutOrder = 3,
		})

		local ButtonOverlay = New("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "",
			Parent = CardFrame,
			ZIndex = 10,
		})

		-- Анимация наведения
		Creator.AddSignal(ButtonOverlay.MouseEnter, function()
			if isSelecting then return end
			Tween(CardScale, 0.2, { Scale = 1.03 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			Tween(CardFrame, 0.2, { ImageTransparency = 0.7 }):Play()
			Tween(CardOutline, 0.2, { ImageTransparency = 0.4 }):Play()
		end)

		Creator.AddSignal(ButtonOverlay.MouseLeave, function()
			if isSelecting then return end
			Tween(CardScale, 0.2, { Scale = 1.0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			Tween(CardFrame, 0.2, { ImageTransparency = 0.85 }):Play()
			Tween(CardOutline, 0.2, { ImageTransparency = 0.8 }):Play()
		end)

		Creator.AddSignal(ButtonOverlay.MouseButton1Click, function()
			if isSelecting then return end
			isSelecting = true

			Tween(CardScale, 0.1, { Scale = 0.96 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			task.wait(0.08)
			Tween(CardScale, 0.15, { Scale = 1.0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

			-- Запуск плавной анимации закрытия (0.35с)
			Dialog:GenieClose(0.35)
			task.wait(0.35)

			if cardData.Callback then
				cardData.Callback(cardData.Title)
			end
			if OnSelectCallback then
				OnSelectCallback(cardData.Title, cardData)
			end
		end)
	end

	-- Открытие окна с анимацией старта ("как закрытие в логине, только наоборот")
	Dialog:Open()

	local mainContainer = Dialog.UIElements.MainContainer
	local parentGroup = mainContainer.Parent

	if parentGroup then
		local startCanvasGroup = Instance.new("CanvasGroup")
		startCanvasGroup.Name = "OpenCanvas"
		startCanvasGroup.BackgroundTransparency = 1
		startCanvasGroup.Size = mainContainer.Size
		startCanvasGroup.Position = mainContainer.Position
		startCanvasGroup.AnchorPoint = mainContainer.AnchorPoint
		startCanvasGroup.ZIndex = mainContainer.ZIndex or 9999
		startCanvasGroup.GroupTransparency = 1
		startCanvasGroup.Parent = parentGroup

		local startScale = Instance.new("UIScale")
		startScale.Scale = 0.92
		startScale.Parent = startCanvasGroup

		mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
		mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
		mainContainer.Parent = startCanvasGroup

		Tween(startCanvasGroup, 0.35, { GroupTransparency = 0 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
		Tween(startScale, 0.35, { Scale = 1.0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

		task.spawn(function()
			task.wait(0.36)
			if mainContainer and mainContainer.Parent == startCanvasGroup then
				mainContainer.Position = startCanvasGroup.Position
				mainContainer.AnchorPoint = startCanvasGroup.AnchorPoint
				mainContainer.Parent = parentGroup
				startCanvasGroup:Destroy()
			end
		end)
	end

	return Dialog
end

return MapSelector
