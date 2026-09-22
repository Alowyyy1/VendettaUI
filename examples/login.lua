--[[
    ========================================================================
    🔑 VENDETTA UI: СТАДИЯ 1 (АВТОРИЗАЦИЯ) ➔ СТАДИЯ 2 (ВЫБОР КАРТЫ)
    ========================================================================
    Данные для входа в тест-режимах:
    • По ключу: 12345 (или WINDUI-VIP)
    • Логин и пароль: admin / admin123
    ========================================================================
    Ссылка для загрузки:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/login.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- 1. Загрузка собранной библиотеки с GitHub
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

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
		print("--------------------------------------------------")
		print("✅ [Стадия 2] ВЫБРАНА КАРТА:", selectedMapName)
		print("--------------------------------------------------")

		WindUI:Notify({
			Title = "Карта выбрана!",
			Content = "Вы успешно выбрали локацию: " .. tostring(selectedMapName),
			Icon = "check-circle",
			Duration = 5,
		})
	end)
end

-- -------------------------------------------------------------
-- СТАДИЯ 1: АВТОРИЗАЦИЯ (AUTH WINDOW)
-- -------------------------------------------------------------
local function StartStage1()
	WindUI:CreateAuthWindow({
		Title = "Авторизация",
		Folder = "AuthData",
		SaveKey = false,     -- Для теста отключаем автосохранение, чтобы окно входа открывалось всегда
		SaveAccount = false,
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
		print("--------------------------------------------------")
		print("✅ [Стадия 1] УСПЕШНЫЙ ВХОД! Режим:", authResult.Mode)
		print("--------------------------------------------------")
		
		-- Переход к Стадии 2 (Выбор карты)
		StartStage2()
	end)
end

-- Запуск скрипта
StartStage1()
