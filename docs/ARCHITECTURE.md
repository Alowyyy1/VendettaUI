# Архитектура и технический стек VendettaUI

## 1. Стек разработки и сборка
* **Luau**: Основной язык интерфейса.
* **Rojo**: Синхронизация файлов из VS Code в Roblox Studio (`default.project.json`).
* **Darklua**: Бандлер и оптимизатор. Объединяет модульную структуру папок `src/` в единый компактный файл `dist/main.lua` для работы через `loadstring`.

## 2. Потоки данных и компоненты
```
VendettaUI (Init.luau)
 ├── Core/Theme (Реактивные токены цветов)
 ├── Core/Icons (Кеш и сопоставление SF Symbols)
 └── Components/Window
      ├── Header (Traffic Lights + Window Title)
      ├── Sidebar (Список вкладок Tab с иконками)
      └── TabContainer
           └── Section
                ├── Toggle (iOS Pill Switch)
                ├── Button
                ├── Slider
                ├── Dropdown
                └── Keybind
```

## 3. Токены стилей (Apple HIG Palette)
| Элемент | Dark Mode | Light Mode |
| :--- | :--- | :--- |
| **Фон окна** | `rgb(24, 24, 28)` (alpha 0.15–0.25) | `rgb(246, 246, 248)` (alpha 0.15–0.25) |
| **Фон карточек** | `rgb(38, 38, 44)` (alpha 0.6) | `rgb(255, 255, 255)` (alpha 0.7) |
| **Обводка (Stroke)**| `rgb(255, 255, 255)` (alpha 0.12) | `rgb(0, 0, 0)` (alpha 0.08) |
| **Акцент (Тумблер)**| `rgb(52, 199, 89)` (Apple Green) | `rgb(52, 199, 89)` |
| **Светофор Закрыть**| `rgb(255, 95, 86)` | `rgb(255, 95, 86)` |
| **Светофор Свернуть**| `rgb(255, 189, 46)` | `rgb(255, 189, 46)` |
| **Светофор Полный экран**| `rgb(39, 201, 63)` | `rgb(39, 201, 63)` |
