# Пошаговое руководство по 3-стадийному Hub (WindUI Style)

Настоящая документация описывает процесс подключения собственной системы валидации, отображения аватаров, настройки языков и полной выгрузки из памяти.

---

## 📋 Обзор Архитектуры

Процесс работы построен на 3 последовательных стадиях:

1. **Стадия 1 (Окно входа):**
   * Отображение аватарки (`rbxthumb`) и имени текущего игрока (`DisplayName` и `@Username`).
   * Выбор метода авторизации: **«По ключу»** или **«Логин / Пароль»**.
   * Скрытие кода/пароля символами `•••••` с кнопкой переключения видимости (иконка `eye` / `eye-off`).
   * Сохранение: По ключу сохраняет ключ; по логину/паролю сохраняет **только логин/почту** в файл.

2. **Стадия 2 (Селектор режимов):**
   * Окно выбора с 2 крупными интерактивными кнопками-карточками.
   * При выборе карточки окно плавно закрывается и передает выбранный режим в Стадию 3.

3. **Стадия 3 (Главное меню):**
   * Чистый оригинальный дизайн WindUI (без Dynamic Island).
   * Аватар и ник в сайдбаре.
   * Выбор языка с флагами (`🇷🇺 Русский` / `🇺🇸 English`).
   * Кнопка полной выгрузки из памяти (`Unload`).

---

## 🔑 1. Подключение вашей валидации (Стадия 1)

Вы можете переопределить валидатор ключа или аккаунта в конфигурации `WindUI:CreateAuthWindow`:

```lua
WindUI:CreateAuthWindow({
    Title = "My Custom Hub",
    Folder = "MyHubData",
    SaveKey = true,       -- Сохранять ключ во внешнем файле
    SaveAccount = true,   -- Сохранять ТОЛЬКО логин/почту
    
    -- Проверка ключа
    KeySystem = {
        URL = "https://your-site.com/getkey",
        KeyValidator = function(enteredKey)
            -- Наша кастомная серверная проверка:
            local success, res = pcall(function()
                return game:HttpGet("https://api.yoursite.com/verify?key=" .. enteredKey)
            end)
            return success and res == "valid"
        end,
    },
    
    -- Проверка логина и пароля
    AccountSystem = {
        AccountValidator = function(login, password)
            -- Возвращает true/false и текст ошибки при необходимости
            if login == "user@mail.com" and password == "secret" then
                return true
            else
                return false, "Неверный логин или пароль!"
            end
        end,
    },
}, function(authResult)
    -- Вызывается при успешном входе
    print("Успешный вход! Режим:", authResult.Mode)
    StartStage2()
end)
```

---

## 🖼️ 2. Использование картинок и аватарок (`rbxthumb://` & `rbxassetid://`)

Для загрузки аватарки игрока в высоком качестве используется протокол Roblox Thumbnails:
```lua
local userId = game.Players.LocalPlayer.UserId
local avatarUrl = "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150"
```

Для использования собственных иконок или баннеров режимов на Стадии 2:
```lua
Section:CreateButton({
    Title = "🔥 Основной режим",
    Desc = "Описание режима",
    Icon = "rbxassetid://1234567890", -- или имя встроенной Lucide-иконки
    Callback = function() ... end
})
```

---

## 🇷🇺 / 🇺🇸 3. Переключение языков с флагами

В настройках Стадии 3 переключатель языков настраивается следующим образом:

```lua
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
```

---

## 🧹 4. Полная выгрузка из памяти (Unload)

Функция выгрузки обеспечивает уничтожение GUI, отключение всех активных подписок `RBXScriptConnection` и очистку оперативной памяти для повторного выполнения скрипта без перезахода в игру:

```lua
local Connections = {}

-- Добавление соединения в список отслеживания
table.insert(Connections, game:GetService("RunService").Heartbeat:Connect(function()
    -- Ваш фоновый код
end))

local function UnloadHub()
    -- 1. Отключение всех соединений
    for _, conn in ipairs(Connections) do
        if conn and conn.Disconnect then
            pcall(function() conn:Disconnect() end)
        end
    end
    table.clear(Connections)

    -- 2. Уничтожение главного окна
    if CurrentWindow and CurrentWindow.Destroy then
        pcall(function() CurrentWindow:Destroy() end)
    end

    -- 3. Уничтожение родительского ScreenGui
    if WindUI.ScreenGui then
        pcall(function() WindUI.ScreenGui:Destroy() end)
    end

    print("[Hub] Выгрузка завершена.")
end
```
