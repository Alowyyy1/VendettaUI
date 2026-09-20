# Справочник иконок Apple (SF Symbols) в VendettaUI

В VendettaUI встроена поддержка каталога Apple SF Symbols (более 7000 иконок) на базе базы ассетов Roblox.

## 1. Как работает резолвинг иконок
1. Если передано имя с префиксом `sfsymbols:name` (например `sfsymbols:gearshape.fill`), библиотека берет иконку из словаря SF Symbols.
2. Если передано `rbxassetid://...`, ассет отображается напрямую.
3. Если префикс опущен (например `house`), поиск идет по SF Symbols с фоллбеком на Lucide.

## 2. Популярные символы Apple для Roblox UI

### Настройки и система
* `gear` / `gearshape.fill` — Основные настройки
* `slider.horizontal.3` — Тонкие параметры и фильтры
* `wrench.and.screwdriver` — Инструменты разработчика
* `info.circle` — Информация о скрипте/версии
* `bell.fill` — Уведомления

### Игрок и Бой (Combat / Player)
* `person.fill` / `person.crop.circle.fill` — Локальный игрок
* `eye.fill` / `eye.slash.fill` — ESP / Визуалы
* `target` — Aimbot / Автонаводка
* `shield.fill` — Защита / Godmode
* `flame.fill` — Быстрая атака / Буст
* `bolt.fill` — Скорость (Speedhack)

### Передвижение и Телепорт
* `location.fill` — Телепорты и координаты
* `airplane` — Fly hack / Полет
* `figure.walk` / `figure.run` — Скорость ходьбы
* `arrow.triangle.swap` — Перемещение

### Интерфейс и Панели
* `sidebar.left` — Переключение бокового меню
* `magnifyingglass` — Поиск
* `trash.fill` — Очистить
* `folder.fill` — Конфигурации и файлы сохранения
* `square.and.arrow.down` — Сохранить конфиг
* `square.and.arrow.up` — Загрузить конфиг

## 3. Программное использование
```lua
local IconModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()

-- Получить прямой rbxassetid строки:
local assetId = IconModule.GetIcon("sfsymbols:gearshape.fill")
print(assetId) --> rbxassetid://...
```
