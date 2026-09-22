--[[
    ========================================================================
    🔑 VENDETTA UI: СТАДИЯ 1 (АВТОРИЗАЦИЯ) ➔ СТАДИЯ 2 (ВЫБОР КАРТЫ)
    ========================================================================
    Логирование каждого действия выводится в консоль (F9 / Executor Console).
    ========================================================================
    Ссылка для загрузки:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/login.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- Функция внешнего логирования в консоль
local function LogAction(actionName, details)
	local timestamp = os.date("%H:%M:%S")
	local logMsg = string.format("[%s] 🕹️ [ACTION LOG]: %s %s", timestamp, actionName, details or "")
	print(logMsg)
	if rconsoleprint then
		pcall(function() rconsoleprint(logMsg .. "\n") end)
	end
end

LogAction("SystemInit", "Загрузка библиотеки VendettaUI с GitHub...")

-- 1. Загрузка собранной библиотеки с GitHub
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

LogAction("SystemInit", "Библиотека VendettaUI успешно загружена.")

-- -------------------------------------------------------------
-- СТАДИЯ 2: ВЫБОР КАРТЫ (MAP SELECTOR)
-- -------------------------------------------------------------
local function StartStage2()
	LogAction("Stage2_Start", "Открытие окна выбора карт...")

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
				Callback = function()
					LogAction("ButtonClick", "Нажата карточка карты: Old")
				end,
			},
			{
				Title = "Oldest",
				SubTitle = "Старейшая карта",
				Icon = "history",
				Callback = function()
					LogAction("ButtonClick", "Нажата карточка карты: Oldest")
				end,
			},
		},
	}, function(selectedMapName)
		LogAction("Stage2_Success", "Успешно выбрана карта: " .. tostring(selectedMapName))

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
	LogAction("Stage1_Start", "Открытие окна авторизации...")

	WindUI:CreateAuthWindow({
		Title = "Авторизация",
		Folder = "AuthData",
		SaveKey = false,     -- Для теста отключаем автосохранение
		SaveAccount = false,
		KeySystem = {
			URL = "https://example.com/getkey",
			KeyValidator = function(enteredKey)
				LogAction("KeyValidation", "Проверка ключа: " .. tostring(enteredKey))
				local isValid = (enteredKey == "12345" or enteredKey == "WINDUI-VIP")
				if isValid then
					LogAction("KeyValidation", "Результат проверки ключа: УСПЕШНО ✅")
				else
					LogAction("KeyValidation", "Результат проверки ключа: ОШИБКА ❌")
				end
				return isValid
			end,
		},
		AccountSystem = {
			AccountValidator = function(login, password)
				LogAction("AccountValidation", "Проверка логина: " .. tostring(login))
				if login == "admin" and password == "admin123" then
					LogAction("AccountValidation", "Результат проверки аккаунта: УСПЕШНО ✅")
					return true
				else
					LogAction("AccountValidation", "Результат проверки аккаунта: ОШИБКА ❌")
					return false, "Неверный логин или пароль! (Попробуйте admin / admin123)"
				end
			end,
		},
	}, function(authResult)
		LogAction("Stage1_Success", "Авторизация успешно пройдена! Режим: " .. tostring(authResult.Mode))
		StartStage2()
	end)
end

-- Запуск скрипта
StartStage1()
