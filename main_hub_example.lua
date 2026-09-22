--[[
    Multi-Stage Roblox Hub Script (WindUI Style)
    
    Стадия 1: Окно авторизации (Аватар + Ник, Выбор: Ключ или Логин/Пароль с Eye Toggle, кнопка "Продолжить")
    Стадия 2: Селектор режимов (Окно с 2 большими кнопками-картинками)
    Стадия 3: Главное меню (WindUI без Dynamic Island, Аватар в сайдбаре, Переключение языков 🇷🇺/🇺🇸, Unload)
--]]

-- Загрузка библиотеки строго с GitHub VendettaUI
local cloneref = (cloneref or function(obj) return obj end)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

-- Состояние выбранного режима
local SelectedMode = nil
local CurrentWindow = nil
local Connections = {}

-- Вспомогательная функция выгрузки (Unload)
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

    print("[WindUI Hub] Успешно выгружен из памяти.")
end

-- -------------------------------------------------------------
-- СТАДИЯ 3: ГЛАВНОЕ МЕНЮ (MAIN MENU)
-- -------------------------------------------------------------
local function StartStage3()
    local Window = WindUI:CreateWindow({
        Title = "WindUI Hub",
        SubTitle = SelectedMode or "General Mode",
        Icon = "shield-check",
        Size = UDim2.fromOffset(660, 440),
        Theme = "Dark",
        Transparent = true,
        Acrylic = true,
        Topbar = {
            Height = 44,
            ButtonsType = "Mac", -- Стандартные кнопочки светофора без Dynamic Island
        },
        User = {
            Enabled = true,
            Title = game.Players.LocalPlayer.DisplayName,
            SubTitle = "@" .. game.Players.LocalPlayer.Name,
            Icon = "rbxthumb://type=AvatarHeadShot&id=" .. game.Players.LocalPlayer.UserId .. "&w=150&h=150",
        }
    })

    CurrentWindow = Window

    -- Вкладка "Главная"
    local MainTab = Window:CreateTab({
        Title = "Главная",
        Icon = "home",
    })

    local MainSection = MainTab:CreateSection("Статус и Режим")

    MainSection:CreateParagraph({
        Title = "Выбранный режим",
        Desc = "Текущий активный модуль: " .. tostring(SelectedMode),
    })

    MainSection:CreateToggle({
        Title = "Авто-фарм / Включить функцию",
        Desc = "Запуск основного скрипта режима",
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

    -- Выбор языка с флагами (🇷🇺 / 🇺🇸)
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

    -- Кнопка полной выгрузки из памяти (Unload)
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
-- СТАДИЯ 2: СЕЛЕКТОР РЕЖИМОВ (MODE SELECTOR)
-- -------------------------------------------------------------
local function StartStage2()
    local SelectorWindow = WindUI:CreateWindow({
        Title = "Выбор режима",
        SubTitle = "Выберите нужный игровой модуль",
        Icon = "layers",
        Size = UDim2.fromOffset(540, 360),
        Theme = "Dark",
        Transparent = true,
        Acrylic = true,
    })

    CurrentWindow = SelectorWindow

    local Tab = SelectorWindow:CreateTab({
        Title = "Режимы",
        Icon = "grid",
    })

    local Section = Tab:CreateSection("Доступные варианты")

    -- Кнопка-карточка 1: Легкий / Основной режим
    Section:CreateButton({
        Title = "🔥 Основной режим (Main Mode)",
        Desc = "Полный функционал для фарма и автоматизации",
        Icon = "zap",
        Callback = function()
            SelectedMode = "Main Mode"
            SelectorWindow:Destroy()
            task.wait(0.2)
            StartStage3()
        end,
    })

    -- Кнопка-карточка 2: Безопасный / Легитный режим
    Section:CreateButton({
        Title = "🛡️ Легит режим (Legit Mode)",
        Desc = "Минимальный риск, незаметный функционал для визуалов",
        Icon = "shield-alert",
        Callback = function()
            SelectedMode = "Legit Mode"
            SelectorWindow:Destroy()
            task.wait(0.2)
            StartStage3()
        end,
    })
end

-- -------------------------------------------------------------
-- СТАДИЯ 1: ОКНО АВТОРИЗАЦИИ (AUTH WINDOW)
-- -------------------------------------------------------------
local function StartStage1()
    WindUI:CreateAuthWindow({
        Title = "WindUI Hub Auth",
        Folder = "WindUIHub",
        SaveKey = true,
        SaveAccount = true,
        KeySystem = {
            URL = "https://example.com/getkey",
            KeyValidator = function(key)
                -- Ваша серверная или локальная проверка ключа
                return key == "12345" or key == "WINDUI-VIP"
            end,
        },
        AccountSystem = {
            AccountValidator = function(login, password)
                -- Ваша проверка логина и пароля
                return login == "admin" and password == "admin123"
            end,
        },
    }, function(authResult)
        print("[Auth Success] Вход выполнен через:", authResult.Mode)
        StartStage2()
    end)
end

-- Запуск скрипта
StartStage1()
