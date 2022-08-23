# Верстка макета [Banking App](https://docs.flutter.dev/get-started/codelab) на Flutter

#### Немного о многом

- Всего три экрана
- На каждом экране присутствуют анимации, которые запускаются при открытии экрана
- Реализовано всё в точности так, как в макете, кроме графика на экране Activity (он получился кривой)
- **Если** на экране присутсвует bottom sheet, то панель навигации скрывается, когда этот bottom sheet раскрывается полностью (во всю высоту), **иначе** при панель навигации скрывается при скроле страницы (панель отображается, только когда мы находимся наверху страницы)

#### Скриншоты
<img src="/assets/screenshots/home_page.jpg" alt="home_page" width="200"/> <img src="/assets/screenshots/activity_page.jpg" alt="activity_page" width="200"/>
<img src="/assets/screenshots/card_page.jpg" alt="card_page" width="200"/> <img src="/assets/screenshots/hidden_nav_bar.jpg" alt="hidden_nav_bar" width="200"/>

#### Используемые библиотеки
- **flutter_svg**
- **equatable**
- **flutter_bloc**
- **flutter_slidable**