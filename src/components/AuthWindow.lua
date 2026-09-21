local AuthWindow = {}

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local CreateButton = require("./ui/Button").New
local DialogInit = require("./window/Dialog")

-- Функция для создания поля ввода с поддержкой скрытия/открытия текста (eye toggle)
local function CreateMaskedInput(Placeholder, Icon, Parent, Callback, DefaultValue, AllowClear)
	DefaultValue = DefaultValue or ""
	local RawValue = DefaultValue
	local IsHidden = true

	local Frame = New("Frame", {
		Size = UDim2.new(1, 0, 0, 42),
		Parent = Parent,
		BackgroundTransparency = 1,
	})

	local RoundBg = Creator.NewRoundFrame(10, "Squircle", {
		ThemeTag = {
			ImageColor3 = "Placeholder",
		},
		Size = UDim2.new(1, 0, 1, 0),
		ImageTransparency = 0.85,
		Parent = Frame,
	})

	local GlassBg = Creator.NewRoundFrame(9, "SquircleGlass", {
		ThemeTag = {
			ImageColor3 = "Outline",
		},
		Size = UDim2.new(1, 1, 1, 1),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ImageTransparency = 0.8,
		Parent = Frame,
	})

	local ContentFrame = Creator.NewRoundFrame(10, "Squircle", {
		Size = UDim2.new(1, 0, 1, 0),
		Name = "Frame",
		ThemeTag = {
			ImageColor3 = "LabelBackground",
			ImageTransparency = "LabelBackgroundTransparency",
		},
		Parent = Frame,
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 0),
		}),
		New("UIListLayout", {
			FillDirection = "Horizontal",
			Padding = UDim.new(0, 8),
			VerticalAlignment = "Center",
			HorizontalAlignment = "Left",
		}),
	})

	local IconFrame
	if Icon and Icon ~= "" then
		IconFrame = New("ImageLabel", {
			Image = Creator.Icon(Icon)[1],
			ImageRectSize = Creator.Icon(Icon)[2].ImageRectSize,
			ImageRectOffset = Creator.Icon(Icon)[2].ImageRectPosition,
			Size = UDim2.new(0, 21, 0, 21),
			BackgroundTransparency = 1,
			ThemeTag = {
				ImageColor3 = "Icon",
			},
			Parent = ContentFrame,
		})
	end

	local TextBox = New("TextBox", {
		BackgroundTransparency = 1,
		TextSize = 16,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Regular),
		Size = UDim2.new(1, (IconFrame and -29 or 0) - 28, 1, 0),
		PlaceholderText = Placeholder,
		ClearTextOnFocus = AllowClear or false,
		ClipsDescendants = true,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		Text = DefaultValue ~= "" and (IsHidden and string.rep("•", #DefaultValue) or DefaultValue) or "",
		ThemeTag = {
			PlaceholderColor3 = "PlaceholderText",
			TextColor3 = "Text",
		},
		Parent = ContentFrame,
	})

	-- Кнопка переключения скрытия (eye / eye-off)
	local EyeIconButton = New("ImageButton", {
		Size = UDim2.new(0, 20, 0, 20),
		BackgroundTransparency = 1,
		Image = Creator.Icon("eye-off")[1],
		ImageRectSize = Creator.Icon("eye-off")[2].ImageRectSize,
		ImageRectOffset = Creator.Icon("eye-off")[2].ImageRectPosition,
		ThemeTag = {
			ImageColor3 = "Icon",
		},
		Parent = ContentFrame,
	})

	local function UpdateDisplayText()
		if IsHidden then
			TextBox.Text = string.rep("•", #RawValue)
		else
			TextBox.Text = RawValue
		end
	end

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		local currentText = TextBox.Text
		if IsHidden then
			-- Если ввод скрыт, вычисляем добавленные или удаленные символы
			local expectedDots = string.rep("•", #RawValue)
			if currentText ~= expectedDots then
				if #currentText > #expectedDots then
					local added = string.sub(currentText, #expectedDots + 1)
					RawValue = RawValue .. added
				elseif #currentText < #expectedDots then
					RawValue = string.sub(RawValue, 1, #currentText)
				end
				UpdateDisplayText()
			end
		else
			RawValue = currentText
		end

		if Callback then
			Creator.SafeCallback(Callback, RawValue)
		end
	end)

	EyeIconButton.MouseButton1Click:Connect(function()
		IsHidden = not IsHidden
		local iconName = IsHidden and "eye-off" or "eye"
		local iconData = Creator.Icon(iconName)
		EyeIconButton.Image = iconData[1]
		EyeIconButton.ImageRectSize = iconData[2].ImageRectSize
		EyeIconButton.ImageRectOffset = iconData[2].ImageRectPosition
		UpdateDisplayText()
	end)

	local InputController = {
		Frame = Frame,
		TextBox = TextBox,
		GetValue = function()
			return RawValue
		end,
		SetValue = function(val)
			RawValue = val or ""
			UpdateDisplayText()
			if Callback then
				Creator.SafeCallback(Callback, RawValue)
			end
		end,
	}

	return InputController
end

function AuthWindow.new(Config, OnSuccessCallback)
	local WindUI = Config.WindUI
	local Folder = Config.Folder or Config.Title or "WindUI"
	local hwid = gethwid or function()
		return LocalPlayer and LocalPlayer.UserId or 0
	end
	local Filename = tostring(hwid())

	local KeySavePath = Folder .. "/" .. Filename .. ".key"
	local LoginSavePath = Folder .. "/" .. Filename .. ".login"

	local SavedKey = ""
	local SavedLogin = ""

	if isfile and isfile(KeySavePath) then
		pcall(function()
			SavedKey = readfile(KeySavePath) or ""
		end)
	end
	if isfile and isfile(LoginSavePath) then
		pcall(function()
			SavedLogin = readfile(LoginSavePath) or ""
		end)
	end

	local Dialog = DialogInit.Create(true, "Popup", Config.Window, WindUI, WindUI.ScreenGui.KeySystem)

	local UISize = 420
	Dialog.UIElements.Main.AutomaticSize = "Y"
	Dialog.UIElements.Main.Size = UDim2.new(0, UISize, 0, 0)

	-- 1. Блок профиля игрока (Аватар + Ник)
	local UserId = LocalPlayer and LocalPlayer.UserId or 1
	local Username = LocalPlayer and LocalPlayer.Name or "Guest"
	local DisplayName = LocalPlayer and LocalPlayer.DisplayName or "Guest User"
	local AvatarImg = "rbxthumb://type=AvatarHeadShot&id=" .. UserId .. "&w=150&h=150"

	local AvatarImageFrame = Creator.New("ImageLabel", {
		Size = UDim2.new(0, 48, 0, 48),
		Image = AvatarImg,
		BackgroundTransparency = 1,
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 24),
		}),
	})

	local ProfileInfo = New("Frame", {
		AutomaticSize = "XY",
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 2),
			VerticalAlignment = "Center",
		}),
		New("TextLabel", {
			AutomaticSize = "XY",
			BackgroundTransparency = 1,
			Text = DisplayName,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
			ThemeTag = { TextColor3 = "Text" },
			TextSize = 17,
			TextXAlignment = "Left",
		}),
		New("TextLabel", {
			AutomaticSize = "XY",
			BackgroundTransparency = 1,
			Text = "@" .. Username,
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag = { TextColor3 = "Text" },
			TextTransparency = 0.45,
			TextSize = 13,
			TextXAlignment = "Left",
		}),
	})

	local HeaderContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundTransparency = 1,
	}, {
		New("UIListLayout", {
			FillDirection = "Horizontal",
			Padding = UDim.new(0, 14),
			VerticalAlignment = "Center",
		}),
		AvatarImageFrame,
		ProfileInfo,
	})

	-- 2. Переключатель режимов (Ключ / Логин-Пароль)
	local ActiveMode = "Key" -- "Key" | "Account"

	local ModeKeyButton
	local ModeAccountButton

	local TabSelectorContainer = Creator.NewRoundFrame(12, "Squircle", {
		Size = UDim2.new(1, 0, 0, 38),
		ThemeTag = { ImageColor3 = "LabelBackground" },
		ImageTransparency = 0.5,
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, 3),
			PaddingBottom = UDim.new(0, 3),
			PaddingLeft = UDim.new(0, 3),
			PaddingRight = UDim.new(0, 3),
		}),
		New("UIListLayout", {
			FillDirection = "Horizontal",
			Padding = UDim.new(0, 4),
		}),
	})

	ModeKeyButton = Creator.NewRoundFrame(9, "Squircle", {
		Size = UDim2.new(0.5, -2, 1, 0),
		ThemeTag = { ImageColor3 = "Primary" },
		ImageTransparency = 0,
		Parent = TabSelectorContainer,
	}, {
		New("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "По ключу",
			FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
			ThemeTag = { TextColor3 = "Text" },
			TextSize = 14,
		}),
	}, true)

	ModeAccountButton = Creator.NewRoundFrame(9, "Squircle", {
		Size = UDim2.new(0.5, -2, 1, 0),
		ThemeTag = { ImageColor3 = "Primary" },
		ImageTransparency = 1,
		Parent = TabSelectorContainer,
	}, {
		New("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "Логин и пароль",
			FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
			ThemeTag = { TextColor3 = "Text" },
			TextTransparency = 0.3,
			TextSize = 14,
		}),
	}, true)

	-- 3. Контейнеры полей ввода
	local KeyContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Visible = true,
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 10),
		}),
	})

	local AccountContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Visible = false,
	}, {
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 10),
		}),
	})

	-- Поле ключа со скрытием
	local KeyInput = CreateMaskedInput("Введите ваш ключ...", "key", KeyContainer, nil, SavedKey, false)

	-- Кнопка "Получить ключ"
	if Config.KeySystem and Config.KeySystem.URL then
		local GetKeyBtnFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundTransparency = 1,
			Parent = KeyContainer,
		})

		local GetKeyBtn = CreateButton("Получить ключ", "external-link", function()
			if setclipboard then
				setclipboard(Config.KeySystem.URL)
				WindUI:Notify({
					Title = "Ссылка скопирована",
					Content = "Ссылка на получение ключа скопирована в буфер обмена.",
					Icon = "copy",
				})
			end
		end, "Secondary", GetKeyBtnFrame)
		GetKeyBtn.Size = UDim2.new(1, 0, 1, 0)
	end

	-- Поля логина и пароля
	local LoginInputController
	local PasswordInputController

	-- Поле логина (обычный открытый ввод)
	local LoginFrame = New("Frame", {
		Size = UDim2.new(1, 0, 0, 42),
		Parent = AccountContainer,
		BackgroundTransparency = 1,
	})

	Creator.NewRoundFrame(10, "Squircle", {
		ThemeTag = { ImageColor3 = "Placeholder" },
		Size = UDim2.new(1, 0, 1, 0),
		ImageTransparency = 0.85,
		Parent = LoginFrame,
	})

	local LoginContent = Creator.NewRoundFrame(10, "Squircle", {
		Size = UDim2.new(1, 0, 1, 0),
		ThemeTag = {
			ImageColor3 = "LabelBackground",
			ImageTransparency = "LabelBackgroundTransparency",
		},
		Parent = LoginFrame,
	}, {
		New("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }),
		New("UIListLayout", { FillDirection = "Horizontal", Padding = UDim.new(0, 8), VerticalAlignment = "Center" }),
		New("ImageLabel", {
			Image = Creator.Icon("user")[1],
			ImageRectSize = Creator.Icon("user")[2].ImageRectSize,
			ImageRectOffset = Creator.Icon("user")[2].ImageRectPosition,
			Size = UDim2.new(0, 21, 0, 21),
			BackgroundTransparency = 1,
			ThemeTag = { ImageColor3 = "Icon" },
		}),
	})

	local LoginTextBox = New("TextBox", {
		BackgroundTransparency = 1,
		TextSize = 16,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Regular),
		Size = UDim2.new(1, -29, 1, 0),
		PlaceholderText = "Логин или Email...",
		Text = SavedLogin,
		TextXAlignment = "Left",
		TextYAlignment = "Center",
		ThemeTag = { PlaceholderColor3 = "PlaceholderText", TextColor3 = "Text" },
		Parent = LoginContent,
	})

	LoginInputController = {
		GetValue = function()
			return LoginTextBox.Text
		end,
	}

	-- Поле пароля со скрытием
	PasswordInputController = CreateMaskedInput("Введите пароль...", "lock", AccountContainer, nil, "", false)

	-- Логика переключения закладок
	local function SwitchMode(newMode)
		ActiveMode = newMode
		if newMode == "Key" then
			Tween(ModeKeyButton, 0.15, { ImageTransparency = 0 }):Play()
			ModeKeyButton.TextLabel.TextTransparency = 0
			ModeKeyButton.TextLabel.FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold)

			Tween(ModeAccountButton, 0.15, { ImageTransparency = 1 }):Play()
			ModeAccountButton.TextLabel.TextTransparency = 0.3
			ModeAccountButton.TextLabel.FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium)

			KeyContainer.Visible = true
			AccountContainer.Visible = false
		else
			Tween(ModeKeyButton, 0.15, { ImageTransparency = 1 }):Play()
			ModeKeyButton.TextLabel.TextTransparency = 0.3
			ModeKeyButton.TextLabel.FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium)

			Tween(ModeAccountButton, 0.15, { ImageTransparency = 0 }):Play()
			ModeAccountButton.TextLabel.TextTransparency = 0
			ModeAccountButton.TextLabel.FontFace = Font.new(Creator.Font, Enum.FontWeight.SemiBold)

			KeyContainer.Visible = false
			AccountContainer.Visible = true
		end
	end

	ModeKeyButton.MouseButton1Click:Connect(function()
		SwitchMode("Key")
	end)
	ModeAccountButton.MouseButton1Click:Connect(function()
		SwitchMode("Account")
	end)

	-- 4. Кнопка «Продолжить»
	local ActionContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundTransparency = 1,
	})

	local SubmitBtn = CreateButton("Продолжить", "arrow-right", function()
		local isSuccess = false
		local errorMessage = "Неверные данные для входа."

		if ActiveMode == "Key" then
			local key = KeyInput.GetValue()
			if key == "" then
				WindUI:Notify({
					Title = "Ошибка входа",
					Content = "Пожалуйста, введите ключ.",
					Icon = "triangle-alert",
				})
				return
			end

			if Config.KeySystem and Config.KeySystem.KeyValidator then
				isSuccess = Config.KeySystem.KeyValidator(key)
			elseif Config.KeySystem and Config.KeySystem.Key then
				local expectedKey = Config.KeySystem.Key
				if type(expectedKey) == "table" then
					isSuccess = table.find(expectedKey, key) ~= nil
				else
					isSuccess = tostring(expectedKey) == tostring(key)
				end
			else
				isSuccess = true
			end

			if isSuccess then
				if (Config.SaveKey == nil or Config.SaveKey == true) and writefile then
					pcall(function()
						writefile(KeySavePath, key)
					end)
				end
			end
		else
			local login = LoginInputController.GetValue()
			local password = PasswordInputController.GetValue()

			if login == "" or password == "" then
				WindUI:Notify({
					Title = "Ошибка входа",
					Content = "Заполните логин и пароль.",
					Icon = "triangle-alert",
				})
				return
			end

			if Config.AccountSystem and Config.AccountSystem.AccountValidator then
				isSuccess, errorMessage = Config.AccountSystem.AccountValidator(login, password)
				if isSuccess == nil then
					isSuccess = true
				end
			else
				isSuccess = true
			end

			if isSuccess then
				-- Сохраняем ТОЛЬКО логин/почту по требованию пользователя
				if (Config.SaveAccount == nil or Config.SaveAccount == true) and writefile then
					pcall(function()
						writefile(LoginSavePath, login)
					end)
				end
			end
		end

		if isSuccess then
			Dialog:Close()()
			task.wait(0.3)
			if OnSuccessCallback then
				OnSuccessCallback({
					Mode = ActiveMode,
					Key = ActiveMode == "Key" and KeyInput.GetValue() or nil,
					Login = ActiveMode == "Account" and LoginInputController.GetValue() or nil,
				})
			end
		else
			WindUI:Notify({
				Title = "Ошибка авторизации",
				Content = errorMessage or "Проверьте правильность введенных данных.",
				Icon = "triangle-alert",
			})
		end
	end, "Primary", ActionContainer)

	SubmitBtn.Size = UDim2.new(1, 0, 1, 0)

	-- Главный фрейм окна Стадии 1
	local MainFrame = New("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Parent = Dialog.UIElements.Main,
	}, {
		New("UIPadding", {
			PaddingTop = UDim.new(0, 18),
			PaddingLeft = UDim.new(0, 18),
			PaddingRight = UDim.new(0, 18),
			PaddingBottom = UDim.new(0, 18),
		}),
		New("UIListLayout", {
			FillDirection = "Vertical",
			Padding = UDim.new(0, 16),
		}),
		HeaderContainer,
		TabSelectorContainer,
		KeyContainer,
		AccountContainer,
		ActionContainer,
	})

	Dialog:Open()
	return Dialog
end

return AuthWindow
