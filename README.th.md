<!-- RADZONE GitHub Showcase v4 — maintained visual presentation. Approved art ≠ in-game captures. -->

<div align="center">

<p><sub><strong>เกม RPG มือถือโลกหลังหายนะแบบอิสระ</strong></sub></p>

<h1>RADZONE</h1>

<h2>ดินแดนรกร้างกลับมาแล้ว ทุกการตัดสินใจมีผล</h2>

<p>ความลึกของ RPG คลาสสิก กลยุทธ์ที่มีความหมาย และโลกที่พังทลายบนมือถือ</p>

<p><a href="./README.md">English</a> &nbsp;│&nbsp; <a href="./README.ru.md">Русский</a> &nbsp;│&nbsp; <a href="./README.es.md">Español</a> &nbsp;│&nbsp; <a href="./README.de.md">Deutsch</a> &nbsp;│&nbsp; <a href="./README.fr.md">Français</a> &nbsp;│&nbsp; <a href="./README.zh-CN.md">简体中文</a> &nbsp;│&nbsp; <a href="./README.uk.md">Українська</a> &nbsp;│&nbsp; <a href="./README.th.md">ไทย</a></p>

<p><code>กำลังพัฒนา</code> &nbsp;·&nbsp; <code>GODOT 4.7.2</code> &nbsp;·&nbsp; <code>ต้นแบบ ANDROID</code></p>

</div>

<p align="center">
<a href="./github-assets/approved/v2/01-main-menu.webp"><img src="./github-assets/approved/v2/01-main-menu.webp" width="31%" alt="RADZONE approved concept art — main menu" /></a>
<a href="./github-assets/approved/v2/07-tactical-combat.webp"><img src="./github-assets/approved/v2/07-tactical-combat.webp" width="31%" alt="RADZONE approved concept art — tactical combat" /></a>
<a href="./github-assets/approved/v2/03-dialogue.webp"><img src="./github-assets/approved/v2/03-dialogue.webp" width="31%" alt="RADZONE approved concept art — dialogue" /></a>
</p>

<p align="center"><sub>◈ ภาพแนวทางศิลป์ที่ได้รับการอนุมัติ — ไม่ใช่ภาพหน้าจอจากเกมจริง ◈</sub></p>

<p align="center"><a href="#world">สำรวจโลก</a> &nbsp;·&nbsp; <a href="#character">ตัวละคร</a> &nbsp;·&nbsp; <a href="#survival">เอาตัวรอดและแลกเปลี่ยน</a> &nbsp;·&nbsp; <a href="#development">การพัฒนา</a></p>

---

## คืนหัวใจของ RPG คลาสสิก

RADZONE เป็นโครงการเกม RPG มือถืออิสระที่ได้รับแรงบันดาลใจจาก Fallout 2 เราต้องการรักษาสิ่งสำคัญของเกมคลาสสิก: **ทางเลือกที่มีความหมาย การพัฒนาตัวละครแบบ SPECIAL การต่อสู้เชิงกลยุทธ์แบบผลัดตา อุปกรณ์ที่มีคุณค่า และบทสนทนาที่น่าติดตาม**

เราไม่ได้เพียงย่อหน้าจอ PC ให้เล็กลง แต่ตั้งใจนำระบบ RPG ที่ลึกซึ้งมาสู่ Android แนวนอนแบบสัมผัส พร้อมโลกหลังหายนะที่มีเอกลักษณ์และภาพสไตล์ภาพยนตร์

<a id="world"></a>
## 01 / ก้าวสู่ซากปรักหักพัง

### โลกสำหรับออกสำรวจ ไม่ใช่แค่แผนที่ให้แตะ

ชุมชนที่ถูกลืม เส้นทางอันตราย ภารกิจ และชื่อเสียงควรส่งผลต่อการเดินทาง **ฉากไอโซเมตริก แผนที่โลก และการเล่าเรื่องผ่านสภาพแวดล้อม** คือเป้าหมายสำคัญ

<p align="center">
<a href="./github-assets/approved/v2/06-exploration.webp"><img src="./github-assets/approved/v2/06-exploration.webp" width="43%" alt="RADZONE approved concept art — exploration" /></a>
<a href="./github-assets/approved/v2/04-world-map-quests.webp"><img src="./github-assets/approved/v2/04-world-map-quests.webp" width="43%" alt="RADZONE approved concept art — world map and quests" /></a>
</p>

<a id="character"></a>
## 02 / ตัวละครของคุณ ผลลัพธ์ของคุณ

### SPECIAL ไม่ใช่เพียงตัวอักษรเจ็ดตัว

ค่าสถานะ ทักษะ Perks ประสบการณ์ และอุปกรณ์กำหนดวิธีเอาตัวรอด เราต้องการรักษาความลึกของ RPG โดยทำให้ใช้งานบนมือถือได้ง่าย

<p align="center">
<a href="./github-assets/approved/v2/02-character-special.webp"><img src="./github-assets/approved/v2/02-character-special.webp" width="43%" alt="RADZONE approved concept art — character creation" /></a>
<a href="./github-assets/approved/v2/10-skills-perks.webp"><img src="./github-assets/approved/v2/10-skills-perks.webp" width="43%" alt="RADZONE approved concept art — skills and perks" /></a>
</p>

<a id="survival"></a>
## 03 / ทุกกระสุน ทุกการแลกเปลี่ยน

### ในดินแดนรกร้าง ไม่มีอะไรได้มาฟรี ๆ

ค้นหาสิ่งของ จัดการทรัพยากรที่จำกัด แลกเปลี่ยนอุปกรณ์ และคิดก่อนทุกการปะทะ ค่าสถานะและข้อมูลไอเท็มต้องมาจาก **ระบบเกมจริงใน Godot** ไม่ใช่ตัวเลขที่วาดลงบนภาพต้นแบบ

