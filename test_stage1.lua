--[[
    ===================================================
    🧪 ТЕСТОВЫЙ ФАЙЛ: СТАДИЯ 1 (АВТОРИЗАЦИЯ / ЛОГИН)
    ===================================================

    Данные для входа в тест-режимах:
    ---------------------------------------------------
    1. Режим "По ключу":
       • Ключ: 12345 (или WINDUI-VIP)

    2. Режим "Логин и пароль":
       • Логин: admin
       • Пароль: admin123
    ---------------------------------------------------
--]]

-- Загрузка библиотеки строго с GitHub VendettaUI
local cloneref = (cloneref or function(obj) return obj end)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/Test/dist/main.lua"))()

-- Запуск Стадии 1 (Окно входа)
WindUI:CreateAuthWindow({
    Title = "Тестовая Авторизация",
    Folder = "TestAuthData",
    SaveKey = true,      -- Сохраняет ключ при успешном входе
    SaveAccount = true,  -- Сохраняет ТОЛЬКО логин/почту (пароль НЕ сохраняется)
    
    -- Система проверки ключа
    KeySystem = {
        URL = "https://example.com/getkey",
        KeyValidator = function(enteredKey)
            return enteredKey == "12345" or enteredKey == "WINDUI-VIP"
        end,
    },
    
    -- Система проверки логина и пароля
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
    -- Успешная авторизация!
    print("--------------------------------------------------")
    print("✅ УСПЕШНЫЙ ВХОД!")
    print("Режим авторизации:", authResult.Mode)
    if authResult.Mode == "Key" then
        print("Введенный ключ:", authResult.Key)
    else
        print("Введенный логин:", authResult.Login)
    end
    print("--------------------------------------------------")

    -- Уведомление об успешном входе
    WindUI:Notify({
        Title = "Вход выполнен!",
        Content = "Вы успешно прошли Стадию 1 (" .. authResult.Mode .. ").",
        Icon = "check-circle",
        Duration = 5,
    })
end)
