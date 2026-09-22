--[[
    ========================================================================
    🎮 VENDETTA UI: СТАДИЯ 1 (АВТОРИЗАЦИЯ) ➔ СТАДИЯ 2 (ВЫБОР КАРТЫ) ➔ СТАДИЯ 3 (ХАБ)
    ========================================================================
    GitHub Raw Link:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/login.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- Загрузка библиотеки строго с GitHub VendettaUI (Ветка Test)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

local SelectedMap = nil
local CurrentWindow = nil
local Connections = {}

-- Функция выгрузки (Unload)
local function UnloadHub()
	for _, conn in ipairs(Connections) do
		if conn and conn.Disconnect then
			pcall(function() conn:Disconnect() end)
		end
	end
	table.clear(Connections)

	if CurrentWindow and CurrentWindow.Destroy then
		pcall(function() CurrentWindow:Destroy() end)
	end

	if WindUI.ScreenGui then
		pcall(function() WindUI.ScreenGui:Destroy() end)
	end

	print("[VendettaUI] Скрипт выгружен.")
end

-- -------------------------------------------------------------
-- СТАДИЯ 3: ГЛАВНОЕ МЕНЮ (MAIN MENU)
-- -------------------------------------------------------------
local function StartStage3()
	local Window = WindUI:CreateWindow({
		Title = "VendettaUI Hub",
		SubTitle = "Карта: " .. (SelectedMap or "Old"),
		Icon = "shield-check",
		Size = UDim2.fromOffset(660, 440),
		Theme = "Dark",
		Transparent = true,
		Acrylic = true,
		Topbar = {
			Height = 44,
			ButtonsType = "Mac",
		},
		User = {
			Enabled = true,
			Title = LocalPlayer and LocalPlayer.DisplayName or "User",
			SubTitle = "@" .. (LocalPlayer and LocalPlayer.Name or "username"),
			Icon = "rbxthumb://type=AvatarHeadShot&id=" .. (LocalPlayer and LocalPlayer.UserId or 1) .. "&w=150&h=150",
		},
	})

	CurrentWindow = Window

	-- Вкладка "Главная"
	local MainTab = Window:CreateTab({
		Title = "Главная",
		Icon = "home",
	})

	local MainSection = MainTab:CreateSection("Информация и Функционал")

	MainSection:CreateParagraph({
		Title = "Текущая карта",
		Desc = "Выбранная локация: " .. tostring(SelectedMap),
	})

	MainSection:CreateToggle({
		Title = "Авто-фарм / Включить функцию",
		Desc = "Запуск основного скрипта для карты " .. tostring(SelectedMap),
		Default = false,
		Callback = function(state)
			print("Auto-farm status:", state)
		end,
	})

	-- Вкладка "Настройки"
	local SettingsTab = Window:CreateTab({
		Title = "Настройки",
		Icon = "settings",
	})

	local SettingsSection = SettingsTab:CreateSection("Язык и Управление")

	SettingsSection:CreateDropdown({
		Title = "Язык интерфейса / Language",
		Values = { "🇷🇺 Русский", "🇺🇸 English" },
		Default = "🇷🇺 Русский",
		Callback = function(selected)
			if selected == "🇷🇺 Русский" then
				WindUI:SetLanguage("ru")
			elseif selected == "🇺🇸 English" then
				WindUI:SetLanguage("en")
			end
		end,
	})

	SettingsSection:CreateButton({
		Title = "Полная выгрузка (Unload)",
		Desc = "Безопасная очистка памяти и удаление GUI",
		Icon = "log-out",
		Callback = function()
			UnloadHub()
		end,
	})
end

-- -------------------------------------------------------------
-- СТАДИЯ 2: ВЫБОР КАРТЫ (MAP SELECTOR)
-- -------------------------------------------------------------
local function StartStage2()
	WindUI:CreateMapSelector({
		Title = "Выбор карты",
		SubTitle = "Выберите нужную локацию для продолжения",
		UserTitle = "Test Ник",
		UserSubTitle = "@" .. (LocalPlayer and LocalPlayer.Name or "username"),
		Cards = {
			{
				Title = "Old",
				SubTitle = "Классическая карта",
				Icon = "map",
			},
			{
				Title = "Oldest",
				SubTitle = "Старейшая карта",
				Icon = "history",
			},
		},
	}, function(selectedMapName)
		print("[Stage 2] Успешно выбрана карта:", selectedMapName)
		SelectedMap = selectedMapName
		StartStage3()
	end)
end

-- -------------------------------------------------------------
-- СТАДИЯ 1: АВТОРИЗАЦИЯ (AUTH WINDOW)
-- -------------------------------------------------------------
local function StartStage1()
	WindUI:CreateAuthWindow({
		Title = "Авторизация",
		Folder = "AuthData",
		SaveKey = true,
		SaveAccount = true,
		KeySystem = {
			URL = "https://example.com/getkey",
			KeyValidator = function(enteredKey)
				return enteredKey == "12345" or enteredKey == "WINDUI-VIP"
			end,
		},
		AccountSystem = {
			AccountValidator = function(login, password)
				if login == "admin" and password == "admin123" then
					return true
				else
					return false, "Неверный логин или пароль! (Попробуйте admin / admin123)"
				end
			end,
		},
	}, function(authResult)
		print("[Stage 1] Вход выполнен через:", authResult.Mode)
		StartStage2()
	end)
end

-- Запуск с 1 стадии
StartStage1()
