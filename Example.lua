--[[
    VendettaUI 🍏 Example Script
    Демонстрация библиотеки в стиле Apple macOS Sonoma / iOS
]]

local VendettaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/main/dist/main.lua"))()

-- 1. Создание окна в стиле macOS
local Window = VendettaUI:CreateWindow({
    Title = "Vendetta Control",
    SubTitle = "macOS Sequoia Style",
    Icon = "sfsymbols:applelogo", -- SF Symbols
    Size = UDim2.fromOffset(640, 430),
    Theme = "macOSDark", -- "macOSDark" | "macOSLight" | "visionOS"
    Acrylic = true,
    Transparent = true,
    Topbar = {
        Height = 50,
        ButtonsType = "Mac", -- Красный, Желтый (Dynamic Island), Зеленый светофоры
    },
    OpenButton = {
        Title = "Vendetta",
        Icon = "sfsymbols:applelogo",
    }
})

-- 2. Вкладка "Основные"
local GeneralTab = Window:CreateTab({
    Title = "Общие",
    Icon = "sfsymbols:gearshape.fill",
})

local VisualSection = GeneralTab:CreateSection("Визуальные параметры (Apple HIG)")

-- iOS-тумблер
VisualSection:CreateToggle({
    Title = "Эффект матового стекла (Acrylic Vibrancy)",
    Desc = "Включает полупрозрачность и мягкое размытие",
    Default = true,
    Callback = function(state)
        print("Acrylic state:", state)
    end,
})

-- Слайдер
VisualSection:CreateSlider({
    Title = "Прозрачность интерфейса",
    Desc = "Регулировка прозрачности фона окна",
    Min = 0,
    Max = 100,
    Default = 20,
    Suffix = "%",
    Callback = function(val)
        print("Transparency:", val)
    end,
})

-- Кнопка
VisualSection:CreateButton({
    Title = "Сменить тему на macOS Light",
    Icon = "sfsymbols:sun.max.fill",
    Callback = function()
        VendettaUI:SetTheme("macOSLight")
    end,
})

-- Вкладка "Игрок & Бой"
local CombatTab = Window:CreateTab({
    Title = "Игрок",
    Icon = "sfsymbols:person.crop.circle.fill",
})

local CombatSection = CombatTab:CreateSection("Функции персонажа")

CombatSection:CreateToggle({
    Title = "ESP (Подсветка игроков)",
    Desc = "Отображение боксов вокруг других игроков",
    Default = false,
    Icon = "sfsymbols:eye.fill",
    Callback = function(state)
        print("ESP:", state)
    end,
})

CombatSection:CreateSlider({
    Title = "Скорость бега (WalkSpeed)",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(speed)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = speed
        end
    end,
})

-- Выбор темы оформления
local ThemesTab = Window:CreateTab({
    Title = "Темы",
    Icon = "sfsymbols:paintbrush.fill",
})

local ThemeSection = ThemesTab:CreateSection("Apple Темы")

ThemeSection:CreateDropdown({
    Title = "Выберите тему",
    Values = { "macOSDark", "macOSLight", "visionOS", "Dark", "Light" },
    Default = "macOSDark",
    Callback = function(selectedTheme)
        VendettaUI:SetTheme(selectedTheme)
    end,
})