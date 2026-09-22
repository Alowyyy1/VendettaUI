--[[
    ========================================================================
    🌐 SERVER DEF - ИЗОЛИРОВАННЫЙ ВЫБОР СЕРВЕРА С LOADER LOG
    ========================================================================
    Файл: examples/server_def.lua
    
    Особенности:
    • Независимый скрипт (не взаимодействует с основным лоадером).
    • Оформление в стеклянном стиле VendettaUI (полупрозрачный 15% Glass).
    • Блок Loader Log с логированием сообщений и результатов пинга.
    • Проверка соединения с alowyy1.com и 130.61.221.37.
    • В случае сбоя сети выводит: Connection Error (code + описание).
    • Все нажатия кнопок дублируются в консоль (F9 / Executor Console).
    ========================================================================
    Ссылка для запуска:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/server_def.lua
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- 1. Загрузка библиотеки VendettaUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

local Creator = WindUI.Creator
local New = Creator.New
local Tween = Creator.Tween
local DialogInit = require("./components/window/Dialog")
local CreateButton = require("./components/ui/Button").New

-- Создание модального окна выбора сервера
local parentGui = WindUI.ScreenGui and WindUI.ScreenGui.Popups
local Dialog = DialogInit.Create(nil, "Dialog", nil, WindUI, parentGui)

local UISize = 440
local Main = Dialog.UIElements.Main
Main.Size = UDim2.new(0, UISize, 0, 0)

-- Главный контейнер с вертикальной версткой
local MainFrame = New("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	Parent = Main,
}, {
	New("UIPadding", {
		PaddingTop = UDim.new(0, 18),
		PaddingLeft = UDim.new(0, 18),
		PaddingRight = UDim.new(0, 18),
		PaddingBottom = UDim.new(0, 20),
	}),
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		Padding = UDim.new(0, 14),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

-- 1. Заголовок "Choose Server"
local HeaderSection = New("Frame", {
	Size = UDim2.new(1, 0, 0, 36),
	BackgroundTransparency = 1,
	LayoutOrder = 1,
	Parent = MainFrame,
}, {
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 2),
	}),
	New("TextLabel", {
		Text = "Choose Server",
		TextSize = 20,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
		ThemeTag = { TextColor3 = "Text" },
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 22),
		LayoutOrder = 1,
	}),
	New("TextLabel", {
		Text = "Select a target server endpoint to establish connection",
		TextSize = 12,
		FontFace = Font.new(Creator.Font, Enum.FontWeight.Medium),
		ThemeTag = { TextColor3 = "Text" },
		TextTransparency = 0.4,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 14),
		LayoutOrder = 2,
	}),
})

-- 2. Блок "Loader Log" (Стилизованное окно логов)
local LogBoxContainer = Creator.NewRoundFrame(12, "Squircle", {
	Size = UDim2.new(1, 0, 0, 130),
	ImageTransparency = 0.8,
	ThemeTag = { ImageColor3 = "InputBackground" },
	LayoutOrder = 2,
	Parent = MainFrame,
})

Creator.NewRoundFrame(12, "SquircleOutline", {
	Size = UDim2.new(1, 0, 1, 0),
	ImageTransparency = 0.75,
	ThemeTag = { ImageColor3 = "Outline" },
	Parent = LogBoxContainer,
})

local LogBoxInner = New("Frame", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Parent = LogBoxContainer,
}, {
	New("UIPadding", {
		PaddingTop = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 12),
		PaddingBottom = UDim.new(0, 10),
	}),
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
	}),
})

-- Заголовок модального лога "Loader log"
local LogTitle = New("TextLabel", {
	Text = "Loader log",
	TextSize = 13,
	FontFace = Font.new(Creator.Font, Enum.FontWeight.Bold),
	TextColor3 = Color3.fromHex("#34C759"), -- Зеленый стиль как на скрине
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 0, 16),
	LayoutOrder = 1,
	Parent = LogBoxInner,
})

-- Текстовая область логов
local LogTextLabel = New("TextLabel", {
	Text = "",
	TextSize = 12,
	FontFace = Font.new(Enum.Font.Code, Enum.FontWeight.Regular),
	ThemeTag = { TextColor3 = "Text" },
	TextTransparency = 0.15,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Top,
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, -22),
	TextWrapped = true,
	LayoutOrder = 2,
	Parent = LogBoxInner,
})

local logLines = {}

