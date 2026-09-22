local ServerSelector = {}

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

local Creator = require("../modules/Creator")
local New = Creator.New
local Tween = Creator.Tween

local DialogInit = require("./window/Dialog")
local CreateButton = require("./ui/Button").New

function ServerSelector.new(Config, OnSelectCallback)
	Config = Config or {}

	local parentGui = Config.Parent or (Config.WindUI and Config.WindUI.ScreenGui and Config.WindUI.ScreenGui.Popups)
	local Dialog = DialogInit.Create(nil, "Dialog", nil, Config.WindUI, parentGui)

	local UISize = 440
	local Main = Dialog.UIElements.Main
	Main.Size = UDim2.new(0, UISize, 0, 0)

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
			Text = Config.Title or "Choose Server",
			TextSize = 20,
			Font = Enum.Font.GothamBold,
			ThemeTag = { TextColor3 = "Text" },
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 22),
			LayoutOrder = 1,
		}),
		New("TextLabel", {
			Text = Config.SubTitle or "Select a target server endpoint to establish connection",
			TextSize = 12,
			Font = Enum.Font.Gotham,
			ThemeTag = { TextColor3 = "Text" },
			TextTransparency = 0.4,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			LayoutOrder = 2,
		}),
	})

	-- 2. Блок "Loader log"
	local LogBoxContainer = Creator.NewRoundFrame(12, "Squircle", {
		Size = UDim2.new(1, 0, 0, 125),
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

	local LogTitle = New("TextLabel", {
		Text = "Loader log",
		TextSize = 13,
		Font = Enum.Font.GothamBold,
		TextColor3 = Color3.fromHex("#34C759"),
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 16),
		LayoutOrder = 1,
		Parent = LogBoxInner,
	})

	local LogTextLabel = New("TextLabel", {
		Text = "",
		TextSize = 12,
		Font = Enum.Font.Code,
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

	local function AppendLog(message, isError)
		local prefix = isError and "❌ " or "🔹 "
		local formattedLine = prefix .. message
		table.insert(logLines, formattedLine)
		if #logLines > 5 then
			table.remove(logLines, 1)
		end
		LogTextLabel.Text = table.concat(logLines, "\n")

		local timestamp = os.date("%H:%M:%S")
		local consoleMsg = string.format("[%s] 🕹️ [ServerDef Log]: %s", timestamp, message)
		print(consoleMsg)
		if rconsoleprint then
			pcall(function() rconsoleprint(consoleMsg .. "\n") end)
		end
	end

	-- 3. Кнопки серверов
	local serversList = Config.Servers or {
		{ Name = "Server 1", Host = "alowyy1.com" },
		{ Name = "Server 2", Host = "130.61.221.37" },
	}

	local buttonsHeight = (#serversList * 42) + ((#serversList - 1) * 8)
	local ServerButtonsContainer = New("Frame", {
		Size = UDim2.new(1, 0, 0, buttonsHeight),
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

	local isConnecting = false

	for idx, srv in ipairs(serversList) do
		local btnFrame = New("Frame", {
			Size = UDim2.new(1, 0, 0, 42),
			BackgroundTransparency = 1,
			LayoutOrder = idx,
			Parent = ServerButtonsContainer,
		})

		local variant = (idx == 1) and "Primary" or "Secondary"
		local labelText = string.format("%s - %s", srv.Name, srv.Host)

		local btn = CreateButton(labelText, "server", function()
			if isConnecting then return end
			isConnecting = true

			AppendLog(string.format("Action: Clicked %s (%s)", srv.Name, srv.Host))
			task.wait(0.15)

			Dialog:GenieClose(0.35)
			task.spawn(function()
				task.wait(0.35)
				if OnSelectCallback then
					OnSelectCallback(srv)
				end
			end)
		end, variant, btnFrame)
		btn.Size = UDim2.new(1, 0, 1, 0)
	end

	-- Автоматический математический расчет высоты
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

	-- Открытие окна с помощью анимации
	Dialog:Open(0.35)

	-- Функция проверки соединения и пинга
	local function CheckServerPing(srv)
		local requestFunc = (request or http_request or (syn and syn.request))
		local host = srv.Host
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
				AppendLog(string.format("[%s] %s | Ping: %dms (Code %d OK)", srv.Name, host, elapsedTime, statusCode))
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
		task.wait(0.3)
		AppendLog("[Launcher] Checking server status...")
		for _, srv in ipairs(serversList) do
			task.wait(0.25)
			CheckServerPing(srv)
		end
	end)

	return Dialog
end

return ServerSelector
