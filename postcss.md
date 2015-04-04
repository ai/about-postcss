# PostCSS: будущее после Sass и Less

[Андрей Ситник](http://sitnik.ru/), [Злые марсиане](http://evilmartians.ru/)

## **PostCSS** Будущее после Sass и Less
!type is-title
!image logo.svg

*Андрей Ситник, Злые марсиане*

## План

1. Зачем обрабатывать CSS?
2. Чем плохи препроцессоры?
3. Что такое постпроцессоры?
4. Как их использовать?
5. Пишем свой постпроцессор?

## *Часть 1* Проблема
!cover problem.jpg

## Эволюция

<div class="evolution">
  <div class="evolution_top">Мутации</div>
  <div class="evolution_first">→</div>
  <div class="evolution_right">Отбор</div>
  <div class="evolution_second">→</div>
  <div class="evolution_left">Наследование</div>
  <div class="evolution_third">→</div>
</div>

## Естественный отбор?

`<blink>` поддерживали **19 лет**

## Случайные мутации

<figure>
  <blockquote>
    <p>
      Свобода ничего не стоит, если она не включает в себя свободу ошибаться
    </p>
  </blockquote>
  <figcaption>— Махатма Ганди</figcaption>
</figure>

## 40% ES6 пришло из CoffeeScript
!type shout

## *Часть 2* Препроцессоры
!cover sass.jpg

## Шаблонизаторы CSS

```mark_template
a {
    <%= include clickable %>
    color: <%= $link-color %>;
}
```

## Синтаксические возможности

1. Переменные<br>`$var: 1`
2. Примеси<br>`@include mixin`
3. Функции<br>`black()`

## *Проблема 1* Ограниченность

```mark_rem
a {
    width: 20rem
}
```

## *Проблема 2* Монолитность

- **Libsass:** 130 файлов, 986 КБ C++ кода
- **Stylus:** 77 файлов, 341 КБ кода
- **Less:** 144 файлов, 488 КБ кода

## *Проблема 3* Даже JS лучше Sass
!type with-huge-code

```sass
!gem compass-core/stylesheets/compass/css3/_transition.scss
```

## *Часть 3* PostCSS
!cover postcss.jpg
!type  is-black

## Начало

«<a href="http://tjholowaychuk.tumblr.com/post/44267035203/modular-css-preprocessing-with-rework">Modular CSS preprocessing with rework</a>»
— TJ Holowaychuk, 2013

## Развитие
!type with-difference

<div class="arrow">→</div>

**Rework**

- первый
- проще, меньше

**PostCSS**

- более умный парсер
- лучше поддержка карт кода
- сохраняет форматирование
- удобнее API

## PostCSS

<div class="postprocessing">
    <div class="postprocessing_step is-css">
        CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">карта кода</div>
        </span>
    </div>
    <div class="postprocessing_step is-important">Парсер</div>
    <div class="postprocessing_step">Плагин</div>
    <div class="postprocessing_step">Плагин</div>
    <div class="postprocessing_step is-important">Сохранение</div>
    <div class="postprocessing_step is-css">
        Новый CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">новая карта</div>
        </span>
    </div>
</div>

## Использование

```mark_plugin
let postcss = require('postcss');

postcss([ plugin1, plugin2 ])
    .process(css)
    .then( result => console.log(result.css) );
```

## Плагин

```js
function (css) {
    css.eachDecl( decl => {
        decl.value = decl.value.replace(/\d+rem/, rem => {
            return 16 * parseFloat(rem) + 'px';
        });
    });
};
```

## Разница
!type with-difference

**Препроцессор**

- Монолитный
- Логика прямо в шаблоне

**PostCSS**

- Все функции как плагины
- JS трансорфмирует CSS

## Эволюция

<div class="evolution is-postcss">
  <div class="evolution_top">Пишем плагин</div>
  <div class="evolution_first">→</div>
  <div class="evolution_right">Популярность</div>
  <div class="evolution_second">→</div>
  <div class="evolution_left">Спецификация</div>
  <div class="evolution_third">→</div>
</div>

## *Часть 4* Практика
!cover practice.jpg

## *Плагины* [autoprefixer](https://github.com/postcss/autoprefixer)
!type with-2-sides
!type with-small-code
!type with-bigger-right

```css
:fullscreen a {
    transition: transform 1s
}
```

```css
:-webkit-full-screen a {
    -webkit-transition: -webkit-transform 1s;
            transition: transform 1s
}
:-moz-full-screen a {
    transition: transform 1s
}
:-ms-fullscreen a {
    transition: transform 1s
}
:fullscreen a {
    -webkit-transition: -webkit-transform 1s;
            transition: transform 1s
}
```

## *Плагины* [pleeease-filters](https://github.com/iamvdo/pleeease-filters)
!type with-2-sides
!type with-bigger-right

```css
.blur {
    filter: blur(4px)
}
```

```mark_svg
.blur {
    filter: url(data:image/svg…);
    filter: blur(4px)
}
```

## *Плагины* [webpcss](https://github.com/lexich/webpcss)
!type with-2-sides

```css
.icon {
    background: url(a.png)
}
```

```mark_webp
.icon {
    background: url(a.png)
}
.webp .icon {
    background: url(a.webp)
}
```

## *Плагины* [grunt-data-separator](https://github.com/Sebastian-Fitzner/grunt-data-separator)
!type with-2-sides

```css
/* style.css */
.icon {
    width: 100px;
    background: url(data:…)
}
```

```css
/* style.css */
.icon {
    width: 100px
}
/* style.icons.css */
.icon {
    background: url(data:…)
}
```

## *Плагины* [csswring](https://github.com/hail2u/node-csswring)

Минифицирует CSS и обновляет предыдущие карты кода (например, после склеивания)

## *Плагины* [postcss-bem-linter](https://github.com/necolas/postcss-bem-linter)

Проверяет БЭМ для Твиттера
(методология [SUIT CSS](https://github.com/suitcss/suit))

## *Плагины* [doiuse](https://github.com/anandthakker/doiuse)

Проверяет поддержку свойств в нужных браузерах по Can I Use

```comment
main.css: line 15, col 3 -
  CSS user-select: none not supported by: IE (8,9)
main.css: line 32, col 3 -
  CSS3 Transforms not supported by: IE (8)
```

## *Плагины* [cssnext](https://github.com/cssnext/cssnext)

Набор полифилов для спецификаций CSS 4:

- CSS-переменные
- Шорткаты для селекторов
- Удобный синтаксис `font-feature-settings`
- Новые способы задания цветов

## *Плагины* [rtlcss](https://github.com/MohammadYounes/rtlcss)
!type with-2-codes

Изменяет дизайн для арабского и иврита

```mark_left
a {
    left: 10px;
    text-align: left
}
```

```mark_right
a {
    right: 10px;
    text-align: right
}
```

## Скорость

<div class="compare is-long">
    <div class="compare_part is-postcss">
        <div class="compare_title">PostCSS</div>
        <div class="compare_line"></div>
        <div class="compare_value">36 мс</div>
    </div>
    <div class="compare_part is-libsass">
        <div class="compare_title">libsass</div>
        <div class="compare_line"></div>
        <div class="compare_value">109 мс</div>
    </div>
    <div class="compare_part is-less">
        <div class="compare_title">Less</div>
        <div class="compare_line"></div>
        <div class="compare_value">150 мс</div>
    </div>
    <div class="compare_part is-stylus">
        <div class="compare_title">Stylus</div>
        <div class="compare_line"></div>
        <div class="compare_value">283 мс</div>
    </div>
    <div class="compare_part is-sass">
        <div class="compare_title">Sass</div>
        <div class="compare_line"></div>
        <div class="compare_value">1153 мс</div>
    </div>
</div>

<div class="source">
Источник: <a href="https://github.com/postcss/postcss/blob/master/benchmark/processors.js">парсинг Бутстрапа</a>
</div>

## Преимущества

1. Скорость
2. Плагины на JS
3. Можно сделать гораздо больше

## *Часть 4* Используем
!cover usage.jpg
!type  is-bottom

## Интеграция

- [Webpack](https://github.com/postcss/postcss-loader)
- [Grunt](https://github.com/nDmitry/grunt-postcss)
- [Gulp](https://github.com/w0rm/gulp-postcss)

## [gulp-postcss](https://github.com/w0rm/gulp-postcss)

```mark_postcss
gulp.task('css', function () {
    var processors = [/* плагины */];
    return gulp.src('./src/style.css')
        .pipe( postcss(processors) )
        .pipe( gulp.dest('./dest') );
});
```

## [Выбираем плагины](https://github.com/postcss/postcss#built-with-postcss)

```js
var processors = [
    require('postcss-custom-properties'),
    require('pleeease-filters'),
    require('postcss-import'),
    require('autoprefixer'),
    require('postcss-calc'),
    require('postcss-url'),
    require('csswring')
];
```

## Вопросы
!cover ask.jpg
!type  is-bottom

## [github.com/postcss/postcss](http://github.com/postcss/postcss)
!type with-em

* Презентация: [ai.github.io/about-postcss](http://ai.github.io/about-postcss/)
* Вопросы: [gitter.im/postcss/postcss](https://gitter.im/postcss/postcss)
* Твиттер: [@postcss](https://twitter.com/autoprefixer)

!image evilmartians.png