-- Функция записи логов в UI и в внешнюю консоль
local function AppendLog(message, isError)
	local prefix = isError and "❌ " or "🔹 "
	local formattedLine = prefix .. message
	table.insert(logLines, formattedLine)
	if #logLines > 5 then
		table.remove(logLines, 1)
	end
	LogTextLabel.Text = table.concat(logLines, "\n")

	-- Логирование в внешнюю консоль F9 / Executor Console
	local timestamp = os.date("%H:%M:%S")
	local consoleMsg = string.format("[%s] [ServerDef Console Log]: %s", timestamp, message)
	print(consoleMsg)
	if rconsoleprint then
		pcall(function() rconsoleprint(consoleMsg .. "\n") end)
	end
end

-- 3. Кнопки выбора серверов (2 кнопки)
local ServerButtonsContainer = New("Frame", {
	Size = UDim2.new(1, 0, 0, 92),
	BackgroundTransparency = 1,
	LayoutOrder = 3,
	Parent = MainFrame,
}, {
	New("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}),
})

local Btn1Frame = New("Frame", {
	Size = UDim2.new(1, 0, 0, 42),
	BackgroundTransparency = 1,
	LayoutOrder = 1,
	Parent = ServerButtonsContainer,
})

local Btn2Frame = New("Frame", {
	Size = UDim2.new(1, 0, 0, 42),
	BackgroundTransparency = 1,
	LayoutOrder = 2,
	Parent = ServerButtonsContainer,
})

local Btn1 = CreateButton("Server 1 - alowyy1.com", "server", function()
	AppendLog("Action: Clicked Server 1 (alowyy1.com)")
	task.wait(0.2)
	Dialog:GenieClose(0.35)
end, "Primary", Btn1Frame)
Btn1.Size = UDim2.new(1, 0, 1, 0)

local Btn2 = CreateButton("Server 2 - 130.61.221.37", "server", function()
	AppendLog("Action: Clicked Server 2 (130.61.221.37)")
	task.wait(0.2)
	Dialog:GenieClose(0.35)
end, "Secondary", Btn2Frame)
Btn2.Size = UDim2.new(1, 0, 1, 0)

-- Динамический пересчет высоты
local listLayout = MainFrame:FindFirstChildOfClass("UIListLayout")
local function UpdateCardHeight()
	if listLayout then
		local contentY = listLayout.AbsoluteContentSize.Y
		local totalHeight = contentY + 38
		Dialog.UIElements.Main.Size = UDim2.new(0, UISize, 0, totalHeight)
		Dialog.UIElements.MainContainer.Size = UDim2.new(0, UISize, 0, totalHeight)
	end
end

Creator.AddSignal(listLayout:GetPropertyChangedSignal("AbsoluteContentSize"), UpdateCardHeight)
task.defer(UpdateCardHeight)

-- Открытие окна с анимацией
Dialog:Open(0.35)

-- 4. Функция проверки пинга и логирования
local function CheckServerPing(serverName, host)
	local requestFunc = (request or http_request or (syn and syn.request))
	local targetUrl = host:find("http") and host or ("http://" .. host)
	local startTime = os.clock()

	local success, response
	if requestFunc then
		success, response = pcall(function()
			return requestFunc({
				Url = targetUrl,
				Method = "GET",
			})
		end)
	else
		success, response = pcall(function()
			return game:HttpGet(targetUrl)
		end)
	end

	local elapsedTime = math.floor((os.clock() - startTime) * 1000)

	if success then
		local statusCode = (type(response) == "table" and response.StatusCode) or 200
		if statusCode >= 200 and statusCode < 400 then
			AppendLog(string.format("[%s] %s | Ping: %dms (Code %d OK)", serverName, host, elapsedTime, statusCode))
		else
			AppendLog(string.format("Connection Error (code %d - HTTP status failure)", statusCode), true)
		end
	else
		local errStr = tostring(response or "Connection failed")
		AppendLog(string.format("Connection Error (code 0 - %s)", errStr), true)
	end
end

-- Стартовая последовательность Loader Log
task.spawn(function()
	task.wait(0.1)
	AppendLog("Hi! It`s log window.")
	task.wait(0.4)
	AppendLog("[Launcher] Checking server status...")
	task.wait(0.3)
	CheckServerPing("Server 1", "alowyy1.com")
	task.wait(0.3)
	CheckServerPing("Server 2", "130.61.221.37")
end)
