# PostCSS: будущее после Sass и Less

[Андрей Ситник](http://sitnik.ru/), [Злые марсиане](http://evilmartians.ru/)

## **PostCSS** Будущее после Sass и Less
!type is-title
!image logo.png

*Андрей Ситник, Злые марсиане*

## План

1. Зачем обрабатывать CSS?
2. Чем плохи препроцессоры?
3. Что такое постпроцессоры?
4. Как их использовать?
5. Пишем свой постпроцессор?

## *Часть 1* Проблема
!cover problem.jpg

## Части веб-проекта

<div class="compare">
    <div class="compare_part is-css">
        <div class="compare_title">CSS</div>
        <div class="compare_line"></div>
        <div class="compare_value">72 КБ</div>
    </div>
    <div class="compare_part is-js">
        <div class="compare_title">JS</div>
        <div class="compare_line"></div>
        <div class="compare_value">25 КБ</div>
    </div>
    <div class="compare_part is-backend">
        <div class="compare_title">Бэкенд</div>
        <div class="compare_line"></div>
        <div class="compare_value">43 КБ</div>
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
User = modelByTable('users');
User.findByLogin('ai');
```

## CSS
!type with-smaller-code

```css
.logo {
    -webkit-transition: border 200ms;
    transition: border 200ms;
    border: 2px solid #ffe644
}
.image {
    border: 2px solid #ffe644;
    background: data(data:…);
    width: 200px;
    height: 180px
}
.body::after {
    content: " ";
    visibility: hidden;
    display: block;
    height: 0;
    clear: both
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
!type with-evolution

1. **Случайные идеи**
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
    color: <%= $link-color %>;
}
```

## *Проблема 1* Медленно

Compass на стилях ГитХаба — **5,5 секунды**

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
  - сохраняет форматирование
  - удобнее API

## Постпроцессор

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
                return 16 * parseFloat(rem) + 'px';
            });
    });
};
```

## Разница
!type with-difference

**Препроцессор**

- На вход шаблон
- Логика прямо в стилях
- Функции вшиты в язык

**Постпроцессор**

- На вход CSS
- Логика отдельно на JS
- Все функции как модули

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

## *Часть 5* Создаём
!cover create.jpg
!type  is-bottom
!type  is-black

## Задача

Какой символ нужно использовать для иконки из своего иконочного шрифта

```mark_question
.icon::before {
    content: "?"
}
```

## *Шаг 1* [gulp-iconfont](https://github.com/nfroidure/gulp-iconfont)

```mark_icons
gulp.task('iconfont', function() {
    gulp.src(['icons/*.svg'])
        .pipe(iconfont({ fontName: 'Icons' })
        .on('codepoints', function(data) {
            icons = data;
        })
        .pipe(gulp.dest('fonts/'));
});
```

## *Шаг 2* Плагин для PostCSS

```mark_icons
var iconer = function (css) {
    css.eachDecl(function (decl) {
        decl.value = decl.value
            .replace(/icon-\w/, function (str) {
                var name = str.replace(/^icon-/, '');
                return '"' + icons[name].codepoint + '"';
            });
    });
};
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

##
!type with-icons-ad

!image evil-icons.png

<p>Бесплатные SVG-иконки для вашего сайта</p>

[evil-icons.io](http://evil-icons.io/?utm_source=postcss-wsd)
