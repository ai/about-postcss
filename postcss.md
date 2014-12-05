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

## Части веб-проекта

<div class="project-parts">
    <div class="project-parts_part is-css">
        <div class="project-parts_title">CSS</div>
        <div class="project-parts_line"></div>
        <div class="project-parts_value">72 КБ</div>
    </div>
    <div class="project-parts_part is-js">
        <div class="project-parts_title">JS</div>
        <div class="project-parts_line"></div>
        <div class="project-parts_value">25 КБ</div>
    </div>
    <div class="project-parts_part is-backend">
        <div class="project-parts_title">Бэкенд</div>
        <div class="project-parts_line"></div>
        <div class="project-parts_value">43 КБ</div>
    </div>
</div>

<div class="source">
Источник: проекты Злых марсиан
</div>

## *Хороший код* DRY

```
format_links(announce);
format_links(text);
```

## *Хороший код* DSL

```
count.should.eql(1);
```

## *Хороший код* Метапрограммирование

```
User = createModelByTable('users');
User.findByLogin('ai');
```

## CSS
!type with-smaller-code

```css
.logo {
    -webkit-transition: border;
    transition: border;
    border: 2px solid #ffe644;
}
.image {
    border: 2px solid #ffe644;
    background: data('data:…');
    width: 200px
    height: 180px
}
.body::after {
    content: " ";
    visibility: hidden;
    display: block;
    height: 0;
    clear: both;
}
```

## Стандарты развиваются медленно

- **15 лет** на HTML 5
- **5 лет** на ECMAScript 6
- **3 года** на CSS 3

## 1. Скорость разработки и рендера
!type with-2-sides

Быстро разрабатывать

Быстро рендерить

```css
:root {
    --main: #c00
}
a {
    color: var(--main)
}
```

```css
a {
    color: #c00
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

## Шаблонизаторы CSS

```mark_template
a {
    <%= include clickable %>
    color: <%= $link-color %>
}
```

## *Проблема 1* Медленно

Compass на стилях ГитХаба — **3,5 секунды**

<div class="source">
Источник: <a href="https://github.com/postcss/autoprefixer/blob/master/benchmark/general.js#L53">Бенчмарк Автопрефиксера</a>
</div>

## Синтаксические возможности

- Переменные
- Примеси
- Функции

## *Проблема 2* Ограниченность

```mark_rem
a {
    width: 20rem
}
```

## *Проблема 3* Даже JS лучше Sass
!type with-huge-code

```sass
!gem compass-core/stylesheets/compass/css3/_transition.scss
```

## *Часть 3* Постпроцессоры
!cover postcss.jpg
!type  is-bottom
!type  is-black

## Постпроцессоры

1. **Rework**:
  - первый
  - проще, меньше
2. **PostCSS**:
  - более умный парсер
  - лучше поддержка карт кода
  - сохраняем форматирование
  - удобнее API

## Постпроцессор

<div class="postprocessing">
    <div class="postprocessing_step is-css">
        CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">Карта кода</div>
        </span>
    </div>
    <div class="postprocessing_step is-important">Парсер</div>
    <div class="postprocessing_step">Плагин</div>
    <div class="postprocessing_step">Плагин</div>
    <div class="postprocessing_step is-important">Сохранение</div>
    <div class="postprocessing_step is-css">
        Новый CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">Новая карта</div>
        </span>
    </div>
</div>

## Использование

```js
var postcss = require('postcss');

css = postcss()
        .use(plugin1)
        .use(plugin2)
        .process(css).css;
```

## Плагин

```js
var pixrem = function (css) {
    css.eachDecl(function (decl) {
        decl.value = decl.value
            .replace(/\d+rem/, function (rem) {
                return 16 * parseFloat(rem);
            })
    })
}
```

## Разница
!type with-2-sides

**Препроцессор**

- На вход шаблон
- «Магия» прямо в стилях
- Функции вшиты в язык

**Постпроцессор**

- На вход CSS
- «Магия» на JS
- Все фукнции как модули

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
    filter: url('data:image/svg+xml;…');
    filter: blur(4px)
}
```

## *Плагины* [webpcss](https://github.com/lexich/webpcss)
!type with-2-sides

```css
.icon {
    background: url('a.png')
}
```

```mark_webp
.icon {
    background: url('a.png')
}
.webp .icon {
    background: url('a.webp')
}
```

## *Плагины* [grunt-data-separator](https://github.com/Sebastian-Fitzner/grunt-data-separator)
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

## *Плагины* [postcss-custom-media](https://github.com/postcss/postcss-custom-media)

```mark_phone
@custom-media --phone (max-width: 30em);

@media (--phone) {
    body {
        width: 320px
    }
}
```

## *Плагины* [csswring](https://github.com/hail2u/node-csswring)

Минифицирует CSS и обновит предыдущие карты кода (например, от Sass)

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

## Преимущества

- Скорость
- Плагины пишутся на JS
- Можно сделать гораздо больше

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
    require('postcss-url')
    require('csswring')
];
```

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
    content: icon-up
}
```

```mark_content
.icon::before {
    content: "A"
}
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
