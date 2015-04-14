---

Hi. My name is Andrey Sitnik. I am frontend developer in Evil Martians.

---

I worked on Groupon Russia and eBay Social.
Now I am on Amplifr, social media tool.

---

Also I am author of Autoprefixer and PostCSS.

We will talk about CSS processors.

How many people use Stylus? (Please, raise your hand.)
Less?
Sass?
Autoprefixer?

If you have used Autoprefixer you may see, that it works not like Compass,
Bourbon or any other mixins library. It has no mixins at all.
You just write selectors and properties and it just works, like a magic.

This is because Autoprefixer is only a tip of the iceberg of an entire new way
to process your CSS. Autoprefixer is just a plugin for PostCSS, tool to extend
or even replace CSS preprocessors.

Today I will tell you about PostCSS.

---

We will start from theory. Why CSS processors is so important.
What idea is behind PostCSS.

---

I belive that every long-term development is based on evolution.
We have a great example of biogically evolution in nature.
We use genetics algorithms in our computer science.
There are a theories, that even human ideas is a part of same evolution process.

Evolution is based on three steps. Random mutation. Natural selection
in the wild. And inheritance of the best results.

But do we have this steps in browsers specification process?
Of course, we have a lot of inheritance.
A lot of legacy code and old specifications.

---

But does we really have a selection? Mozilla was forced to support blink tag
for 19 years. And it was only non-standard tag working only in Firefox.

If some technology become a standard, many sites start to use it.
And we will need a decades to replace it for some better standard.

I will tell you some scary story: old IE are still popular in China.

---

Will you think about some new crazy ideas, if you must support you mistakes
of decades?

W3C prefers very long theoretical dicussion for every technology, because they
afrain to make mistake.

And it is a main problem. Many great ideas looked very crazy at the beggining.
What people thinked about iPhone, when it was released? What people thinked
about Web applications 15 years ago? Or what people thinked airplanes, when
they were invented century ago.

We must have some playground to make mistakes if we want new awesome ideas.
If we want long-term development of Web.

---

40% of next JavaScript come from CoffeeScript preprocessor.

Even next next ES7 standard takes async-await after we test
it in IcedCoffeeScript.

And this is why preprocessors are a big deal. They are this kind of playground.
Every developer can use own modules.
For example, Haskel for frontend in awesome Elm tool or ClosureScript.

And we will get real world feedback before idea become a standard.

---

I am very happy about JavaScript preprocessors.
But do CSS preprocessors work as this playground for ideas of next generations?
I didn’t think so.

---

But let’s start from beggining. How CSS preprocessors work today?
They are template language. Like PHP, but you mix your code with CSS template.

---

Some preprocessor tool like Compass or Bourbon can create only mixins,
functions and varibles.

---

And it is a first big problem of preprocessors.

How we can add polyill for units?

Maybe mixins are enough for today simple task.
But we have many new ideas and preprocessors are too limited for them.
Can we create Autoprefixer with mixins?

---

Any there is reason why we have not new features in preprocessor for a years.

Preprocessors codebase are big and very monolithic.

Do you have any friend who contribute something in preprocessors?

Sass team went further. To get better perfomance, they rewrote project to C++
and now we have even less developers, who can add something new.

---

And last but not least problem. Preprocessors are template language.

But does it good language? It is not a some complicated function. This huge
code is just a mixin for simple transition from Compass.

Sass is nice for simple task. But you will have a problems if you want some
complicated awesome tool.

---

And this are a ideas behind PostCSS. Create a playground for next ideas
without limitations of current preprocessors.

---

PostCSS was not first.

3 years ago, TJ Holowaychuk, Stylus maintainer, saw same problems.
He understoood that preprocessor idea was finished.

He started new modular CSS processor tool, Rework.

When I thinked about Autoprefixer, I looked for some new tool. Better that Sass.
And when I saw Rework, I understood that it was a revolution.

---

But Autoprefixer quickly became too big for Rework.
We required better source map support and
more accurate parser too process legacy CSS with hacks.

And this is how PostCSS was created.

---

So, how modular CSS processor works?

PostCSS core contains only two small parts. CSS parser which returns
tree of node’s objects. And stringifier that converts node tree to CSS string.

