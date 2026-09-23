--[[
    ========================================================================
    MAIN MENU - ГЛАВНОЕ МЕНЮ (STANDALONE SCRIPT)
    ========================================================================
    Файл: examples/main_menu.lua
    
    Особенности:
    - Модальное окно с левым боковым меню (стиль Apple / VendettaUI).
    - Вкладка "Settings": Скрытый бинд на RightShift (hardcoded, locked) 
      + Кастомный бинд пользователя.
    - Тестовые вкладки "Tab 1" и "Tab 2" со всеми элементами управления.
    - Иконки SF Symbols (Apple style).
    - 100% совместимость с API элементов VendettaUI.
    - Полное отсутствие эмодзи в тексте и интерфейсе.
    ========================================================================
    Ссылка для запуска:
    https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/examples/main_menu.lua
    ========================================================================
--]]

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)

local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))
local LocalPlayer = Players.LocalPlayer

-- 1. Загрузка библиотеки VendettaUI (ветка Test)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

-- 2. Создание главного окна (стиль Apple / SF Symbols)
local Window = WindUI:CreateWindow({
	Title = "Vendetta UI",
	Author = "Main Menu",
	Icon = "sfsymbols:gearshape",
	Size = UDim2.fromOffset(680, 460),
	MinSize = Vector2.new(580, 380),
	MaxSize = Vector2.new(900, 600),
	Transparent = true,
	Theme = "macOSDark",
	Folder = "VendettaUI",
})

-- 3. Скрытый системный бинд на RightShift (нельзя снять или изменить)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		Window:Toggle()
	end
end)

-- Переменная для сохранения пользовательского бинда
local userKeyName = "RightControl"

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if userKeyName and userKeyName ~= "" and input.KeyCode.Name == userKeyName then
		Window:Toggle()
	end
end)

-- =========================================================================
-- ВКЛАДКА 1: SETTINGS (НАСТРОЙКИ)
-- =========================================================================
local SettingsTab = Window:Tab({
	Title = "Settings",
	Icon = "sfsymbols:gearshape",
	Desc = "Keybinds and Interface Settings",
})

SettingsTab:Section({ Title = "Keybinds" })

-- Заблокированный системный бинд на RightShift
local SystemBind = SettingsTab:Keybind({
	Title = "System Toggle Key",
	Desc = "Hardcoded keybind (RightShift). Cannot be changed.",
	Value = Enum.KeyCode.RightShift,
	CanChange = false,
	Callback = function() end,
})
if SystemBind and SystemBind.Lock then
	SystemBind:Lock("Hardcoded")
end

-- Пользовательский изменяемый бинд
SettingsTab:Keybind({
	Title = "User Toggle Key",
	Desc = "Custom keybind to show or hide the menu.",
	Value = Enum.KeyCode.RightControl,
	CanChange = true,
	Callback = function(keyName)
		userKeyName = keyName
		WindUI:Notify({
			Title = "Keybind Updated",
			Content = "Menu toggle key set to: " .. tostring(keyName),
			Icon = "sfsymbols:keyboard",
			Duration = 3,
		})
	end,
})

SettingsTab:Section({ Title = "Interface" })

SettingsTab:Slider({
	Title = "UI Scale",
	Desc = "Adjust scale factor of the interface",
	Min = 0.8,
	Max = 1.2,
	Default = 1,
	Increment = 0.05,
	Callback = function(scaleValue)
		WindUI:SetUIScale(scaleValue)
	end,
})

-- =========================================================================
-- ВКЛАДКА 2: TAB 1 (ТЕСТ ВОЗМОЖНОСТЕЙ 1)
-- =========================================================================
local Tab1 = Window:Tab({
	Title = "Tab 1",
	Icon = "sfsymbols:slider.horizontal.3",
	Desc = "Controls, Inputs and Selection",
})

Tab1:Section({ Title = "Controls & Sliders" })

Tab1:Toggle({
	Title = "Enable Speed Boost",
	Desc = "Toggle custom movement speed modification",
	Default = false,
	Callback = function(state)
		WindUI:Notify({
			Title = "Speed Boost",
			Content = "State changed to: " .. tostring(state),
			Icon = "sfsymbols:bolt",
			Duration = 2,
		})
	end,
})

