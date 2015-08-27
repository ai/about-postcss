# PostCSS: будущее после Sass и Less

[Андрей Ситник](http://sitnik.ru/), [Злые марсиане](https://evilmartians.com/)

## **PostCSS** Будущее после Sass и Less
!type is-title
!image logo.svg

*Андрей Ситник, Злые марсиане*

##
!type with-martians

!image martians.svg

## Работал над
!type with-clients

!image ebay.svg
!image groupon.svg
!image amplifr.png

## Опенсорс
!type with-projects

!image autoprefixer.svg
!image logo.svg

## *Часть 1* Проблема
!cover problem.jpg

## 40% ES6 пришло из CoffeeScript
!type shout

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
    width: 20rem;
}
```

## *Проблема 2* Код смешан со стилями
!type with-smaller-code

```sass
@function prefixed-for-transition($prefix, $property) {
  @if not $prefix {
    @return $property;
  }
  @if type-of($property) == list or type-of($property) == arglist {
    $new-list: comma-list();
    @each $v in $property {
      $new-list: append($new-list, prefixed-for-transition($prefix, $v));
    }
    @return $new-list;
  } @else {
    @if index($transitionable-prefixed-values, $property) {
      @return #{$prefix}-#{$property};
    } @else {
      @return $property;
    }
  }
}
```

## *Часть 3* PostCSS
!cover postcss.jpg
!type  is-bottom

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
    <div class="postprocessing_step is-important">Стригифайр</div>
    <div class="postprocessing_step is-css">
        Новый CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">новая карта</div>
        </span>
    </div>
</div>

## Использование

```steps:mark_plugin
let postcss = require('postcss');

postcss([ plugin1, plugin2 ])
    .process(css)
    .then( result => console.log(result.css) );
```

## Плагин

```steps:js
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
- JS трансформирует CSS

## *Часть 4* Практика
!cover practice.jpg

## [PreCSS](https://github.com/jonathantneal/precss)

```mark_mixins
@define-mixin icon $network, $color {
    .icon.is-$network {
        color: $color;
    }
}

@mixin icon twitter, blue;
@mixin icon youtube, red;
```

## *Невозможно на Sass* [autoprefixer](https://github.com/postcss/autoprefixer)
!type with-2-sides
!type with-small-code
!type with-bigger-right

```css
:fullscreen a {
    transition: transform 1s;
}
```

```mark_prefixes
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

## *Невозможно на Sass* [cssnext](https://github.com/cssnext/cssnext)

```mark_css4
@custom-selector --heading h1, h2, h3, h4, h5, h6;

.post-article --heading {
    margin-top: calc(10 * var(--row));
    color: color( var(--mainColor) blackness(+20%) );
    font-variant-caps: small-caps;
}
```

## *Невозможно на Sass* [cssgrace](https://github.com/cssdream/cssgrace)
!type with-2-sides

```css
.icon {
    opacity: 0.6;
    display: inline-block;
}
```

```mark_ie
.icon {
    opacity: 0.6;
    filter: alpha(opacity=60);
    display: inline-block;
    *display: inline;
    *zoom: 1;
}
```

## [postcss-use](https://github.com/postcss/postcss-use)

```mark_use
@use postcss-responsive-type;

body {
    font-size: responsive 12px 21px;
}
```

## *Невозможно на Sass* [CSS Modules](https://github.com/css-modules)
!type with-2-sides

```mark_data
.title { }
.list { }
.item { }
```

```mark_data
.__Component_title_dj45 { }
.__Component_list_ha3l { }
.__Component_item_5q67 { }
```

## *Невозможно на Sass* [postcss-font-magician](https://github.com/jonathantneal/postcss-font-magician)
!type with-2-sides
!type with-smaller-right

```mark_font
h1 {
  font-family: Alice;
}
```

```mark_face
@font-face {
   font-family: "Alice";
   font-style: normal;
   font-weight: 400;
   src: local("Alice"), local("Alice-Regular"),
        url("http://fonts.gstatic.com/s/alice/v7/
            _H4kMcdhHr0B8RDaQcqpTA.woff")
        format("woff");
}

body {
  font-family: "Alice";
}
```

## *Невозможно на Sass* [doiuse](https://github.com/anandthakker/doiuse)

Проверяет поддержку свойств в нужных браузерах по Can I Use

```comment
main.css: line 15, col 3 -
  CSS user-select: none not supported by: IE (8,9)
main.css: line 32, col 3 -
  CSS3 Transforms not supported by: IE (8)
```

## Википедия на иврите
!type with-image

!image hewiki.jpg

## *Невозможно на Sass* [rtlcss](https://github.com/MohammadYounes/rtlcss)
!type with-2-codes

Изменяет дизайн для арабского и иврита

```mark_left
a {
    left: 10px;
    text-align: left;
}
```

```mark_right
a {
    right: 10px;
    text-align: right;
}
```

## [Более 250 плагинов](https://github.com/postcss/postcss#plugins)

- Полифилы новых спецификаций
- Поддержка старых браузеров
- Расширения языка
- Оптимизация
- Синтаксический сахар
- Аналитика

## Преимущества

1. Скорость
2. Модульность
3. Функции, невозможные на Sass

## *Часть 5*  Настоящее
!cover present.jpg
!type  is-bottom

## 850 000 загрузок в месяц
!type shout

## Используют PostCSS
!type with-companies

!image yandex.svg
!image taobao.svg
!image wordpress.svg
!image twitter.svg

## *Часть 6*  Применяем
!cover use.jpg

## 1. Разработка CSS-инструмента

- Работает с Sass, Stylus, Less и CSS
- Очень быстрый и точный парсер
- Карты кода

## 2. Сайт не использует PostCSS

```mark_case1
.pipe( sass() )
.pipe( postcss([
    require('autoprefixer')
]) )
```

## 3. Сайт уже с Автопрефиксером

```mark_case2
.pipe( sass() )
.pipe( postcss([
    require('autoprefixer'),
    require('postcss-easings'),
    require('cssnext')
]) )
```

## 4. Новый проект

```mark_case3
.pipe( postcss([
    require('precss'),
    require('autoprefixer'),
    require('postcss-easings'),
    require('cssnext')
]) )
```

## Вопросы
!cover ask.jpg
!type  is-bottom

## <a class="github" href="http://github.com/postcss/postcss">github.com/<strong>postcss</strong>/<strong>postcss</strong></a>
!type with-links

* Презентация: [ai.github.io/about-postcss](http://ai.github.io/about-postcss/)
* ВКонтакте: [vk.com/postcss](https://vk.com/postcss)
* Злые марсиане хантят:<br>[bit.ly/evlfrnt](https://bit.ly/evlfrnt/)

!image martians.svg