That’s all. By default PostCSS will not change any byte of your CSS.
It will just parse it, even saves all whitespaces. And converts it back
to string.

All magic happens in plugins.
Plugin is very simple too.
It is just a JavaScript function, that receives that node tree and change it.
Read some node, remove unnecessary, add necessary nodes.
And pass changed tree to next plugin.

---

How it looks like in code?

You take PostCSS from npm. Set array with plugins. And process your CSS
through this plugins.

---

Plugin code is simple.

Do you remember slide aout units in preprocessors. In PostCSS it is very easy
to add new unit.

This is your plugin’s function. It receive a parsed tree. We iterates through
all declaration. And replace rem unit to pixels.

That’s all. New plugin with CSS unit polyfill by 1-2-3-4 lines.

---

So, let’s be clear.
What is the difference between preprocessors and PostCSS?

Preprocessors are a monolithic template language,
when you mix your styles and code.

PostCSS transforms your styles by small JS function.
All features re in modules. You can use one variable module or other?
Of none of them if you didn’t want to use variables.

---

So why it is important? Do you remember about evolution?
This plugins are ideal for tht evolution process.

You wrote a plugin with some crazy idea. For example, new way to optimize
load time.

Then some developers uses it. Other developers hates it.

But emotions doesn’t matter. If your crazy idea works, you will receive
good feedback. More develoeprs will use it.

And we will now that this new way or new syntax works before specification.
Even if at the beggining that idea looked really strange.

---

But a told only about theory. Current science tell that theory is nothing
without practical result.

If PostCSS ideas really works we will see new features or awesome benchmark
results.

So, does PostCSS has this results?

---

First. Of course, we have plugins for variables, …

---

… nesting …

---

… and mixins.

---

But this features are not built-in as part of PostCSS. They are just a common
plugins. If you didn’t use mixin, you can remove mixin plugin.
Or even replace it by plugin with different syntax.

But it is not about freedom to choose. Main benefit is that this plugins
are really small and simple. For example, nesting is working because of
few functions in 60 lines of JS code. It is very easy to maintain this features.

---

But, of course, PostCSS is not only about doing Sass job by plugin.
PostCSS is about many other tasks, which are impossible on proprocessors.

Autoprefixes is most popular example from this whole new frontend world.

There is no mixins. You just write CSS like there is no prefixes anymore.
Autoprefixer will take Can I Use data, find necessary selectors and properties
and generates new CSS with prefixes. Like magic.

---

But we can go feather.

How many people use Babel? …

It compiles future ES6 JavaScript to old JS for current browsers.

But why we can do so for CSS? Maxime from France wrote cssnext, PostCSS plugin
to compile future CSS 4 to CSS 3 for current browsers.

For example, in CSS 4 you can use variables, color transformations,
many shortcuts, or even define you own custom selector. And all of that will
work right now.

---

Next I tell you very scary story. China is a big market with a lot of money.
But even IE 6 is still popular there. Poor Chinese developers.

So, Alibaba, one of the biggest Chinese IT company, wrote PostCSS plugin
to solve their IE problem. It is live previous cssnext but it works
in other way.

It coverts CSS 3 to CSS 2. Add many hacks for old IE.

---

Next will be a magic. PostCSS plugin, that add new selector.

This selector will be apply if there are only some count items in list.
So, for example, we can set 25% width menu links only if menu contains 4 links.

For 5 items menu we will use 20% width.

---

We all know that fast loading sites make more money. And we has two
way to optimize images. Base64 inline and sprites.

Inline imges are simplier, but they makes our CSS bigger. And user will see
nothig until CSS is loading.

Other problem is when you use one images for many classes
in different CSS files.

But in PostCSS we have new way. It is called CSS sprite.

PostCSS plugin will find all inlined images and move them to other file.
Also it will join selectors with same classes.

As result, main CSS with your site design will be small.

---

But PostCSS is not only to add something to your styles. PostCSS working
awesome as CS linter.

For example, Twitter wrote PostCSS plugin to lint their CSS
for Twitter guidelines. They use modification of awesome BEM methodology.

---

