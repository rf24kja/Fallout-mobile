from pathlib import Path
import json,re
root=Path('/mnt/data/radzone_readme_v4')
langs=[('en','English','README.md'),('ru','Русский','README.ru.md'),('es','Español','README.es.md'),('de','Deutsch','README.de.md'),('fr','Français','README.fr.md'),('zh','简体中文','README.zh-CN.md'),('uk','Українська','README.uk.md'),('th','ไทย','README.th.md')]
T={
'en':{
'eyebrow':'AN INDEPENDENT POST-APOCALYPTIC MOBILE RPG','tagline':'THE WASTELAND RETURNS. YOUR CHOICES REMAIN.','sub':'Classic role-playing depth. Tactical consequences. A ruined world built for your fingertips.','state':'IN DEVELOPMENT','godot':'GODOT 4.7.2','android':'ANDROID PROTOTYPE','nav':['The world','Your character','Survive & trade','Development'],
'hero_caption':'ART DIRECTION / APPROVED CONCEPT SCREENS — NOT ACTUAL GAMEPLAY CAPTURES',
'lead_heading':'A DIFFERENT KIND OF RETURN','lead_1':'RADZONE is an independent, Fallout 2-inspired mobile RPG project built around what made classic computer RPGs matter: **meaningful choices, SPECIAL-driven character development, turn-based tactical combat, hard-earned equipment and dialogue worth reading**.','lead_2':'The goal is not to shrink a desktop interface onto a phone. It is to bring its depth to a touch-first, landscape Android experience — with a detailed, weathered, cinematic wasteland of its own.','world_heading':'01 / STEP INTO THE RUINS','world_sub':'A world to explore, not just a map to tap.','world_text':'From forgotten settlements to dangerous roads, exploration, quests and reputation should make every journey feel consequential. **Isometric locations, world navigation and environmental storytelling** are core design targets.','char_heading':'02 / YOUR BUILD. YOUR CONSEQUENCES.','char_sub':'SPECIAL is more than seven letters.','char_text':'Attributes, skills, perks, experience and equipment shape the way a character survives. The design aims to keep that classic RPG depth while making complex decisions readable on a mobile screen.','surv_heading':'03 / EVERY BULLET. EVERY BARGAIN.','surv_sub':'The wasteland never gives anything away.','surv_text':'Scavenge containers, manage scarce equipment, barter for what you need and think through tactical encounters. Real inventory statistics and game-state values come from the **Godot systems**, not text painted into concept images.','combat_heading':'04 / THINK BEFORE YOU FIRE','combat_text':'Action points, aimed shots, damage resistance and tactical positioning are part of the gameplay work. Visible weapons, armor and directional combat poses are a major production focus — **not yet a finished in-game feature**.','dialogue_heading':'05 / THE WORDS YOU CHOOSE MATTER','dialogue_text':'Long-form, scrolling conversations and branching responses are central to the classic-RPG feel. Dense green CRT text, tactile metal controls and modern touch usability must work together.','gallery_heading':'THE VISUAL BIBLE','gallery_text':'These **10 approved images** define the artistic destination. They are concept illustrations, **not screenshots from a playable Android build**. Explore the complete catalog and full-size references.','lab_heading':'FROM ART DIRECTION TO GAME FILES','lab_text':'Production is moving beyond concepts: transparent item PNGs, directional character poses, atlases, Godot preview scenes and isolated combat effects are being prepared in GitHub. **Staged art is not automatically an approved or in-game-tested asset.**','lab_cta':'Explore the art production pull request','catalog_cta':'Open the full approved visual catalog','status_heading':'BUILD STATUS / NO SMOKE AND MIRRORS','status_intro':'An active Godot/Android prototype exists. The approved visual gallery is the quality target; there is **no announced public stable release**.','status_rows':[('Android / Godot','Active prototype; Godot 4.7.2 documented'),('RPG systems','Under fidelity testing and ongoing integration'),('Visual direction','10 approved concept screens'),('Production artwork','Candidate assets in staging; in-engine review required'),('Public release','Not announced')],
'dev_heading':'DEVELOPMENT & SOURCE','dev_text':'Want to follow progress or inspect the implementation? Explore the project state, visual requirements, technical documents and development history.','repo_cta':'Browse the repository','docs_cta':'Project status','equipment_cta':'Equipment system specification','fidelity_cta':'RPG fidelity matrix','license_note':'Independent fan-inspired project. Not affiliated with or endorsed by Bethesda, Interplay or the Fallout rights holders. Original commercial game files are not distributed.','follow':'FOLLOW THE DEVELOPMENT','follow_sub':'Star the repository to keep RADZONE on your radar. Watch for updates — no release date is being promised.'},
'ru':{
'eyebrow':'НЕЗАВИСИМАЯ МОБИЛЬНАЯ ПОСТАПОКАЛИПТИЧЕСКАЯ RPG','tagline':'ПУСТОШЬ ВОЗВРАЩАЕТСЯ. РЕШЕНИЯ ОСТАЮТСЯ.','sub':'Глубина классических RPG. Тактические последствия. Мир руин на экране смартфона.','state':'В РАЗРАБОТКЕ','godot':'GODOT 4.7.2','android':'ANDROID-ПРОТОТИП','nav':['Мир','Персонаж','Выживание и торговля','Разработка'],
'hero_caption':'УТВЕРЖДЁННЫЕ ХУДОЖЕСТВЕННЫЕ КОНЦЕПТЫ — НЕ СКРИНШОТЫ ИЗ ИГРЫ',
'lead_heading':'ВОЗВРАЩЕНИЕ К ГЛАВНОМУ','lead_1':'RADZONE — независимая мобильная RPG, вдохновлённая Fallout 2. Мы сохраняем то, за что любим классические ролевые игры: **вес решений, развитие персонажа через SPECIAL, тактические пошаговые сражения, ценность снаряжения и содержательные диалоги**.','lead_2':'Мы не просто уменьшаем компьютерный интерфейс. Мы переносим глубину классической RPG в мобильный ландшафтный формат с сенсорным управлением и собственным детализированным, мрачным миром.','world_heading':'01 / ШАГНИ В РУИНЫ','world_sub':'Мир для исследования, а не просто карта с кнопками.','world_text':'Забытые поселения, опасные дороги, задания и репутация должны придавать смысл каждому путешествию. **Изометрические локации, карта мира и истории окружения** — важнейшие ориентиры разработки.','char_heading':'02 / ТВОЙ ПЕРСОНАЖ. ТВОЯ СУДЬБА.','char_sub':'SPECIAL — это больше, чем семь букв.','char_text':'Характеристики, навыки, особенности, перки, опыт и экипировка определяют путь выживания. Мы стремимся сохранить глубину классической системы и сделать её удобной на экране телефона.','surv_heading':'03 / КАЖДЫЙ ПАТРОН. КАЖДАЯ СДЕЛКА.','surv_sub':'Пустошь ничего не отдаёт просто так.','surv_text':'Обыскивай контейнеры, распоряжайся редкими вещами, торгуй и продумывай каждый бой. Реальные значения характеристик и предметов должны поступать **из систем Godot**, а не быть нарисованными на концептах.','combat_heading':'04 / ПОДУМАЙ ПРЕЖДЕ, ЧЕМ СТРЕЛЯТЬ','combat_text':'Очки действия, прицельные выстрелы, сопротивление урону и позиционирование — часть игрового ядра. Видимое оружие, броня и боевые позы по направлениям — приоритет производства, **ещё не законченная функция игры**.','dialogue_heading':'05 / СЛОВА ИМЕЮТ ПОСЛЕДСТВИЯ','dialogue_text':'Длинные прокручиваемые диалоги с вариантами ответов — основа классической RPG. Зелёный терминальный текст, состаренный металл и удобные сенсорные элементы должны работать вместе.','gallery_heading':'ХУДОЖЕСТВЕННАЯ БИБЛИЯ RADZONE','gallery_text':'Эти **10 утверждённых изображений** задают планку качества. Это концепты, **не скриншоты работающей Android-игры**. Открой полный каталог и изображения в исходном размере.','lab_heading':'ОТ КОНЦЕПТА К ИГРОВОМУ РЕСУРСУ','lab_text':'Работа идёт дальше концептов: готовятся прозрачные PNG предметов, направленные позы, атласы, тестовые сцены Godot и отдельные эффекты выстрелов. **Материал в рабочей ветке ещё не означает проверенную интеграцию в игру.**','lab_cta':'Посмотреть PR с графикой','catalog_cta':'Каталог утверждённых референсов','status_heading':'СОСТОЯНИЕ ПРОЕКТА — БЕЗ ПРИУКРАШИВАНИЙ','status_intro':'У нас есть действующий прототип Godot/Android. Галерея показывает целевой уровень графики, а **дата публичного стабильного релиза не объявлена**.','status_rows':[('Android / Godot','Разрабатываемый прототип; задокументирован Godot 4.7.2'),('RPG-системы','Проверка соответствия и интеграция продолжаются'),('Визуальный стандарт','10 утверждённых концептов'),('Игровые ассеты','Кандидаты в отдельной ветке; нужна проверка в движке'),('Публичный релиз','Не объявлен')],
'dev_heading':'РАЗРАБОТКА И ИСХОДНИКИ','dev_text':'Хочешь следить за прогрессом или изучить реализацию? Открой состояние проекта, требования к графике, техническую документацию и историю разработки.','repo_cta':'Открыть репозиторий','docs_cta':'Состояние проекта','equipment_cta':'Спецификация экипировки','fidelity_cta':'Матрица соответствия RPG','license_note':'Независимый проект для поклонников классических RPG. Не связан с Bethesda, Interplay и правообладателями Fallout. Коммерческие файлы оригинальной игры здесь не распространяются.','follow':'СЛЕДИ ЗА РАЗРАБОТКОЙ','follow_sub':'Добавь репозиторий в избранное (Star) и включи уведомления (Watch), чтобы видеть обновления. Дату релиза пока не обещаем.'},
'es':{
'eyebrow':'UN RPG MÓVIL POSAPOCALÍPTICO INDEPENDIENTE','tagline':'EL YERMO REGRESA. TUS DECISIONES PERMANECEN.','sub':'Profundidad clásica. Consecuencias tácticas. Un mundo en ruinas al alcance de tus dedos.','state':'EN DESARROLLO','godot':'GODOT 4.7.2','android':'PROTOTIPO ANDROID','nav':['El mundo','Tu personaje','Supervivencia y trueque','Desarrollo'],
'hero_caption':'ARTE CONCEPTUAL APROBADO — NO SON CAPTURAS DEL JUEGO',
'lead_heading':'UN REGRESO A LO ESENCIAL','lead_1':'RADZONE es un RPG móvil independiente inspirado en Fallout 2. Buscamos recuperar la esencia de los grandes RPG: **decisiones relevantes, desarrollo SPECIAL, combate táctico por turnos, equipo valioso y conversaciones que merece la pena leer**.','lead_2':'No se trata de encoger una interfaz de PC. Queremos llevar su profundidad a Android en horizontal, con controles táctiles y un yermo cinematográfico propio.','world_heading':'01 / ENTRA EN LAS RUINAS','world_sub':'Un mundo para explorar, no solo un mapa que tocar.','world_text':'Asentamientos olvidados, rutas peligrosas, misiones y reputación deben dar peso a cada viaje. **Lugares isométricos, mapa mundial y narrativa ambiental** guían el diseño.','char_heading':'02 / TU PERSONAJE. TUS CONSECUENCIAS.','char_sub':'SPECIAL es mucho más que siete letras.','char_text':'Atributos, habilidades, ventajas, experiencia y equipamiento determinan cómo sobrevives. Conservamos la ambición del RPG clásico con legibilidad para móviles.','surv_heading':'03 / CADA BALA. CADA TRATO.','surv_sub':'El yermo no regala nada.','surv_text':'Busca recursos, administra equipo escaso, comercia y piensa cada encuentro. Los valores reales del inventario y del personaje proceden de los **sistemas de Godot**, no de cifras dibujadas en imágenes conceptuales.','combat_heading':'04 / PIENSA ANTES DE DISPARAR','combat_text':'Puntos de acción, disparos dirigidos, resistencia al daño y posicionamiento forman parte del desarrollo. Armas y armaduras visibles son una prioridad, **todavía no una función terminada dentro del juego**.','dialogue_heading':'05 / LAS PALABRAS CAMBIAN LAS COSAS','dialogue_text':'Los diálogos extensos y desplazables con respuestas ramificadas son esenciales. Texto CRT verde, metal envejecido y controles táctiles deben convivir.','gallery_heading':'LA BIBLIA VISUAL','gallery_text':'Estas **10 imágenes aprobadas** definen el objetivo artístico. Son conceptos, **no capturas de una versión Android jugable**. Consulta el catálogo completo.','lab_heading':'DEL CONCEPTO AL RECURSO REAL','lab_text':'Estamos preparando PNG transparentes, poses direccionales, atlas, escenas de prueba de Godot y efectos de combate. **Un recurso en preparación no equivale a una integración verificada en el juego.**','lab_cta':'Ver el PR de producción gráfica','catalog_cta':'Abrir catálogo visual aprobado','status_heading':'ESTADO REAL DEL PROYECTO','status_intro':'Existe un prototipo activo en Godot/Android. Las imágenes aprobadas señalan el nivel visual deseado; **no se ha anunciado un lanzamiento público estable**.','status_rows':[('Android / Godot','Prototipo activo; Godot 4.7.2 documentado'),('Sistemas RPG','Verificación e integración en curso'),('Dirección artística','10 pantallas conceptuales aprobadas'),('Recursos de producción','Candidatos en preparación; pendientes de prueba'),('Lanzamiento público','No anunciado')],
'dev_heading':'DESARROLLO Y CÓDIGO','dev_text':'Consulta el estado del proyecto, los requisitos visuales, la documentación técnica y el historial de cambios.','repo_cta':'Explorar repositorio','docs_cta':'Estado del proyecto','equipment_cta':'Especificación de equipo','fidelity_cta':'Matriz de fidelidad RPG','license_note':'Proyecto independiente inspirado en los RPG clásicos. No está afiliado a Bethesda, Interplay ni a los titulares de Fallout. No distribuimos archivos comerciales del juego original.','follow':'SIGUE EL DESARROLLO','follow_sub':'Marca el repositorio con una estrella y activa Watch para seguir los avances, sin promesas de fecha de lanzamiento.'},
'de':{
'eyebrow':'EIN UNABHÄNGIGES POSTAPOKALYPTISCHES MOBILE-RPG','tagline':'DAS ÖDLAND KEHRT ZURÜCK. DEINE ENTSCHEIDUNGEN BLEIBEN.','sub':'Klassische Rollenspieltiefe. Taktische Konsequenzen. Eine Welt aus Ruinen auf dem Smartphone.','state':'IN ENTWICKLUNG','godot':'GODOT 4.7.2','android':'ANDROID-PROTOTYP','nav':['Die Welt','Dein Charakter','Überleben & Handel','Entwicklung'],
'hero_caption':'FREIGEGEBENE VISUELLE KONZEPTE — KEINE ECHTEN GAMEPLAY-SCREENSHOTS',
'lead_heading':'DIE RÜCKKEHR ZUM WESENTLICHEN','lead_1':'RADZONE ist ein unabhängiges, von Fallout 2 inspiriertes Mobile-RPG. Im Mittelpunkt stehen **echte Entscheidungen, SPECIAL-basierte Charakterentwicklung, taktische Rundenkämpfe, wertvolle Ausrüstung und tiefgehende Dialoge**.','lead_2':'Wir verkleinern nicht einfach eine PC-Oberfläche. Unser Ziel ist die klassische Tiefe mit Touch-Steuerung im Android-Querformat und einer eigenständigen, filmreifen Ödlandwelt.','world_heading':'01 / BETRITT DIE RUINEN','world_sub':'Eine Welt zum Erkunden, nicht nur zum Antippen.','world_text':'Vergessene Siedlungen, gefährliche Straßen, Quests und Ruf sollen jede Reise prägen. **Isometrische Orte, Weltkarte und Environmental Storytelling** bestimmen die Gestaltung.','char_heading':'02 / DEIN CHARAKTER. DEINE FOLGEN.','char_sub':'SPECIAL ist mehr als sieben Buchstaben.','char_text':'Attribute, Fähigkeiten, Perks, Erfahrung und Ausrüstung entscheiden, wie du überlebst. Anspruchsvolle RPG-Systeme sollen auch auf dem Handy übersichtlich bleiben.','surv_heading':'03 / JEDE KUGEL. JEDER HANDEL.','surv_sub':'Im Ödland ist nichts umsonst.','surv_text':'Plündere Behälter, verwalte knappe Vorräte, handle und plane jeden Kampf. Inventarwerte stammen aus den **echten Godot-Systemen** statt aus Beschriftungen in Konzeptbildern.','combat_heading':'04 / ERST DENKEN, DANN SCHIESSEN','combat_text':'Aktionspunkte, gezielte Treffer, Schadensresistenz und Positionierung gehören zur Gameplay-Entwicklung. Sichtbare Waffen und Rüstung sind ein Schwerpunkt, **aber noch kein fertig integriertes Feature**.','dialogue_heading':'05 / WORTE HABEN FOLGEN','dialogue_text':'Lange, scrollbare Dialoge mit verzweigten Antworten prägen das Spielgefühl. Grüner CRT-Text, abgenutztes Metall und Touch-Bedienbarkeit gehören zusammen.','gallery_heading':'DIE VISUELLE BIBEL','gallery_text':'Diese **10 freigegebenen Bilder** definieren das künstlerische Ziel. Es sind Konzepte, **keine Screenshots eines spielbaren Android-Builds**.','lab_heading':'VOM KONZEPT ZUM SPIELASSET','lab_text':'Transparente Item-PNGs, Richtungsposen, Atlanten, Godot-Test-Szenen und separate Kampfeffekte werden vorbereitet. **Ein Entwurf im Staging ist noch kein im Spiel verifiziertes Asset.**','lab_cta':'Grafik-Produktions-PR ansehen','catalog_cta':'Freigegebenen Katalog öffnen','status_heading':'PROJEKTSTATUS — OHNE BLENDER','status_intro':'Ein Godot/Android-Prototyp ist aktiv. Die freigegebenen Konzepte zeigen das Qualitätsziel; **ein öffentliches stabiles Release ist nicht angekündigt**.','status_rows':[('Android / Godot','Aktiver Prototyp; Godot 4.7.2 dokumentiert'),('RPG-Systeme','Abgleich und Integration laufen'),('Art Direction','10 freigegebene Konzeptbilder'),('Produktionsassets','Staging-Kandidaten; Test im Spiel ausstehend'),('Öffentlicher Release','Nicht angekündigt')],
'dev_heading':'ENTWICKLUNG & QUELLCODE','dev_text':'Projektstatus, visuelle Anforderungen, technische Dokumentation und Entwicklungshistorie sind öffentlich einsehbar.','repo_cta':'Repository öffnen','docs_cta':'Projektstatus','equipment_cta':'Ausrüstungs-Spezifikation','fidelity_cta':'RPG-Treue-Matrix','license_note':'Unabhängiges, von klassischen RPGs inspiriertes Projekt. Keine Verbindung zu Bethesda, Interplay oder den Fallout-Rechteinhabern. Originale kommerzielle Spieldateien werden nicht verbreitet.','follow':'ENTWICKLUNG VERFOLGEN','follow_sub':'Gib dem Repository einen Stern und aktiviere Watch für Neuigkeiten — ohne versprochenen Releasetermin.'},
'fr':{
'eyebrow':'UN RPG MOBILE POST-APOCALYPTIQUE INDÉPENDANT','tagline':'LES TERRES DÉSOLÉES REVIENNENT. VOS CHOIX RESTENT.','sub':'La profondeur du RPG classique. Des conséquences tactiques. Un monde en ruines sur mobile.','state':'EN DÉVELOPPEMENT','godot':'GODOT 4.7.2','android':'PROTOTYPE ANDROID','nav':['Le monde','Votre personnage','Survie & troc','Développement'],
'hero_caption':'DIRECTION ARTISTIQUE APPROUVÉE — PAS DES CAPTURES DU JEU',
'lead_heading':'LE RETOUR À L’ESSENTIEL','lead_1':'RADZONE est un RPG mobile indépendant inspiré de Fallout 2. Nous voulons retrouver **des choix qui comptent, la progression SPECIAL, des combats tactiques au tour par tour, un équipement précieux et des dialogues profonds**.','lead_2':'L’objectif n’est pas de réduire une interface PC. Nous souhaitons adapter la richesse du RPG classique au format paysage tactile sur Android, dans un univers post-apocalyptique cinématographique original.','world_heading':'01 / ENTREZ DANS LES RUINES','world_sub':'Un monde à explorer, pas seulement une carte à toucher.','world_text':'Villages oubliés, routes dangereuses, quêtes et réputation doivent donner du poids à chaque trajet. **Lieux isométriques, carte du monde et narration environnementale** guident la création.','char_heading':'02 / VOTRE PERSONNAGE. VOS CONSÉQUENCES.','char_sub':'SPECIAL est bien plus que sept lettres.','char_text':'Attributs, compétences, aptitudes, expérience et équipement déterminent les possibilités de survie. La profondeur du RPG doit rester lisible sur smartphone.','surv_heading':'03 / CHAQUE BALLE. CHAQUE ÉCHANGE.','surv_sub':'Les terres désolées ne donnent rien gratuitement.','surv_text':'Fouillez, gérez des ressources rares, négociez et réfléchissez avant chaque combat. Les statistiques de l’inventaire viennent des **systèmes Godot réels**, pas de chiffres peints sur les concepts.','combat_heading':'04 / RÉFLÉCHIR AVANT DE TIRER','combat_text':'Points d’action, tirs ciblés, résistance aux dégâts et placement font partie du travail sur le gameplay. Armes et armures visibles sont prioritaires, **mais pas encore intégrées comme fonction finale**.','dialogue_heading':'05 / CHAQUE MOT PEUT TOUT CHANGER','dialogue_text':'Les longs dialogues défilants avec choix multiples sont essentiels. Texte CRT vert, métal usé et ergonomie tactile doivent fonctionner ensemble.','gallery_heading':'LA BIBLE VISUELLE','gallery_text':'Ces **10 images approuvées** fixent l’ambition artistique. Ce sont des concepts, **pas des captures d’une version Android jouable**.','lab_heading':'DU CONCEPT AU FICHIER DE JEU','lab_text':'PNG transparents, poses directionnelles, atlas, scènes de test Godot et effets de combat séparés sont en préparation. **Un asset en staging n’est pas automatiquement validé dans le jeu.**','lab_cta':'Voir la PR de production graphique','catalog_cta':'Ouvrir le catalogue approuvé','status_heading':'ÉTAT DU PROJET — SANS FAUSSES PROMESSES','status_intro':'Un prototype Godot/Android actif existe. La galerie présente l’objectif visuel ; **aucune sortie publique stable n’a été annoncée**.','status_rows':[('Android / Godot','Prototype actif ; Godot 4.7.2 documenté'),('Systèmes RPG','Vérification et intégration en cours'),('Direction artistique','10 écrans conceptuels approuvés'),('Assets de production','Candidats en staging ; tests nécessaires'),('Sortie publique','Non annoncée')],
'dev_heading':'DÉVELOPPEMENT & CODE SOURCE','dev_text':'Retrouvez l’état du projet, les exigences visuelles, la documentation technique et l’historique des avancées.','repo_cta':'Explorer le dépôt','docs_cta':'État du projet','equipment_cta':'Spécification de l’équipement','fidelity_cta':'Matrice de fidélité RPG','license_note':'Projet indépendant inspiré des RPG classiques. Aucun lien avec Bethesda, Interplay ou les détenteurs des droits Fallout. Les fichiers commerciaux originaux ne sont pas distribués.','follow':'SUIVEZ LE DÉVELOPPEMENT','follow_sub':'Ajoutez une étoile au dépôt et activez Watch pour suivre l’avancement, sans promesse de date de sortie.'},
'zh':{
'eyebrow':'独立开发的末日废土手机角色扮演游戏','tagline':'废土归来。你的选择将留下痕迹。','sub':'经典 RPG 的深度、回合制战术的抉择，以及掌中的末日世界。','state':'开发中','godot':'GODOT 4.7.2','android':'ANDROID 原型','nav':['探索世界','角色成长','生存与交易','开发进度'],
'hero_caption':'已确认的美术概念图 — 并非游戏实机截图',
'lead_heading':'找回经典 RPG 的核心','lead_1':'RADZONE 是受 Fallout 2 启发、独立开发的手机 RPG。我们希望保留经典作品的魅力：**有分量的选择、SPECIAL 角色成长、回合制战术战斗、重要的装备管理以及值得细读的对话**。','lead_2':'我们不只是把电脑界面缩小到手机上，而是努力将深度玩法带入适合 Android 横屏与触控操作的原创电影感废土世界。','world_heading':'01 / 走进废墟','world_sub':'这是一片值得探索的世界，而不只是一张地图。','world_text':'被遗忘的聚落、危险的道路、任务与声望，都应让旅程更有意义。**等距视角场景、世界地图与环境叙事**是重要的设计方向。','char_heading':'02 / 塑造角色。承担后果。','char_sub':'SPECIAL 远不止七个字母。','char_text':'属性、技能、特长、经验和装备决定角色如何生存。我们希望在保留复杂 RPG 机制的同时，让它们在手机屏幕上清晰易用。','surv_heading':'03 / 每一发子弹。每一笔交易。','surv_sub':'废土不会平白给予任何东西。','surv_text':'搜寻容器、管理稀缺物资、以物易物，并慎重考虑每场战斗。装备属性与游戏数值应来自**真实的 Godot 游戏系统**，而非直接画在概念图上。','combat_heading':'04 / 开火前先思考','combat_text':'行动点数、部位瞄准、伤害抗性和战术站位均属于玩法开发范围。可见的武器和装甲是重点，**但仍未完成实机整合**。','dialogue_heading':'05 / 对话也会改变命运','dialogue_text':'长篇可滚动对话和分支选项是经典 RPG 的灵魂。绿色 CRT 文字、旧金属界面与现代触控体验需要相互配合。','gallery_heading':'官方确认的美术方向','gallery_text':'这 **10 张已确认的图片**定义了美术目标。它们是概念图，**不是可运行 Android 游戏的截图**。','lab_heading':'从概念走向游戏资源','lab_text':'项目正在制作透明 PNG 道具、八方向角色姿势、图集、Godot 测试场景和独立战斗特效。**暂存资源不代表已通过游戏内测试。**','lab_cta':'查看美术制作 PR','catalog_cta':'查看完整概念图库','status_heading':'真实的项目状态','status_intro':'目前已有正在开发的 Godot/Android 原型。展示图代表目标品质；**尚未公布正式公开发行日期**。','status_rows':[('Android / Godot','开发中的原型；文档记录 Godot 4.7.2'),('RPG 系统','正在验证与整合'),('美术方向','10 张已确认的概念图'),('制作资源','暂存候选资源；需要游戏内验证'),('公开发布','尚未公布')],
'dev_heading':'开发与源代码','dev_text':'欢迎查看项目状态、视觉规范、技术文档与开发记录。','repo_cta':'浏览代码仓库','docs_cta':'项目状态','equipment_cta':'装备系统规范','fidelity_cta':'RPG 机制对照表','license_note':'本项目为独立开发、受经典 RPG 启发的作品，与 Bethesda、Interplay 或 Fallout 权利人无关联；不分发原版商业游戏资源。','follow':'关注开发进度','follow_sub':'欢迎为仓库点 Star 并开启 Watch，及时了解进展。我们尚未承诺发布日期。'},
'uk':{
'eyebrow':'НЕЗАЛЕЖНА МОБІЛЬНА ПОСТАПОКАЛІПТИЧНА RPG','tagline':'ПУСТКА ПОВЕРТАЄТЬСЯ. ВИБІР ЗАЛИШАЄТЬСЯ.','sub':'Глибина класичної RPG. Тактичні наслідки. Світ руїн на вашому смартфоні.','state':'У РОЗРОБЦІ','godot':'GODOT 4.7.2','android':'ANDROID-ПРОТОТИП','nav':['Світ','Персонаж','Виживання й торгівля','Розробка'],
'hero_caption':'ЗАТВЕРДЖЕНІ ХУДОЖНІ КОНЦЕПТИ — НЕ СКРИНШОТИ З ГРИ',
'lead_heading':'ПОВЕРНЕННЯ ДО ГОЛОВНОГО','lead_1':'RADZONE — незалежна мобільна RPG, натхненна Fallout 2. Ми прагнемо зберегти найцінніше: **вагомі рішення, розвиток через SPECIAL, тактичні покрокові бої, цінність спорядження та змістовні діалоги**.','lead_2':'Ми не просто зменшуємо комп’ютерний інтерфейс. Мета — перенести глибину класичної RPG до сенсорного Android у горизонтальному форматі з власним кінематографічним світом пустки.','world_heading':'01 / КРОК У РУЇНИ','world_sub':'Світ для досліджень, а не лише карта з кнопками.','world_text':'Забуті поселення, небезпечні дороги, завдання й репутація мають надавати кожній мандрівці значення. **Ізометричні локації, мапа світу та історії довкілля** є основою художнього напрямку.','char_heading':'02 / ТВІЙ ПЕРСОНАЖ. ТВОЇ НАСЛІДКИ.','char_sub':'SPECIAL — це більше, ніж сім літер.','char_text':'Характеристики, навички, перки, досвід і спорядження визначають виживання. Ми хочемо зберегти глибину класичної RPG і зробити її зручною для смартфона.','surv_heading':'03 / КОЖЕН НАБІЙ. КОЖНА УГОДА.','surv_sub':'Пустка нічого не віддає задарма.','surv_text':'Шукай ресурси, керуй обмеженим спорядженням, торгуй і обдумуй кожний бій. Значення інвентаря беруться з **реальних систем Godot**, а не намальовані на концептах.','combat_heading':'04 / ДУМАЙ ПЕРЕД ПОСТРІЛОМ','combat_text':'Очки дії, прицільні постріли, опір шкоді та позиціонування входять до роботи над геймплеєм. Видима зброя й броня — пріоритет, **але ще не завершена ігрова функція**.','dialogue_heading':'05 / СЛОВА МАЮТЬ НАСЛІДКИ','dialogue_text':'Довгі діалоги з прокруткою та розгалуженими відповідями — основа класичної RPG. Зелений CRT-текст, старий метал і сенсорне керування мають працювати разом.','gallery_heading':'ХУДОЖНЯ БІБЛІЯ RADZONE','gallery_text':'Ці **10 затверджених зображень** задають художній орієнтир. Це концепти, **не скриншоти робочої Android-гри**.','lab_heading':'ВІД КОНЦЕПТУ ДО ІГРОВОГО ФАЙЛУ','lab_text':'Готуються прозорі PNG предметів, напрямні пози персонажів, атласи, тестові сцени Godot та окремі бойові ефекти. **Ресурс у staging ще не означає перевірену інтеграцію.**','lab_cta':'Переглянути PR з графікою','catalog_cta':'Відкрити каталог референсів','status_heading':'СТАН ПРОЄКТУ — БЕЗ ПРИКРАС','status_intro':'Є активний прототип Godot/Android. Галерея показує цільову якість; **дату публічного стабільного релізу ще не оголошено**.','status_rows':[('Android / Godot','Активний прототип; задокументовано Godot 4.7.2'),('RPG-системи','Перевірка та інтеграція тривають'),('Візуальний стандарт','10 затверджених концептів'),('Виробничі ресурси','Кандидати в staging; потрібні тести у грі'),('Публічний реліз','Не оголошено')],
'dev_heading':'РОЗРОБКА Й ВИХІДНИЙ КОД','dev_text':'Дивіться стан проєкту, візуальні вимоги, технічні документи та історію розробки.','repo_cta':'Перейти до репозиторію','docs_cta':'Стан проєкту','equipment_cta':'Специфікація спорядження','fidelity_cta':'Матриця відповідності RPG','license_note':'Незалежний проєкт, натхненний класичними RPG. Не пов’язаний із Bethesda, Interplay або власниками прав на Fallout. Комерційні файли оригінальної гри не поширюються.','follow':'СТЕЖ ЗА РОЗРОБКОЮ','follow_sub':'Додайте репозиторій до Star і ввімкніть Watch, щоб отримувати оновлення. Дату виходу поки не обіцяємо.'},
'th':{
'eyebrow':'เกม RPG มือถือโลกหลังหายนะแบบอิสระ','tagline':'ดินแดนรกร้างกลับมาแล้ว ทุกการตัดสินใจมีผล','sub':'ความลึกของ RPG คลาสสิก กลยุทธ์ที่มีความหมาย และโลกที่พังทลายบนมือถือ','state':'กำลังพัฒนา','godot':'GODOT 4.7.2','android':'ต้นแบบ ANDROID','nav':['สำรวจโลก','ตัวละคร','เอาตัวรอดและแลกเปลี่ยน','การพัฒนา'],
'hero_caption':'ภาพแนวทางศิลป์ที่ได้รับการอนุมัติ — ไม่ใช่ภาพหน้าจอจากเกมจริง',
'lead_heading':'คืนหัวใจของ RPG คลาสสิก','lead_1':'RADZONE เป็นโครงการเกม RPG มือถืออิสระที่ได้รับแรงบันดาลใจจาก Fallout 2 เราต้องการรักษาสิ่งสำคัญของเกมคลาสสิก: **ทางเลือกที่มีความหมาย การพัฒนาตัวละครแบบ SPECIAL การต่อสู้เชิงกลยุทธ์แบบผลัดตา อุปกรณ์ที่มีคุณค่า และบทสนทนาที่น่าติดตาม**','lead_2':'เราไม่ได้เพียงย่อหน้าจอ PC ให้เล็กลง แต่ตั้งใจนำระบบ RPG ที่ลึกซึ้งมาสู่ Android แนวนอนแบบสัมผัส พร้อมโลกหลังหายนะที่มีเอกลักษณ์และภาพสไตล์ภาพยนตร์','world_heading':'01 / ก้าวสู่ซากปรักหักพัง','world_sub':'โลกสำหรับออกสำรวจ ไม่ใช่แค่แผนที่ให้แตะ','world_text':'ชุมชนที่ถูกลืม เส้นทางอันตราย ภารกิจ และชื่อเสียงควรส่งผลต่อการเดินทาง **ฉากไอโซเมตริก แผนที่โลก และการเล่าเรื่องผ่านสภาพแวดล้อม** คือเป้าหมายสำคัญ','char_heading':'02 / ตัวละครของคุณ ผลลัพธ์ของคุณ','char_sub':'SPECIAL ไม่ใช่เพียงตัวอักษรเจ็ดตัว','char_text':'ค่าสถานะ ทักษะ Perks ประสบการณ์ และอุปกรณ์กำหนดวิธีเอาตัวรอด เราต้องการรักษาความลึกของ RPG โดยทำให้ใช้งานบนมือถือได้ง่าย','surv_heading':'03 / ทุกกระสุน ทุกการแลกเปลี่ยน','surv_sub':'ในดินแดนรกร้าง ไม่มีอะไรได้มาฟรี ๆ','surv_text':'ค้นหาสิ่งของ จัดการทรัพยากรที่จำกัด แลกเปลี่ยนอุปกรณ์ และคิดก่อนทุกการปะทะ ค่าสถานะและข้อมูลไอเท็มต้องมาจาก **ระบบเกมจริงใน Godot** ไม่ใช่ตัวเลขที่วาดลงบนภาพต้นแบบ','combat_heading':'04 / คิดก่อนยิง','combat_text':'แต้มการกระทำ การเล็งเฉพาะจุด ความต้านทานความเสียหาย และตำแหน่งในการต่อสู้เป็นส่วนหนึ่งของระบบเกม อาวุธและชุดเกราะที่มองเห็นบนตัวละครเป็นงานสำคัญ **แต่ยังไม่ใช่ระบบที่สมบูรณ์ในเกมจริง**','dialogue_heading':'05 / คำพูดเปลี่ยนทุกอย่าง','dialogue_text':'บทสนทนายาวที่เลื่อนอ่านได้และตัวเลือกหลายเส้นทางคือหัวใจของ RPG คลาสสิก ตัวอักษร CRT สีเขียว โลหะเก่า และการควบคุมด้วยระบบสัมผัสต้องทำงานร่วมกัน','gallery_heading':'แนวทางภาพที่อนุมัติแล้ว','gallery_text':'**ภาพ 10 ภาพที่อนุมัติแล้ว** กำหนดเป้าหมายคุณภาพงานศิลป์ ภาพเหล่านี้เป็นคอนเซ็ปต์ **ไม่ใช่ภาพหน้าจอ Android จากเกมที่เล่นได้จริง**','lab_heading':'จากคอนเซ็ปต์สู่ไฟล์เกม','lab_text':'ทีมกำลังเตรียมภาพไอเท็ม PNG แบบโปร่งใส ท่าทางตัวละครหลายทิศทาง แอตลาส ฉากทดสอบ Godot และเอฟเฟกต์การต่อสู้ **ไฟล์ในสาขาทดลองยังไม่ถือว่าผ่านการทดสอบในเกมจริง**','lab_cta':'ดู Pull Request งานกราฟิก','catalog_cta':'ดูแกลเลอรีภาพที่อนุมัติ','status_heading':'สถานะการพัฒนาจริง','status_intro':'มีต้นแบบ Godot/Android ที่อยู่ระหว่างพัฒนา ภาพคอนเซ็ปต์แสดงระดับคุณภาพเป้าหมาย และ **ยังไม่ประกาศวันเปิดตัวเวอร์ชันเสถียร**','status_rows':[('Android / Godot','ต้นแบบอยู่ระหว่างพัฒนา; เอกสารใช้ Godot 4.7.2'),('ระบบ RPG','กำลังตรวจสอบและผสานระบบ'),('แนวทางภาพ','คอนเซ็ปต์ที่อนุมัติ 10 ภาพ'),('กราฟิกสำหรับเกม','ไฟล์ทดลอง ต้องตรวจสอบในเกมจริง'),('เปิดตัวสู่สาธารณะ','ยังไม่ประกาศ')],
'dev_heading':'การพัฒนาและซอร์สโค้ด','dev_text':'ดูสถานะโครงการ แนวทางภาพ เอกสารทางเทคนิค และประวัติการพัฒนาได้ที่นี่','repo_cta':'เปิดคลังโค้ด','docs_cta':'สถานะโครงการ','equipment_cta':'ข้อกำหนดระบบอุปกรณ์','fidelity_cta':'ตารางเปรียบเทียบระบบ RPG','license_note':'โครงการอิสระที่ได้รับแรงบันดาลใจจาก RPG คลาสสิก ไม่มีความเกี่ยวข้องกับ Bethesda, Interplay หรือผู้ถือสิทธิ์ Fallout และไม่เผยแพร่ไฟล์เชิงพาณิชย์จากเกมต้นฉบับ','follow':'ติดตามการพัฒนา','follow_sub':'กด Star และ Watch เพื่อรับข่าวสาร โดยยังไม่มีการให้คำมั่นเรื่องวันวางจำหน่าย'}
}
base='github-assets/approved/v2/'
photos=[('01-main-menu.webp','main menu'),('07-tactical-combat.webp','tactical combat'),('03-dialogue.webp','dialogue'),('06-exploration.webp','exploration'),('04-world-map-quests.webp','world map and quests'),('02-character-special.webp','character creation'),('10-skills-perks.webp','skills and perks'),('05-inventory-icon-reference.webp','inventory'),('08-barter.webp','barter'),('09-loot-container.webp','loot container')]
def img(filename, label, width):
    src=f'./{base}{filename}'
    return f'<a href="{src}"><img src="{src}" width="{width}" alt="RADZONE approved concept art — {label}" /></a>'
