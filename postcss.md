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

## Машины должны страдать
!type shout

## *Часть 2* Препроцессоры
!cover sass.jpg

## Синтаксические возможности

- Переменные
- Примеси
- Функции

## *Проблема 1* Ограниченность

```rem
a {
    width: 20rem
}
```

## *Проблема 2* Даже JS лучше Sass
!type with-huge-code

```sass
!gem compass-core/stylesheets/compass/css3/_transition.scss
```

## *Проблема 3* Скорость

- Libsass и Автопрефиксер: **0,5 секунд**
- Ruby Sass и Compass: **5 секунд**

<div class="source">
Источник: <a href="https://twitter.com/jegtnes/status/495142807494205440">Alex Jegtnes</a>
</div>

## Хороший Sass

```mark_sass
.quote
  position: relative
  top: 100px
  +size(100px, 50px)
  .arrow
    +triangle
```

## *Часть 3* Постпроцессоры
!cover postcss.jpg
!type  is-bottom
!type  is-black

## Постпроцессоры

1. **Rework**:
  - первый;
  - проще, меньше.
2. **PostCSS**:
  - более умный парсер;
  - лучше поддержка карт кода;
  - удобнее API.
