# PostCSS: будущее после Sass и LESS

[Андрей Ситник](http://sitnik.ru/), [Злые марсиане](http://evilmartians.ru/)

## **PostCSS** Будущее после Sass и LESS
!type is-title
!image logo.png

*Андрей Ситник, Злые марсиане*

## План

1. Зачем обрабатывать CSS
2. Чем плохи препроцессоры
3. Что такое постпроцессоры
4. Как их использовать?
5. Как их использовать на полную мощь?

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

```mark_rem
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

- Libsass и Автопрефиксер: **0,5 секунды**
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
  - сохраняем форматирование;
  - удобнее API.

## Постпроцессор

<div class="post-inside">
    <div class="css">CSS</div>
    <div class="arrow">→</div>
    <div class="position">
        <div class="processor-title">Постпроцессор</div>
        <div class="processor parser">Парсер</div>
        <div class="processor stringifier">Сохранение</div>
        <div class="down">
            ↓<div class="arrow-text">JS-дерево</div>
        </div>
        <div class="up">
            ↑<div class="arrow-text">Новое JS-дерево</div>
        </div>
        <div class="code">Ваш JS-код обработки</div>
    </div>
    <div class="arrow">→</div>
    <div class="css">Новый CSS</div>
</div>

## Проблема

Современные браузеры:

```colon
a::after { }
```

Для IE 8:

```colon
a:after { }
```

## Пример постпроцессора

```js
var coloner = postcss(function (css) {
    css.eachRule(function (rule) {
        if ( rule.selector.match(/::/) )
            rule.selector += ', ' +
                rule.selector.replace('::', ':');
    });
});
```

## Результат
!type with-js-inout

```js
var fixed = coloner.process(css).css;
```

Вход:

Выход:

```css
a::after {
    content: "→"
}
```

```mark_fix
a::after, a:after {
    content: "→"
}
```

## Карты кода

```js
var map = coloner.process(css, {
    map: { prev: sassMap }
}).map;
```

!image map.png

## Постпроцессоры ♥ Сасс

<div class="post-inside with-sass">
    <div class="preprocessor">
        <div class="sass">Сасс</div>
        <div class="arrow">→</div>
    </div>
    <div class="css origin">
        CSS
        <div class="map">Карта кода</div>
    </div>
    <div class="arrow">→</div>
    <div class="position">
        <div class="processor-title">PostCSS</div>
        <div class="processor parser">Парсер</div>
        <div class="processor stringifier">Сохранение</div>
        <div class="down">
            ↓<div class="arrow-text">JS-дерево</div>
        </div>
        <div class="up">
            ↑<div class="arrow-text">Новое JS-дерево</div>
        </div>
        <div class="code">Ваш JS-код обработки</div>
    </div>
    <div class="arrow">→</div>
    <div class="css">
        Новый CSS
        <div class="map">Новая карта</div>
    </div>
</div>

## *Часть 4* Используем
!cover usage.jpg
!type  is-bottom

## [gulp-postcss](https://github.com/w0rm/gulp-postcss)

```mark_postcss
gulp.task('css', function () {
    var processors = [
        require('autoprefixer'),
        require('csswring') ];
    return gulp.src('./src/style.css')
        .pipe( postcss(processors) )
        .pipe( gulp.dest('./dest') );
});
```

## [autoprefixer](https://github.com/postcss/autoprefixer)
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
            transition: transform 1s;
}
:-moz-full-screen a {
    transition: transform 1s;
}
:-ms-fullscreen a {
    transition: transform 1s;
}
:fullscreen a {
    -webkit-transition: -webkit-transform 1s;
            transition: transform 1s;
}
```

## Относительные размеры

```mark_font
.title {
    height: 2em;
}
.title_note {
    font-size: 14px;
    height: 2em;
}
```

## [pixrem](https://github.com/robwierzbowski/node-pixrem)
!type with-2-sides

```mark_rem
.title {
    height: 2rem;
}
.title_note {
    font-size: 14px;
    height: 2rem;
}
```

```css
.title {
    height: 32px;
    height: 2rem;
}
.title_note {
    font-size: 14px;
    height: 32px;
    height: 2rem;
}
```

## [pleeease-filters](https://github.com/iamvdo/pleeease-filters)
!type with-2-sides
!type with-bigger-right

```css
.blur {
    filter: blur(4px)
}
```

```css
.blur {
    filter: url('data:image/svg+xml;…');
    filter: blur(4px);
}
```

## [grunt-webpcss](https://github.com/lexich/grunt-webpcss)
!type with-2-sides

```css
.icon {
    background: url('a.png')
}
```

```mark_webp
.webp .icon {
    background: url('a.webp')
}
```

## [grunt-data-separator](https://github.com/Sebastian-Fitzner/grunt-data-separator)
!type with-2-sides

```css
/* style.css */
.icon {
    width: 100px;
    background: url('data:…')
}
```

```css
/* style.css */
.icon {
    width: 100px
}
/* style.icons.css */
.icon {
    background: url('data:…')
}
```

## [node-css-mqpacker](https://github.com/hail2u/node-css-mqpacker)
!type with-2-sides
!type with-small-code

```css
@media screen and (min-width: 769px) {
    a { }
}
@media screen and (min-width: 769px) {
    b { }
}
```

```css
@media screen and (min-width: 769px) {
    a { }
    b { }
}
```

## [postcss-custom-media](https://github.com/postcss/postcss-custom-media)

```mark_phone
@custom-media --phone (max-width: 30em);

@media (--phone) {
    body {
        width: 320px
    }
}
```

## [csswring](https://github.com/hail2u/node-csswring)

Минифицирует CSS и обновит предыдущие карты кода (например, от Sass)

## [rtlcss](https://github.com/MohammadYounes/rtlcss)
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

## [И много другого](https://github.com/postcss/postcss#built-with-postcss)

* `cssnext`
* `pleeease`
* `postcss-url`
* `css2modernizr`
* `postcss-color`
* `postcss-import`
* `postcss-custom-properties`

## *Часть 5* Создаём
!cover create.jpg
!type  is-bottom
!type  is-black

## Задача

Какой символ нужно использовать для иконки из своего иконочного шрифта

```css
.icon::before {
    content: '?'
}
```

## *Шаг 1* [gulp-iconfont](https://github.com/nfroidure/gulp-iconfont)

```mark_codepoints
gulp.task('iconfont', function() {
    gulp.src(['icons/*.svg'])
        .pipe(iconfont({ fontName: 'Icons' })
        .on('codepoints', function(data) {
            codepoints = data
        })
        .pipe(gulp.dest('fonts/'));
});
```

## *Шаг 2* Постпроцессор
!type with-small-code

```js
var iconer = postcss(function (css) {
    css.eachDecl(function (decl) {
        if ( decl.prop == 'content' ) {

            decl.value = decl.value.replace(/icon-\w/, function (name) {
                var code = name.replace(/^icon-/, '');
                return '"' + codepoints[name].codepoint + '"';
            });

        }
    });
});
```

## Результат
!type with-2-codes

```mark_icon
.icon::before {
    content: icon-up;
}
```

```mark_content
.icon::before {
    content: "A";
}
```

## Вопросы
!cover ask.jpg
!type  is-bottom

## [github.com/postcss/postcss](http://github.com/postcss/postcss)
!type with-em

* Презентация: [ai.github.io/about-postcss](http://ai.github.io/about-postcss/)
* [@autoprefixer](https://twitter.com/autoprefixer)
* [@andrey_sitnik](https://twitter.com/andrey_sitnik)

!image evilmartians.png
