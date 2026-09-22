--[[
    ========================================================================
    SERVER DEF - ИЗОЛИРОВАННЫЙ ВЫБОР СЕРВЕРА С МИНИ-КОНСОЛЬЮ
    ========================================================================
    Файл: examples/server_def.lua
    
    Особенности:
    - Автономный скрипт без лишних зависимостей.
    - Стеклянный стиль VendettaUI (15% Glass).
    - Мини-консоль с пингом расположена ПОД основным окном выбора.
    ========================================================================
    Ссылка для запуска:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/server_def.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- 1. Загрузка библиотеки VendettaUI с GitHub
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

-- 2. Запуск окна выбора серверов
WindUI:CreateServerSelector({
	Title = "Choose Server",
	SubTitle = "Select a target server endpoint to establish connection",
	Servers = {
		{ Name = "Server 1", Host = "alowyy1.com" },
		{ Name = "Server 2", Host = "130.61.221.37" },
	},
}, function(selectedServer)
	print("[ServerDef] Selected server: " .. selectedServer.Name .. " (" .. selectedServer.Host .. ")")

	WindUI:Notify({
		Title = "Connecting...",
		Content = "Selected: " .. selectedServer.Name .. " (" .. selectedServer.Host .. ")",
		Icon = "server",
		Duration = 5,
	})
end)
