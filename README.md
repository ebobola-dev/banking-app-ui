# Верстка макета [Banking App](https://www.figma.com/community/file/1114624124722652699) на Flutter
## Макет был взят с телеграм канала [Сайтодел](https://t.me/sitodel)
#### Немного о многом

- Всего три экрана
- На каждом экране присутствуют анимации, которые запускаются при открытии экрана
- Реализовано всё в точности так, как в макете, кроме графика внизу экрана Activity (он получился кривой)
- <ins>**Если**</ins> на экране присутсвует bottom sheet, то панель навигации скрывается, когда этот bottom sheet раскрывается полностью (во всю высоту), <ins>**иначе**</ins> панель навигации скрывается при скроле страницы (панель отображается, только когда мы находимся наверху страницы)

#### Скриншоты
<img src="/assets/screenshots/home_page.jpg" alt="home_page" width="200"/> <img src="/assets/screenshots/activity_page.jpg" alt="activity_page" width="200"/>
<img src="/assets/screenshots/card_page.jpg" alt="card_page" width="200"/> <img src="/assets/screenshots/hidden_nav_bar(remove).jpg" alt="hidden_nav_bar(remove)" width="200"/>

#### Используемые библиотеки
- **flutter_svg**
- **equatable**
- **flutter_bloc**
- **flutter_slidable**