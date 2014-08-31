# PostCSS: будущее после Sass и LESS

[Андрей Ситник](http://sitnik.ru/), [Злые марсиане](http://evilmartians.ru/)

## **PostCSS** Будущее после Sass и LESS
!type is-title
!image logo.png

*Андрей Ситник, Злые марсиане*

## *Часть 1* Проблема
!cover problem.jpg

## Стандарты развиваются медленно

* **15 лет** на HTML 5;
* **5 лет** на ECMAScript 6;
* **3 года** на CSS 3.

## 1. Скорость разработки и рендера
!type with-2-sides

Быстро разрабатывать:

Быстро рендерить:

```css
:root {
    --main: #c00;
}
a {
    color: var(--main);
}
```

```css
a {
    color: #c00;
}
```

## 2. Всем нужно договориться
!type is-browsers

!image chrome.png
!image ie.png
!image firefox.png
!image safari.png
!image opera.png

## 3. Обратная совместимость

Нестандартный `<blink>` поддерживали **19 лет**

## Эволюция

1. <mark>Случайные идеи</makr>
2. Сравнение в реальном мире
3. Отбор

## *Часть 2* Препроцессоры
!cover sass.jpg

## Хороший Sass

```sass
.quote
  position: relative
  top: 100px
  +size(100px, 50px)
  .arrow
    +triangle
```