Tab1:Slider({
	Title = "WalkSpeed Multiplier",
	Desc = "Set player walkspeed value",
	Min = 16,
	Max = 200,
	Default = 16,
	Increment = 1,
	Callback = function(value)
		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
		end
	end,
})

Tab1:Slider({
	Title = "JumpPower Height",
	Desc = "Set player jump power value",
	Min = 50,
	Max = 300,
	Default = 50,
	Increment = 5,
	Callback = function(value)
		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
		end
	end,
})

Tab1:Button({
	Title = "Reset Movement Stats",
	Desc = "Restore default speed and jump height",
	Callback = function()
		if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			hum.WalkSpeed = 16
			hum.JumpPower = 50
		end
		WindUI:Notify({
			Title = "Stats Reset",
			Content = "Movement parameters restored to default",
			Icon = "sfsymbols:arrow.counterclockwise",
			Duration = 3,
		})
	end,
})

Tab1:Section({ Title = "Inputs & Dropdowns" })

Tab1:Input({
	Title = "Target Player Name",
	Desc = "Enter nickname to filter targets",
	Placeholder = "Enter username...",
	Callback = function(text)
		print("[Main Menu] Input target: " .. tostring(text))
	end,
})

Tab1:Dropdown({
	Title = "Target Selection Mode",
	Desc = "Choose targeting prioritization logic",
	Values = { "Closest Distance", "Lowest Health", "Highest Threat", "Priority List" },
	Value = "Closest Distance",
	Callback = function(selected)
		print("[Main Menu] Selected mode: " .. tostring(selected))
	end,
})

Tab1:Dropdown({
	Title = "Enabled Modules",
	Desc = "Multi-selection example for active features",
	Values = { "Aimbot", "Triggerbot", "ESP Box", "Chams", "Radar" },
	Value = { "ESP Box", "Chams" },
	Multi = true,
	Callback = function(selectedTable)
		print("[Main Menu] Active modules updated")
	end,
})

-- =========================================================================
-- ВКЛАДКА 3: TAB 2 (ТЕСТ ВОЗМОЖНОСТЕЙ 2)
-- =========================================================================
local Tab2 = Window:Tab({
	Title = "Tab 2",
	Icon = "sfsymbols:paintbrush",
	Desc = "Visuals, Status and Utility",
})

Tab2:Section({ Title = "Visual Configuration" })

Tab2:Colorpicker({
	Title = "ESP Box Color",
	Desc = "Set bounding box highlight color",
	Default = Color3.fromRGB(0, 170, 255),
	Callback = function(color, transparency)
		print("[Main Menu] ESP Color changed: ", color, transparency)
	end,
})

Tab2:Colorpicker({
	Title = "Chams Glow Color",
	Desc = "Set player mesh glow color",
	Default = Color3.fromRGB(255, 50, 90),
	Callback = function(color, transparency)
		print("[Main Menu] Chams Color changed: ", color, transparency)
	end,
})

Tab2:ProgressBar({
	Title = "System Buffer Status",
	Desc = "Memory buffer usage status",
	Min = 0,
	Max = 100,
	Default = 68,
})

Tab2:Paragraph({
	Title = "System Diagnostics",
	Desc = "All modules compiled and executing under normal security context. Config manager state: In-Memory.",
})

Tab2:Section({ Title = "Group & Code Demonstration" })

Tab2:Group({
	Title = "Quick Action Buttons",
	Desc = "Execute common routine operations",
})

Tab2:Button({
	Title = "Clear Logs",
	Callback = function()
		WindUI:Notify({
			Title = "Logs Cleared",
			Content = "Console log buffer flushed successfully.",
			Icon = "sfsymbols:trash",
			Duration = 2,
		})
	end,
})

Tab2:Button({
	Title = "Copy State",
	Callback = function()
		if setclipboard then
			setclipboard("VendettaUI State: OK")
		end
		WindUI:Notify({
			Title = "Copied",
			Content = "State copied to clipboard.",
			Icon = "sfsymbols:doc.on.doc",
			Duration = 2,
		})
	end,
})

Tab2:Code({
	Title = "Configuration Snippet",
	Desc = "Sample script snippet display",
	Value = [[-- Target Configuration
local Config = {
    AutoTarget = true,
    MaxDistance = 500,
    FovRadius = 90,
}
return Config]],
})

-- Выбор первой вкладки по умолчанию
Window:SelectTab(1)

return Window
