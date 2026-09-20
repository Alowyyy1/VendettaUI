# План разработки VendettaUI (Apple macOS / iOS UI Library)

Документ зафиксирован по результатам интервью (`/grill-me`).

---

## 1. Концепция и цели
* **База**: Форк архитектуры `Footagesus/WindUI`.
* **Целевой репозиторий**: `https://github.com/Alowyyy1/VendettaUI`
* **Эстетика**: Apple macOS Sonoma / Sequoia + iOS (матовое стекло, скругления squircle, тонкие светлые обводки, типографика Apple).
* **Светофоры**: Красный (закрыть), Желтый (свернуть в Dynamic Island), Зеленый (полный размер).
* **Минимизация**: Компактный плавающий остров-виджет (Dynamic Island) по центру вверху экрана с быстрой кнопкой разворачивания + клавиша переключения видимости.
* **Иконки**: Полная интеграция с каталогом `Footagesus/Icons` (7000+ SF Symbols и Lucide через `sfsymbols:icon_name`).
* **Сборка**: Автономный файл `dist/main.lua` через локальный скрипт сборки `build.ps1`.

---

## 2. Структура проекта
```text
VendettaUI/
├── src/
│   ├── Init.luau                   # Точка входа (VendettaUI:CreateWindow)
│   ├── Core/
│   │   ├── Signal.luau             # Менеджер событий (FastSignal)
│   │   ├── Spring.luau             # Пружинные анимации Apple
│   │   ├── Theme.luau              # Темы (macOS Dark, macOS Light, VisionOS)
│   │   ├── Icons.luau              # Адаптер для 7000+ иконок SF Symbols
│   │   └── Drag.luau               # Плавное перетаскивание окна
│   ├── Components/
│   │   ├── Window.luau             # Окно со светофорами и Dynamic Island
│   │   ├── Tab.luau                # Боковой сайдбар и вкладки
│   │   ├── Section.luau            # Секции
│   │   └── Elements/
│   │       ├── Toggle.luau         # Фирменный iOS-тумблер (Pill switch)
│   │       ├── Button.luau         # Кнопки с тактильной анимацией
│   │       ├── Slider.luau         # Слайдеры с закругленными краями
│   │       ├── Dropdown.luau       # Выпадающий список Popover
│   │       ├── Input.luau          # Текстовые поля с подсветкой
│   │       └── Keybind.luau        # Выбор горячих клавиш
├── dist/
│   └── main.lua                    # Готовый бандл для loadstring
├── docs/
│   ├── ARCHITECTURE.md             # Спецификация компонентов и стек
│   └── ICONS.md                    # Каталог SF Symbols
├── build.ps1                       # Локальный скрипт сборки
├── example.lua                     # Пример использования всех фич
├── default.project.json            # Rojo конфигурация
└── README.md                       # Главная документация
```

---

## 3. Этапы реализации
1. **[Git & Remote]** Инициализация Git, настройка `origin` на `https://github.com/Alowyyy1/VendettaUI`.
2. **[Клонирование/перенос WindUI]** Получение кодовой базы `Footagesus/WindUI`.
3. **[Редизайн компонентов под Apple]**:
   - `Window.luau`: Светофоры (Red, Yellow, Green), закругления, Vibrancy, реализация Dynamic Island.
   - `Toggle.luau`: iOS-стиль переключателя с анимацией смещения бегунка и Apple Green фоном.
   - `Icons.luau`: Модуль онлайн-резолвинга SF Symbols из `Footagesus/Icons`.
   - `Theme.luau`: Цвета и прозрачности матового стекла macOS.
4. **[Сборка dist/main.lua]**: Генерация production-файла для загрузки через `loadstring`.
5. **[Тестовый скрипт]**: Создание `example.lua` с демонстрацией всех возможностей.
6. **[Коммит и фиксация]**: Сохранение в локальный Git-репозиторий.
