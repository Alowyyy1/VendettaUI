# VendettaUI 🍏

> Современная библиотека интерфейса для Roblox в эстетике **Apple (macOS / iOS / visionOS)**, основанная на архитектуре **WindUI** с собственными кастомными компонентами, анимациями и поддержкой 7000+ иконок SF Symbols.

Репозиторий проекта: [https://github.com/Alowyyy1/VendettaUI](https://github.com/Alowyyy1/VendettaUI)

---

## 📑 Содержание
1. [Архитектура и структура проекта](#1-архитектура-и-структура-проекта)
2. [Иконки Apple (SF Symbols)](#2-иконки-apple-sf-symbols)
3. [Apple-компоненты: Тумблеры и Светофоры](#3-apple-компоненты-тумблеры-и-светофоры)
4. [Быстрый старт и пример использования](#4-быстрый-старт-и-пример-использования)
5. [План модификаций форка (VendettaUI Additions)](#5-план-модификаций-форка-vendettaui-additions)

---

## 1. Архитектура и структура проекта

Проект строится на связке **Rojo** + **Darklua** (для сборки в единый production-бандл `dist/main.lua`), что позволяет писать чистый модульный код в IDE:

```text
VendettaUI/
├── .github/
│   └── workflows/
│       └── build.yml               # Автосборка релиза в dist/main.lua при пуше
├── src/
│   ├── Init.luau                   # Главный модуль библиотеки (API точка входа)
│   ├── Core/
│   │   ├── Signal.luau             # События (FastSignal / GoodSignal)
│   │   ├── Spring.luau             # Физика плавных пружин Apple-стиля
│   │   ├── Theme.luau              # Менеджер тем (Dark, Light, Cupertino, Vision)
│   │   ├── Drag.luau               # Плавное перетаскивание окон с инерцией
│   │   └── Icons.luau              # Загрузчик и кешер иконок SF Symbols / Lucide
│   ├── Components/
│   │   ├── Window.luau             # macOS Окно (Светофоры, Сайдбар, Glass-эффект)
│   │   ├── Tab.luau                # Боковые вкладки (Navigation Sidebar)
│   │   ├── Section.luau            # Секции и группировки настроек
│   │   └── Elements/
│   │       ├── Toggle.luau         # Фирменный iOS-тумблер (Pill switch)
│   │       ├── Button.luau         # Кнопки с тактильным эффектом нажатия
│   │       ├── Slider.luau         # Слайдеры с плавной анимацией
│   │       ├── Dropdown.luau       # Всплывающее меню в стиле macOS Popover
│   │       ├── Input.luau          # Текстовые поля с подсветкой фокуса
│   │       ├── Keybind.luau        # Выбор горячих клавиш
│   │       └── ColorPicker.luau    # Выбор цвета
├── dist/
│   └── main.lua                    # Скомпилированный бандл для loadstring
├── docs/
│   ├── ICONS.md                    # Справочник иконок SF Symbols
│   └── ARCHITECTURE.md             # Технические детали архитектуры
├── aftman.toml                     # Менеджер инструментов (rojo, darklua, stylua)
├── default.project.json            # Конфигурация Rojo
├── .darklua.json                   # Конфигурация бандлера Darklua
└── README.md
```

---

## 2. Иконки Apple (SF Symbols)

Библиотека интегрирует каталог **Apple SF Symbols** (более 7000 иконок) из экосистемы `Footagesus/Icons`. Все иконки уже переведены в форматы ассетов Roblox (`rbxassetid://...`) и масштабируются без потери качества.

### Как использовать иконку в коде:

В любом компоненте VendettaUI (вкладка, кнопка, заголовок) иконка задается префиксом `sfsymbols:` либо прямым названием:

```lua
-- Примеры вызова:
Window:CreateTab({
    Title = "Настройки",
    Icon = "sfsymbols:gearshape.fill" -- или "gear"
})

Tab:CreateButton({
    Title = "Сохранить профиль",
    Icon = "sfsymbols:square.and.arrow.down",
    Callback = function() ... end
})
```

### Популярные иконки SF Symbols для меню:
| Категория | Название SF Symbol | Имя в библиотеке |
| :--- | :--- | :--- |
| **Системные / Настройки** | `gearshape.fill`, `slider.horizontal.3` | `sfsymbols:gearshape.fill`, `sfsymbols:slider.horizontal.3` |
| **Навигация** | `house.fill`, `sidebar.left`, `safari` | `sfsymbols:house.fill`, `sfsymbols:sidebar.left` |
| **Управление** | `play.fill`, `pause.fill`, `arrow.clockwise` | `sfsymbols:play.fill`, `sfsymbols:arrow.clockwise` |
| **Безопасность** | `lock.fill`, `shield.lefthalf.filled`, `key.fill` | `sfsymbols:lock.fill`, `sfsymbols:shield.lefthalf.filled` |
| **Статистика** | `chart.bar.xaxis`, `speedometer`, `gauge.with.needle` | `sfsymbols:chart.bar.xaxis`, `sfsymbols:speedometer` |
| **Персонаж / Игрок** | `person.crop.circle.fill`, `eye.fill`, `sparkles` | `sfsymbols:person.crop.circle.fill`, `sfsymbols:sparkles` |

---

## 3. Apple-компоненты: Тумблеры и Светофоры

### Фирменный iOS-тумблер (Toggle Switch)
Отличительные черты Apple Switch:
- Овальная форма (Pill: `UICorner = UDim.new(1, 0)`).
- Плавный белый кругляшок-бегунок (Thumb), который скользит слева направо.
- Зеленый активный фон Apple Green (`#34C759` / `Color3.fromRGB(52, 199, 89)`).
- Неактивный серый фон (`#39393D` для Dark Mode, `#E9E9EA` для Light Mode).
- Плавный эффект растяжения бегунка при перетаскивании (squish animation).

### Фирменные кнопки-светофоры (macOS Traffic Lights)
В левой верхней части заголовка окна:
- 🔴 **Красная** (`#FF5F56`) — закрыть / уничтожить интерфейс.
- 🟡 **Желтая** (`#FFBD2E`) — свернуть / спрятать окно в компактный Dock.
- 🟢 **Зеленая** (`#27C93F`) — развернуть / сбросить размер.

---

## 4. Быстрый старт и пример использования

После сборки скрипт загружается в Roblox через `loadstring`:

```lua
local VendettaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Alowyyy1/VendettaUI/main/dist/main.lua"))()

-- 1. Создаем окно macOS
local Window = VendettaUI:CreateWindow({
    Title = "Vendetta",
    SubTitle = "Control Center",
    Size = UDim2.fromOffset(620, 420),
    Theme = "Dark", -- "Dark" | "Light" | "Vision"
    Acrylic = true,  -- Эффект размытия / матового стекла
})

-- 2. Создаем вкладку с иконкой SF Symbols
local TabMain = Window:CreateTab({
    Title = "Основные",
    Icon = "sfsymbols:slider.horizontal.3"
})

-- 3. Добавляем секцию
local SectionVisuals = TabMain:CreateSection("Визуал & Кастомизация")

-- 4. Добавляем Apple-тумблер
SectionVisuals:CreateToggle({
    Title = "Эффект стекла (Vibrancy)",
    Desc = "Включает прозрачность и мягкие тени интерфейса",
    Default = true,
    Callback = function(enabled)
        print("Glass status:", enabled)
    end
})

-- 5. Добавляем слайдер
SectionVisuals:CreateSlider({
    Title = "Прозрачность UI",
    Min = 0,
    Max = 100,
    Default = 25,
    Suffix = "%",
    Callback = function(val)
        print("Transparency:", val)
    end
})
```

---

## 5. План модификаций форка (VendettaUI Additions)

Что мы добавляем и перерабатываем поверх базы WindUI:
1. **Дизайн-система macOS Sonoma / Sequoia**:
   - Переработка бокового меню (Sidebar) в стиль нативного системного меню macOS.
   - Traffic Lights с микро-иконками крестика, минуса и стрелок при наведении курсора.
2. **Анимации Apple Springs**:
   - Замена стандартного TweenService на физику упругой пружины (Damped Spring) для открытия модалок и переключения вкладок.
3. **Нативный модуль SF Symbols**:
   - Встроенный кеш и быстрый поиск по именам иконок без задержек сети.
4. **Светлая / Темная / Vision темы**:
   - Динамический переключатель тем без перезагрузки интерфейса.