<p align="center">
<a href="./github-assets/approved/v2/05-inventory-icon-reference.webp"><img src="./github-assets/approved/v2/05-inventory-icon-reference.webp" width="31%" alt="RADZONE approved concept art — inventory" /></a>
<a href="./github-assets/approved/v2/08-barter.webp"><img src="./github-assets/approved/v2/08-barter.webp" width="31%" alt="RADZONE approved concept art — barter" /></a>
<a href="./github-assets/approved/v2/09-loot-container.webp"><img src="./github-assets/approved/v2/09-loot-container.webp" width="31%" alt="RADZONE approved concept art — loot container" /></a>
</p>

## 04 / คิดก่อนยิง

แต้มการกระทำ การเล็งเฉพาะจุด ความต้านทานความเสียหาย และตำแหน่งในการต่อสู้เป็นส่วนหนึ่งของระบบเกม อาวุธและชุดเกราะที่มองเห็นบนตัวละครเป็นงานสำคัญ **แต่ยังไม่ใช่ระบบที่สมบูรณ์ในเกมจริง**

## 05 / คำพูดเปลี่ยนทุกอย่าง

บทสนทนายาวที่เลื่อนอ่านได้และตัวเลือกหลายเส้นทางคือหัวใจของ RPG คลาสสิก ตัวอักษร CRT สีเขียว โลหะเก่า และการควบคุมด้วยระบบสัมผัสต้องทำงานร่วมกัน

---

## แนวทางภาพที่อนุมัติแล้ว

**ภาพ 10 ภาพที่อนุมัติแล้ว** กำหนดเป้าหมายคุณภาพงานศิลป์ ภาพเหล่านี้เป็นคอนเซ็ปต์ **ไม่ใช่ภาพหน้าจอ Android จากเกมที่เล่นได้จริง**

<p align="center"><a href="./docs/art/APPROVED_VISUAL_CATALOG.md"><strong>◈ ดูแกลเลอรีภาพที่อนุมัติ ◈</strong></a></p>

## จากคอนเซ็ปต์สู่ไฟล์เกม

ทีมกำลังเตรียมภาพไอเท็ม PNG แบบโปร่งใส ท่าทางตัวละครหลายทิศทาง แอตลาส ฉากทดสอบ Godot และเอฟเฟกต์การต่อสู้ **ไฟล์ในสาขาทดลองยังไม่ถือว่าผ่านการทดสอบในเกมจริง**

<p align="center">
<a href="./github-assets/showcase/survivor-combat-poses.webp"><img src="./github-assets/showcase/survivor-combat-poses.webp" width="57%" alt="RADZONE in-production survivor directional poses; not gameplay" /></a>
<a href="./github-assets/showcase/inventory-icons.webp"><img src="./github-assets/showcase/inventory-icons.webp" width="39%" alt="RADZONE candidate inventory art; not gameplay" /></a>
</p>
<p align="center"><sub>กราฟิกอยู่ระหว่างพัฒนา / ยังไม่ผ่านการทดสอบในเกม</sub></p>

<p align="center"><a href="https://github.com/rf24kja/Fallout-mobile/pull/28"><strong>⚙ ดู Pull Request งานกราฟิก</strong></a></p>

<a id="development"></a>
## สถานะการพัฒนาจริง

มีต้นแบบ Godot/Android ที่อยู่ระหว่างพัฒนา ภาพคอนเซ็ปต์แสดงระดับคุณภาพเป้าหมาย และ **ยังไม่ประกาศวันเปิดตัวเวอร์ชันเสถียร**

| | |
|:--|:--|
| **Android / Godot** | ต้นแบบอยู่ระหว่างพัฒนา; เอกสารใช้ Godot 4.7.2 |
| **ระบบ RPG** | กำลังตรวจสอบและผสานระบบ |
| **แนวทางภาพ** | คอนเซ็ปต์ที่อนุมัติ 10 ภาพ |
| **กราฟิกสำหรับเกม** | ไฟล์ทดลอง ต้องตรวจสอบในเกมจริง |
| **เปิดตัวสู่สาธารณะ** | ยังไม่ประกาศ |

## การพัฒนาและซอร์สโค้ด

ดูสถานะโครงการ แนวทางภาพ เอกสารทางเทคนิค และประวัติการพัฒนาได้ที่นี่

**[เปิดคลังโค้ด](https://github.com/rf24kja/Fallout-mobile)** &nbsp;·&nbsp; [สถานะโครงการ](./PROJECT_STATE.md) &nbsp;·&nbsp; [ข้อกำหนดระบบอุปกรณ์](./docs/art/CHARACTER_EQUIPMENT_VISUAL_SPEC.md) &nbsp;·&nbsp; [ตารางเปรียบเทียบระบบ RPG](./docs/FALLOUT2_FIDELITY_MATRIX.md)

<details>
<summary>📂 เอกสารทางเทคนิค</summary>

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

### ติดตามการพัฒนา

กด Star และ Watch เพื่อรับข่าวสาร โดยยังไม่มีการให้คำมั่นเรื่องวันวางจำหน่าย

<strong>RADZONE</strong> &nbsp;·&nbsp; <a href="https://github.com/rf24kja/Fallout-mobile">github.com/rf24kja/Fallout-mobile</a>

<sub>โครงการอิสระที่ได้รับแรงบันดาลใจจาก RPG คลาสสิก ไม่มีความเกี่ยวข้องกับ Bethesda, Interplay หรือผู้ถือสิทธิ์ Fallout และไม่เผยแพร่ไฟล์เชิงพาณิชย์จากเกมต้นฉบับ</sub>

</div>