def group(items,width):return '<p align="center">\n'+ '\n'.join(img(k,v,width) for k,v in items)+'\n</p>'
navlinks=' &nbsp;│&nbsp; '.join(f'<a href="./{fn}">{label}</a>' for _,label,fn in langs)
blocks=[]
for lang,label,file in langs:
    d=T[lang];title='# RADZONE\n'
    content=f'''<!-- RADZONE GitHub Showcase v4 — maintained visual presentation. Approved art ≠ in-game captures. -->

<div align="center">

<p><sub><strong>{d['eyebrow']}</strong></sub></p>

<h1>RADZONE</h1>

<h2>{d['tagline']}</h2>

<p>{d['sub']}</p>

<p>{navlinks}</p>

<p><code>{d['state']}</code> &nbsp;·&nbsp; <code>{d['godot']}</code> &nbsp;·&nbsp; <code>{d['android']}</code></p>

</div>

{group(photos[:3],'31%')}

<p align="center"><sub>◈ {d['hero_caption']} ◈</sub></p>

<p align="center"><a href="#world">{d['nav'][0]}</a> &nbsp;·&nbsp; <a href="#character">{d['nav'][1]}</a> &nbsp;·&nbsp; <a href="#survival">{d['nav'][2]}</a> &nbsp;·&nbsp; <a href="#development">{d['nav'][3]}</a></p>

---

## {d['lead_heading']}

{d['lead_1']}

{d['lead_2']}

<a id="world"></a>
## {d['world_heading']}

### {d['world_sub']}

{d['world_text']}

{group(photos[3:5],'43%')}

<a id="character"></a>
## {d['char_heading']}

### {d['char_sub']}

{d['char_text']}

{group(photos[5:7],'43%')}

<a id="survival"></a>
## {d['surv_heading']}

### {d['surv_sub']}

{d['surv_text']}

{group(photos[7:10],'31%')}

## {d['combat_heading']}

{d['combat_text']}

## {d['dialogue_heading']}

{d['dialogue_text']}

---

## {d['gallery_heading']}

{d['gallery_text']}

<p align="center"><a href="./docs/art/APPROVED_VISUAL_CATALOG.md"><strong>◈ {d['catalog_cta']} ◈</strong></a></p>

## {d['lab_heading']}

{d['lab_text']}

<p align="center"><a href="https://github.com/rf24kja/Fallout-mobile/pull/28"><strong>⚙ {d['lab_cta']}</strong></a></p>

<a id="development"></a>
## {d['status_heading']}

{d['status_intro']}

| | |
|:--|:--|
'''+ '\n'.join(f'| **{a}** | {b} |' for a,b in d['status_rows']) +f'''

## {d['dev_heading']}

{d['dev_text']}

**[{d['repo_cta']}](https://github.com/rf24kja/Fallout-mobile)** &nbsp;·&nbsp; [{d['docs_cta']}](./PROJECT_STATE.md) &nbsp;·&nbsp; [{d['equipment_cta']}](./docs/art/CHARACTER_EQUIPMENT_VISUAL_SPEC.md) &nbsp;·&nbsp; [{d['fidelity_cta']}](./docs/FALLOUT2_FIDELITY_MATRIX.md)

<details>
<summary>📂 Technical documentation / Документация / Documents</summary>

- [Approved visual direction](./docs/ART_DIRECTION_RADZONE.md)
- [Approved art catalog](./docs/art/APPROVED_VISUAL_CATALOG.md)
- [Character and equipment graphics](./docs/art/CHARACTER_EQUIPMENT_VISUAL_SPEC.md)
- [NPC appearance diversity](./docs/art/NPC_VISUAL_DIVERSITY.md)
- [Art production workflow](./docs/art/ART_PRODUCTION_WORKFLOW.md)
- [OpenCode development handoff](./docs/art/OPENCODE_ART_HANDOFF.md)
- [Recovery guide](./docs/RECOVERY_GUIDE.md)

</details>

---

<div align="center">

### {d['follow']}

{d['follow_sub']}

<strong>RADZONE</strong> &nbsp;·&nbsp; <a href="https://github.com/rf24kja/Fallout-mobile">github.com/rf24kja/Fallout-mobile</a>

<sub>{d['license_note']}</sub>

</div>
'''
    showcase = (
        '<p align="center">\n'
        '<a href="./github-assets/showcase/survivor-combat-poses.webp"><img src="./github-assets/showcase/survivor-combat-poses.webp" width="57%" alt="RADZONE in-production survivor directional poses; not gameplay" /></a>\n'
        '<a href="./github-assets/showcase/inventory-icons.webp"><img src="./github-assets/showcase/inventory-icons.webp" width="39%" alt="RADZONE candidate inventory art; not gameplay" /></a>\n'
        '</p>\n'
        '<p align="center"><sub>WORK IN PROGRESS / STAGED ART ASSETS / NOT VERIFIED IN-GAME</sub></p>\n'
    )
    marker='<p align="center"><a href="https://github.com/rf24kja/Fallout-mobile/pull/28">'
    assert marker in content
    content=content.replace(marker,showcase+'\n'+marker,1)
    local_captions = {'ru': ('НЕПРОВЕРЕННЫЕ В ИГРЕ РАБОЧИЕ АССЕТЫ', '📂 Техническая документация'), 'es': ('RECURSOS EN DESARROLLO / SIN VERIFICAR EN EL JUEGO', '📂 Documentación técnica'), 'de': ('ASSETS IN ARBEIT / NOCH NICHT IM SPIEL GEPRÜFT', '📂 Technische Dokumentation'), 'fr': ('ASSETS EN DÉVELOPPEMENT / NON TESTÉS DANS LE JEU', '📂 Documentation technique'), 'zh': ('开发中的资源 / 尚未通过游戏内验证', '📂 技术文档'), 'uk': ('РОБОЧІ АСЕТИ / НЕ ПЕРЕВІРЕНІ У ГРІ', '📂 Технічна документація'), 'th': ('กราฟิกอยู่ระหว่างพัฒนา / ยังไม่ผ่านการทดสอบในเกม', '📂 เอกสารทางเทคนิค')}
    if lang in local_captions:
        a,b=local_captions[lang]
        content=content.replace('WORK IN PROGRESS / STAGED ART ASSETS / NOT VERIFIED IN-GAME',a)
        content=content.replace('📂 Technical documentation / Документация / Documents',b)
    path=root/file
    path.write_text(content,encoding='utf-8')
    blocks.append({'lang':lang,'path':file,'chars':len(content),'images':content.count('<img '),'links':len(re.findall(r'\]\(',content)),'sections':len(re.findall(r'^## ',content,flags=re.M))})
(root/'report.json').write_text(json.dumps(blocks,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps(blocks,ensure_ascii=False,indent=2))