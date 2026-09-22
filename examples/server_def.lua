--[[
    ========================================================================
    🌐 SERVER DEF - ИЗОЛИРОВАННЫЙ ВЫБОР СЕРВЕРА С LOADER LOG
    ========================================================================
    Файл: examples/server_def.lua
    
    Особенности:
    • Абсолютно независимый автономный скрипт.
    • Стеклянное оформление VendettaUI (полупрозрачный 15% Glass).
    • Окно Loader Log с результатом проверки пинга.
    • Оповещение об ошибках сети: Connection Error (code + описание).
    • Все действия логируются в консоль (F9 / Executor Console).
    ========================================================================
    Ссылка для запуска:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/server_def.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- 1. Загрузка собранной библиотеки VendettaUI с GitHub
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

-- 2. Запуск самостоятельного окна выбора серверов
WindUI:CreateServerSelector({
	Title = "Choose Server",
	SubTitle = "Select a target server endpoint to establish connection",
	Servers = {
		{ Name = "Server 1", Host = "alowyy1.com" },
		{ Name = "Server 2", Host = "130.61.221.37" },
	},
}, function(selectedServer)
	print("--------------------------------------------------")
	print("✅ [ServerDef] Выбран сервер:", selectedServer.Name, "(" .. selectedServer.Host .. ")")
	print("--------------------------------------------------")

	WindUI:Notify({
		Title = "Подключение...",
		Content = "Выбран сервер: " .. selectedServer.Name .. " (" .. selectedServer.Host .. ")",
		Icon = "server",
		Duration = 5,
	})
end)
