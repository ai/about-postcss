# PostCSS: the Future after Sass and Less

[Andrey Sitnik](http://sitnik.ru/en/), [Evil Martians](https://evilmartians.com/)

## **PostCSS** the Future after Sass and Less
!type is-title
!image logo.svg

*Andrey Sitnik, Evil Martians*

##
!type with-martians

!image martians.svg

## Worked on
!type with-clients

!image ebay.svg
!image groupon.svg
!image amplifr.png

## Open Source
!type with-projects

!image autoprefixer.svg
!image logo.svg

## *Part 1* Problem
!cover problem.jpg

## Evolution

<div class="evolution">
  <div class="evolution_top">Mutations</div>
  <div class="evolution_first">→</div>
  <div class="evolution_right">Selection</div>
  <div class="evolution_second">→</div>
  <div class="evolution_left">Inheritance</div>
  <div class="evolution_third">→</div>
</div>

## Natural Selection?

`<blink>` was supported for **19 years**

## Random Mutations

<figure>
  <blockquote>
    <p>
      Freedom is not worth having if it does not include
      the freedom to make mistakes
    </p>
  </blockquote>
  <figcaption>— Mahatma Gandhi</figcaption>
</figure>

## 40% of ES6 comes from CoffeeScript
!type shout

## *Part 2* Preprocessors
!cover sass.jpg

## CSS Templating

```mark_template
a {
    <%= include clickable %>
    color: <%= $link-color %>;
}
```

## Syntax Features

1. Variables<br>`$var: 1`
2. Mixins<br>`@include mixin`
3. Functions<br>`black()`

## *Problem 1* Limitations

```mark_rem
a {
    width: 20rem;
}
```

## *Problem 2* Monolithic

- **Libsass:** 110 files, 21 300 LOC of C++
- **Stylus:** 72 files, 7 900 LOC
- **Less:** 105 files, 9 800 LOC

## *Problem 3* Hard to Code
!type with-huge-code

```sass
!gem compass-core/stylesheets/compass/css3/_transition.scss
```

## *Part 3* PostCSS
!cover postcss.jpg
!type  is-bottom

## The Beginning
!type with-article

!image tj.jpg

“<a href="http://tjholowaychuk.tumblr.com/post/44267035203/modular-css-preprocessing-with-rework">Modular CSS Preprocessing with Rework</a>”
<cite><br>— TJ Holowaychuk, 2013</cite>

## Development
!type with-difference

<div class="arrow">→</div>

**Rework**

- first
- simple

**PostCSS**

- 2 times faster
- better source map support
- preserves source formatting
- useful API

## PostCSS

<div class="postprocessing">
    <div class="postprocessing_step is-css">
        CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">source map</div>
        </span>
    </div>
    <div class="postprocessing_step is-important">Parser</div>
    <div class="postprocessing_step">Plugin</div>
    <div class="postprocessing_step">Plugin</div>
    <div class="postprocessing_step is-important">Stringifier</div>
    <div class="postprocessing_step is-css">
        New CSS
        <span class="postprocessing_position">
            <div class="postprocessing_note">new source map</div>
        </span>
    </div>
</div>

## Usage

```mark_plugin
let postcss = require('postcss');

postcss([ plugin1, plugin2 ])
    .process(css)
    .then( result => console.log(result.css) );
```

## Plugin

```js
function (css) {
    css.eachDecl( decl => {
        decl.value = decl.value.replace(/\d+rem/, rem => {
            return 16 * parseFloat(rem) + 'px';
        });
    });
};
```

## Difference
!type with-difference

**Preprocessor**

- Monolithic
- Code inside CSS template

**PostCSS**

- All features by plugins
- JS transforms CSS

## Evolution

<div class="evolution is-postcss">
  <div class="evolution_top">Write a plugin</div>
  <div class="evolution_first">→</div>
  <div class="evolution_right">Popularity</div>
  <div class="evolution_second">→</div>
  <div class="evolution_left">Specification</div>
  <div class="evolution_third">→</div>
</div>

## *Part 4* Practice
!cover practice.jpg

## *Plugins* [postcss-simple-vars](https://github.com/postcss/postcss-simple-vars)

```mark_vars
$blue: #056ef0;
$column: 200px;

.menu_link {
    background: $blue;
    width: $column;
}
```

## *Plugins* [postcss-nested](https://github.com/postcss/postcss-nested)

```mark_nested
.phone {
    &_title {
        width: 500px;
        @media (max-width: 500px) {
            width: auto;
        }
    }
}
```

## *Plugins* [postcss-mixins](https://github.com/postcss/postcss-mixins)

```mark_mixins
@define-mixin icon $network, $color {
    .icon.is-$network {
        color: $color;
    }
}

@mixin icon twitter, blue;
@mixin icon youtube, red;
```

## Maintainability

- **postcss-nested:** 68 LOC
- **postcss-simple-vars:** 74 LOC
- **postcss-mixins:** 147 LOC

## *Impossible with Sass* [autoprefixer](https://github.com/postcss/autoprefixer)
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

## *Impossible with Sass* [cssnext](https://github.com/cssnext/cssnext)

```mark_css4
@custom-selector --heading h1, h2, h3, h4, h5, h6;

.post-article --heading {
    margin-top: calc(10 * var(--row));
    color: color( var(--mainColor) blackness(+20%) );
    font-variant-caps: small-caps;
}
```

## *Impossible with Sass* [cssgrace](https://github.com/cssdream/cssgrace)
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

## *Impossible with Sass* [postcss-quantity-queries](https://github.com/pascalduez/postcss-quantity-queries)
!type with-2-sides
!type with-smaller-right

```mark_quantity
ul > li:exactly(4) {
    width: 25%;
}

ul > li:exactly(5) {
    width: 20%;
}
```

```css
ul > li:nth-last-child(4):first-child,
ul > li:nth-last-child(4):first-child ~ li {
    width: 25%;
}


ul > li:nth-last-child(5):first-child,
ul > li:nth-last-child(5):first-child ~ li {
    width: 20%;
}
```

## *Impossible with Sass* [postcss-data-packer](https://github.com/Ser-Gen/postcss-data-packer)
!type with-2-sides

```mark_data
/* style.css */
.icon1 {
    width: 100px;
    background: url(data:…);
}
.icon2 {
    background: url(data:…);
}
```

```mark_data
/* style.css */
.icon1 {
    width: 100px;
}
/* style.icons.css */
.icon1, .icon2 {
    background: url(data:…);
}
```

## *Impossible with Sass* [postcss-bem-linter](https://github.com/necolas/postcss-bem-linter)

Lint Twitter BEM-style [SUIT CSS](https://github.com/suitcss/suit)

```css
/** @define Block */
:root {
  --Block-property: value;
}
.Block {}
.Block-other {}
```

## *Impossible with Sass* [doiuse](https://github.com/anandthakker/doiuse)

Lint CSS for browser support against Can I Use database

```comment
main.css: line 15, col 3 -
  CSS user-select: none not supported by: IE (8,9)
main.css: line 32, col 3 -
  CSS3 Transforms not supported by: IE (8)
```

## Hebrew Wikipedia
!type with-image

!image hewiki.jpg

## *Impossible with Sass* [rtlcss](https://github.com/MohammadYounes/rtlcss)
!type with-2-codes

Mirror styles for Arabic or Hebrew

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

## [90+ plugins](https://github.com/postcss/postcss#plugins)

- Future CSS syntax
- Fallbacks
- Language extensions
- Optimizations
- Shortcuts
- Analytics

## Performance

<div class="compare is-long">
    <div class="compare_part is-postcss is-hide">
        <div class="compare_title">PostCSS</div>
        <div class="compare_line"></div>
        <div class="compare_value">36 ms</div>
    </div>
    <div class="compare_part is-libsass">
        <div class="compare_title">libsass</div>
        <div class="compare_line"></div>
        <div class="compare_value">109 ms</div>
    </div>
    <div class="compare_part is-less">
        <div class="compare_title">Less</div>
        <div class="compare_line"></div>
        <div class="compare_value">150 ms</div>
    </div>
    <div class="compare_part is-stylus">
        <div class="compare_title">Stylus</div>
        <div class="compare_line"></div>
        <div class="compare_value">283 ms</div>
    </div>
    <div class="compare_part is-sass">
        <div class="compare_title">Sass</div>
        <div class="compare_line"></div>
        <div class="compare_value">1153 ms</div>
    </div>
</div>

<div class="source">
Source: <a href="https://github.com/postcss/postcss/blob/master/benchmark/processors.js">Bootstrap parsing</a>
</div>

## Performance

<div class="compare is-long">
    <div class="compare_part is-postcss">
        <div class="compare_title">PostCSS</div>
        <div class="compare_line"></div>
        <div class="compare_value">36 ms</div>
    </div>
    <div class="compare_part is-libsass">
        <div class="compare_title">libsass</div>
        <div class="compare_line"></div>
        <div class="compare_value">109 ms</div>
    </div>
    <div class="compare_part is-less">
        <div class="compare_title">Less</div>
        <div class="compare_line"></div>
        <div class="compare_value">150 ms</div>
    </div>
    <div class="compare_part is-stylus">
        <div class="compare_title">Stylus</div>
        <div class="compare_line"></div>
        <div class="compare_value">283 ms</div>
    </div>
    <div class="compare_part is-sass">
        <div class="compare_title">Sass</div>
        <div class="compare_line"></div>
        <div class="compare_value">1153 ms</div>
    </div>
</div>

<div class="source">
Source: <a href="https://github.com/postcss/postcss/blob/master/benchmark/processors.js">Bootstrap parsing</a>
</div>

## Benefits

1. Performance
2. Modularity
3. Features that are impossible with Sass

## *Part 5*  Present
!cover present.jpg
!type  is-bottom

## 630 000 downloads per month
!type shout

## PostCSS Users
!type with-companies

!image google.svg
!image taobao.svg
!image wordpress.svg
!image twitter.svg

## Buzz
!type with-article

!image alistapart.png

“[What Will Save Us from the Dark Side of Pre‑Processors](http://alistapart.com/column/what-will-save-us-from-the-dark-side-of-pre-processors)”
<cite><br> — A List Apart</cite>

## Buzz
!type with-article

!image benfrain.jpg

“[Breaking up with Sass: it’s not you, it’s me](http://benfrain.com/breaking-up-with-sass-postcss/)”
<cite><br> — Ben Frain, author of «Sass and Compass for Designers»</cite>

## *Part 6*  Usage
!cover use.jpg

## 1. CSS Tool

- Works with Sass, Stylus, Less and CSS
- Fast and accurate CSS parser
- Source maps

## 2. Project without PostCSS

```mark_case1
.pipe( sass() )
.pipe( postcss([
    require('autoprefixer')
]) )
```

## 3. Project with Autoprefixer

```mark_case2
.pipe( sass() )
.pipe( postcss([
    require('autoprefixer'),
    require('postcss-easings'),
    require('cssnext')
]) )
```

## 4. New Project

```mark_case3
.pipe( postcss([
    require('postcss-nested'),
    require('postcss-mixins'),
    require('postcss-simple-vars'),
    require('autoprefixer'),
    require('postcss-easings'),
    require('cssnext')
]) )
```

## Questions
!cover ask.jpg
!type  is-bottom

## <a class="github" href="http://github.com/postcss/postcss">github.com/<strong>postcss</strong>/<strong>postcss</strong></a>
!type with-links

* Keynote: [ai.github.io/about-postcss/en](http://ai.github.io/about-postcss/en)
* Twitter: [@postcss](https://twitter.com/postcss)
* Evil Martians: [evl.ms](https://evilmartians.com/)
* Amplifr: [amplifr.com/en](https://amplifr.com/en)

!image martians.svg
