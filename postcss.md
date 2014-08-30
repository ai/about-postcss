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
* **3 года** на CSS 3;
* **5 лет** на ECMAScript 6.

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