But PostCSS linters can be much smarter, that jshint or csslint.

Doiuse is a PostCSS plugin like a Autoprefixer. But it works in diferent way.

It takes Can I Use data and check do all your browers support CSS that
you write. Maybe your forgot that IE 9 doesn’t support flexbox?

---

And this is my favorite plugin.

This is a Hebrew Wikipedia.

As you know Arabs and Jews has right-to-left writing.
Our language affects on our mind, the way how we think.

So in right-to-left countries future is not on the right. Time does from right
to left. So progress bar should go in other direction too, from right to left.

We need to mirror all our design. But, of course, we didn’t want to support
two different CSS files.

---

And Mohammad from Jordan wrote a really awesome plugin.
It replaces mirrors you styles automatically.
It replaces left to right, changes margin values order.

It works like a magic and so WordPress uses it to convert own styles
for Arabic and Hebrew users.

---

I mentioned only mot interesting plugins, which are impossible on Sass.

But PostCSS has many other plugin from really good developers around the world.

I will get a link to this presentation on last slide.
By this link you can find many other awesome tools to make you work better.

---

I showed you that PostCSS can do much more, that preprocessors.
Only a Autoprefixer is much smarter that Compass. And Cssnext can even add
new syntax.

But does it work fast?

Because Sass team rewrote their project to C++ and killed compatibility
with Compass to be the fastest preprocessor.

Can a smarter tool on JavaScript can be faster than C++?

---

And this is why modular CSS processing is amazing!

PostCSS written on JavaScript is 4 times faster, that libsass written on C++.

Does somebody use old Ruby Sass? For example, because of Compass?

If you will move to PostCSS, you will have more features and 40 times faster
frontend build process.

---

So, what is benefits of using PostCSS right now?

It is much faster and have many new features to make your frontend work better.
All of this because of modular way inside PostCSS.

---

But I lied to you. Talk title is “Future after Sass”. But PostCSS is not
a future, it is a present.

---

According npm statistics, we a close to half million. It is more, that
Babel, Stylus or libsass.

---

Paul Irish tols me, that Google uses PostCSS with Autoprefixer.

WordPress uses PostCSS with Autoprefixer and RTLCSS.

Taobao, largest internet shop in China, not only uses PostCSS, but also writed
many awesome plugins.

But most exciting example is Twitter. Necolas told that Twitter doesn’t use
any preprocessor at all. They moved from Less to Rework postprocessor
and not in the middle of migration to PostCSS only solution.

This slide shows not only big names. But it shows that PostCSS is absolutly
production ready.
We have many users around the world.
With many different cases.
With hacks aand legacy CSS.
And PostCSS parses all this complicated cases.

---

PostCSS became a trend.

A List Apart wrote a article about “Dark Side” of preprocessors
and that PostCSS can save us from it.

---

Ben Frain, author of “Sass and Compass for designers” wrote good article
about breaking up with Sass.

---

So, what I want from you to do at this weekend?

---

If you wnt to write some CSS tool, linter, library. Look at PostCSS.

First, PostCSS is better that regexp, because it has very accurate parser
and will generate and update source maps.

Second, PostCSS is better tht mixins library, because you will have
bigger user base. Mixin library will work only with one preprocessor.
Autoprefixer or other PostCSS plugin can be executed after preprocessor,
so users use it any enviroments.

---

If you didn’t use PostCSS at all, you must add at least Autoprefixer.

There are many reasons why Autoprefixer is must-have library.
But I will use big names.

Google recommends only a Autoprefixer as a tool to handle prefixes.

---

If your project ues only Autoprefixer, you should look at other plugins.

PostCSS has many plugins. They are aweome as Autoprefixer too.

---

And if you start a new project, you should think about PostCSSS only solution.

Twitter is happy it.

PostCSS can do varibles, nested and mixins better that preprocessors.
So why you need this big and slow tools?

Because IT is all about simplicity. And one tool is a simplier that two.

---

That’s all. You can fint project and github-com-slash-postcss-slash-postcss.
Here is keynotes with all links. Here is PostCSS Twitter and our company sites.

Now it is time for your questions.
For every question you will receive small Russian candy. Like this.
