<p align="center"><img src="./github-assets/radzone-hero.svg" width="100%" alt="RADZONE wasteland brand banner"/></p>
<p align="center"><img src="./github-assets/radzone-logo.svg" width="70%" alt="RADZONE logo"/></p>
<p align="center">[EN](./README.md) · [RU](./README.ru.md) · [ES](./README.es.md) · [DE](./README.de.md) · [FR](./README.fr.md)</p>
<p align="center"><img alt="Android" src="https://img.shields.io/badge/Android-Prototype-699548?style=flat-square"/> <img alt="Engine" src="https://img.shields.io/badge/Engine-Godot%204.7.2-4c81ae?style=flat-square"/> <img alt="Development" src="https://img.shields.io/badge/Status-In%20Development-b7833c?style=flat-square"/> <img alt="Art" src="https://img.shields.io/badge/Art-Direction%20Approved-75a75c?style=flat-square"/></p>
# RADZONE
**Душа классической RPG. Современная пустошь.**

**RADZONE** — мобильная постапокалиптическая RPG для поклонников **Fallout 2**. Сохраняем узнаваемые SPECIAL, пошаговые бои, очки действия, длинные диалоги и глубину ролевых систем. Переосмысляем графику и управление для смартфонов.

## Новое: библиотека игровых графических ресурсов

Оригинальная графика с **прозрачным фоном в редактируемом SVG** (пока рабочие исходники — впереди финальная отрисовка и интеграция в Android):

<p align="center">
<img src="./art/production/world/props/source/supply_crate.svg" width="22%" alt="Isometric supply crate"/>
<img src="./art/production/world/props/source/rust_barrel.svg" width="22%" alt="Rusted drum"/>
<img src="./art/production/world/props/source/crt_terminal.svg" width="22%" alt="Retro wasteland terminal"/>
<img src="./art/production/world/props/source/water_pump.svg" width="22%" alt="Post-apocalyptic water pump"/>
</p>
<p align="center">
<img src="./art/production/items/icons/source/10mm_pistol.svg" width="16%" alt="Pistol"/>
<img src="./art/production/items/icons/source/medkit.svg" width="16%" alt="Medkit"/>
<img src="./art/production/items/icons/source/backpack.svg" width="16%" alt="Backpack"/>
<img src="./art/production/items/icons/source/gas_mask.svg" width="16%" alt="Gas mask"/>
<img src="./art/production/items/icons/source/radio_detector.svg" width="16%" alt="Detector"/>
</p>

[Полный каталог](./art/production/README.md) · [Manifest](./docs/RADZONE_ART_SOURCE_MANIFEST.json)


## Утверждённое визуальное направление
<p align="center"><img src="./github-assets/radzone-ui-storyboard.svg" width="100%" alt="RADZONE interface layout storyboard, not captured gameplay"/></p>
Утверждены реалистичная изометрическая пустошь, тяжёлые металлические панели, янтарные индикаторы и зелёный текст CRT-терминала. Старое название **REBORN MOBILE** заменено на **RADZONE**. Десять полноразмерных концептов подготовлены отдельно для загрузки; в GitHub пока опубликована векторная схема экранов.

> **Схема — векторная иллюстрация, не скриншот игры.** Полноразмерные концепты также не являются кадрами Android-сборки.

## Разработка

Текущая версия — Android-прототип на Godot 4.7.2. Механики проверяются по Fallout 2, а графические компоненты разрабатываются для последующей интеграции OpenCode.

[Art direction](./docs/ART_DIRECTION_RADZONE.md) · [Project state](./PROJECT_STATE.md) · [Asset handoff](./docs/RADZONE_OPENCODE_HANDOFF.md)

`git clone https://github.com/rf24kja/Fallout-mobile.git`
