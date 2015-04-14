---

Hi, my name is Andrey Sitnik. I am a front-end developer at a company called Evil Martians.

---

As a front-end in my company I've been behind the development of
front-end of Groupon Russia (since the early days to the IPO), eBay Social, a social marketplace we've done for eBay,
Rocketbank, a "Russian version" of Bank Simple. Most of the time I work on Amplifr.com, a social networking posting and analytics tool.

---

I am also the author of Autoprefixer and PostCSS.

Today, I will talk about CSS processors.

How many people here do use Stylus? (Please, raise your hand.)
Less?
Sass?
Autoprefixer?


If you've used Autoprefixer, you may already know that it does not work the same way Compass, Bourbon
or any other mixins library does. It has no mixins at all. You just write selectors
and properties and it just works — like magic.

This is because Autoprefixer is only a tip of the iceberg of an entirely new way
to process your CSS. In fact, Autoprefixer is just a plugin for PostCSS, a tool to extend
or even replace CSS preprocessors.

Today I will tell you about PostCSS.

---

We will start with some theory. Why is using CSS processors so important.
And what ideas are behind PostCSS.

---

I believe that every long-term development is based on evolution.
We have a great example of biologically evolution in nature.
We use genetic algorithms in computer science.
There are theories that even human ideas is a part of same evolution process.

Evolution is based on three steps. Random mutation. Natural selection
in the wild. And inheritance of the best results.

But do we have these steps in browsers specification process?
Of course, we have a lot of inheritance.
A lot of legacy code and old specifications.

---

But do we really have a selection process? Mozilla was forced to support blink tag
for 19 years. And it was only a non-standard tag working only in Firefox.

If some technology becomes a standard, many sites start to use it.
And we will need decades to replace it for some better standard.

I will tell you a scary story: old IE is still popular in China.

---

Will you think about some new crazy ideas, if you must support your mistakes
for decades?

W3C prefers very long theoretical discussion for every technology, because they
are afraid to make a mistake.

And it is a main problem. Many great ideas looked very crazy at the beginning.
What people thought about iPhone, when it was released? What people thought
about Web applications 15 years ago? Or what people thought about airplanes, when
they were invented century ago.

We must have some playground to make mistakes if we want new awesome ideas.
If we want long-term development of the Web.

---

40% of next JavaScript comes from the CoffeeScript preprocessor.

Even the next ES7 standard takes async-await after we've tested
it in IcedCoffeeScript.

And this is why preprocessors are a big deal. They are this kind of a playground.
Every developer can use own modules.
For example, Haskell has an awesome Elm tool. Clojure has ClosureScript.

And we can get real world feedback before idea becomes a standard.

---

I am very happy about JavaScript preprocessors.
But do CSS preprocessors work as this kind of playground for ideas of next generations?
I didn’t think so.

---

But let’s start from the beginning. How do CSS preprocessors work today?
They are like a template language. Like PHP, but you mix your code with CSS templates.

---

A preprocessor tool like Compass or Bourbon can only create mixins,
functions and variables.

---

And it is a first big problem of preprocessors.

How we can add polyfill for units?

Maybe mixins are enough for today's simple tasks.
But we have many new ideas and preprocessors are too limited for them.
Could we create Autoprefixer with mixins?

---

And there is reason why we did not have new features in preprocessors for years.

Preprocessors codebase is big and very monolithic.

Do you have any friend who did contribute something to preprocessors?

Sass team went further. To get better performance, they rewrote project to C++
and now we have even less developers who can add something new.

---

And a last but not least problem. Preprocessors are template language.

But is it a good language? It is not some complicated function. This huge
code is just a mixin for simple transition from Compass.

Sass is nice for simple tasks. But you will have problems if you want a
better, awesome tool.

---

And these are the ideas behind PostCSS. Create a playground for next generation
of ideas without the limitations of current preprocessors.

---

PostCSS was not the first.

3 years ago, TJ Holowaychuk, Stylus maintainer, saw the same problems.
He understood that preprocessor — as an idea — was finished.

He started a new modular CSS processor tool, Rework.

When I thought about creating Autoprefixer, I was looking for a new tool.
Better that Sass. And when I saw Rework, I thought that it was a revolution.

---

But Autoprefixer quickly became too big for Rework.
We did require better source map support and
more accurate parser to process legacy CSS with hacks.

And this is how PostCSS was started.

---

So, how does a modular CSS processor work?

PostCSS core contains only two small parts. CSS parser which returns
tree of node's objects. And stringifier that converts node tree to CSS string.

That’s all. By default, PostCSS will not change a byte of your CSS.
It will just parse it, even saves all whitespace. And converts it back
to string.

All magic happens in plugins.
Plugin code is very simple too.
It is just a JavaScript function, that receives that node tree and changes it.
Read some node, remove unnecessary and add necessary nodes.
And pass changed tree to the next plugin.

---

How does it look like in code?

You install PostCSS using npm. Set an array with plugins. And process your CSS
through these plugins.

---

Plugin code is simple.

Do you remember my slide about units in preprocessors? In PostCSS it is very easy
to add a new unit.

This is your plugin’s function. It receives a parsed tree. We iterate through
all declarations. And replace rem unit to pixels.

That’s all. New plugin with CSS unit polyfill with 1-2-3-4 lines.

---

So, let’s be clear.
What is the difference between preprocessors and PostCSS?

Preprocessors are a monolithic template language,
which mixes your style and code.

PostCSS transforms your styles with a small JS function.
All features are in modules. You can use one variable module or the other.
Of none of them if you didn’t want to use variables.

---

So why it is important? Do you remember what I said about evolution?
This plugins are ideal for the evolution process.

You write a plugin with some crazy idea. For example, a new way to optimize
page load time.

Then some developers use it. Other developers hate it.

But emotions don't matter. If your crazy idea works, you will receive
good feedback. More developers will use it.

And we will know that this new way or new syntax works before it becomes a
specification. Even if at the beginning that idea looked really strange.

---

But I only told you about how things are in theory. Current science tells
us that theory is nothing without practical result.

If PostCSS ideas really do work, we will see new features or awesome benchmark
results.

So, does PostCSS have these results?

---

First. Of course, we have plugins for variables, …

---

… nesting …

---

… and mixins.

---

But these features are not built-in as part of PostCSS. They are just common
plugins. If you didn’t use mixins, you can remove the mixin plugin.
Or even replace it by a plugin with different syntax.

But it is not about freedom to choose. Main benefit is that these plugins
are really small and simple. For example, nesting is working because of
few functions in 60 lines of JS code. It is very easy to maintain these features.

---

But, of course, PostCSS is not only about doing Sass job with plugins.
PostCSS is about many other tasks, which are impossible with preprocessors.

Autoprefixer is the most popular example from this whole new frontend world.

There are no mixins. You just write CSS like there are no prefixes anymore.
Autoprefixer takes Can I Use data, finds necessary selectors and properties
and generates new CSS with prefixes. Like magic.

---

But we can go further.

How many people use Babel? …

It compiles future ES6 JavaScript to old JS for current browsers.

But why can't we do so for CSS? Maxime from France wrote cssnext, a PostCSS plugin
to compile future CSS 4 to CSS 3 for current browsers.

For example, in CSS 4 you can use variables, color transformations,
many shortcuts, or even define your own custom selector. And all of that will
work right now.

---

Next, I'll tell you a very scary story. China is a big market with lots of money.
But even IE 6 is still popular there. Poor Chinese developers.

So, Alibaba, one of the biggest Chinese IT companies, wrote a PostCSS plugin
to solve their IE problem. It is live previous cssnext but it works
in other way.

It coverts CSS 3 to CSS 2. And adds many hacks for old IE.

---

Next will be some magic. A PostCSS plugin that adds a new selector.

This selector will be applied only if there is some count of items in a list.
So, for example, we can set 25% width menu links only if menu contains 4 links.

For 5 items menu we will use 20% width.

---

We all know that fast loading sites do make more money. And we have two
ways to optimize images. Base64 inline and sprites.

Inline images are simpler, but they make our CSS bigger. And the user will see
nothing until CSS finishes loading.

Other problem is when you use one image for many classes
in different CSS files.

But in PostCSS we have a new way. It is called a CSS sprite.

PostCSS plugin will find all inlined images and move them to another file.
Also it will join selectors with same classes.

As a result, main CSS with your site design will be small.

---

But PostCSS is not only to add something to your styles. PostCSS working
awesome as CS linter.

For example, Twitter wrote a PostCSS plugin to lint their CSS
for Twitter guidelines. They use modification of awesome BEM methodology.

---

But PostCSS linters can be much smarter than jshint or csslint.

Doiuse is a PostCSS plugin, like Autoprefixer. But it works in a different way.

It takes Can I Use data and check do all your browsers support CSS that
you write. Maybe you've forgot that IE 9 doesn’t support flexbox?

---

And this is my favorite plugin.

This is a Hebrew Wikipedia.

As you know, in Arabic world, right-to-left writing is dominant.
Our language affects on our mind, and the way we think.

So in right-to-left countries the "future" is not on the right. Time goes from right
to left. So a progress bar should go in another direction too, from right to left.

We need to mirror all our of design. But, of course, we don't want to support
two different CSS files.

---

And Mohammad from Jordan wrote a really awesome plugin.
It mirrors your styles automatically.
It replaces left to right, changes margin values order.

It works like magic, and so WordPress uses it to convert own styles
for Arabic and Hebrew users.

---

I've mentioned only the mots interesting plugins, which are impossible
to implement on Sass.

But PostCSS has many other plugins from really good developers around the world.

I will post a link to this presentation on the last slide.
Following this link, you can find many other awesome tools to make
your work better.

---

I've shown you that PostCSS can do much more than preprocessors.
Autoprefixer is much smarter that Compass. And Cssnext can even add
a new syntax.

But does it work fast?

Sass team rewrote their project to C++ and killed compatibility
with Compass to be the fastest preprocessor.

Can a smarter JavaScript tool be faster than a C++ tool?

---

And this is why modular CSS processing is amazing!

PostCSS (written in JavaScript) is 4 times faster than libsass written in C++.

Does somebody use old Ruby Sass? For example, because of Compass?

By moving to PostCSS you will have more features and 40 times faster
frontend build process.

---

So, what are the benefits of using PostCSS right now?

It is much faster and has many new features to make your frontend work better.
All of this because of the modular PostCSS way.

---

But I lied to you. Talk title is “Future after Sass”. But PostCSS is not
the future, it is the present.

---

According to npm statistics, we're close to half a million downloads.
It is more than Babel, Stylus or libsass have.

---

Paul Irish told me that Google uses PostCSS with Autoprefixer.

WordPress uses PostCSS with Autoprefixer and RTLCSS.

Taobao, largest e-commerce in China, not only uses PostCSS, but also wrote
many awesome plugins.

But the most exciting example is Twitter. Nicolas told that Twitter doesn’t use
any preprocessor at all. They moved from Less to Rework postprocessor
and not in the middle of migration to PostCSS only solution.

Not onlu does this slide show the bug names, but it also shows that PostCSS
is absolutely production ready.
We have many users around the world.
With many different cases.
With hacks and legacy CSS.
And PostCSS parses all this complicated cases.

---

PostCSS became a trend.

A List Apart wrote an article about “Dark Side” of preprocessors
and that PostCSS can save us from it.

---

Ben Frain, author of “Sass and Compass for designers” wrote a good article
about breaking up with Sass.

---

So, what do I want from you this weekend?

---

If you want to write some CSS tool, linter, library. Look at PostCSS.

First, PostCSS is better than regexps, because it has very accurate parser
and will generate and update source maps.

Second, PostCSS is better than a mixins library, because you will have
bigger user base. Mixin library will work only with a single preprocessor.
Autoprefixer or other PostCSS plugin can be executed after preprocessor,
so users could use it in any environment.

---

If you don't use PostCSS at all, you must add at least Autoprefixer.

There are many reasons why Autoprefixer is must-have library.
But I will use big names.

Google recommends to use Autoprefixer only as a tool to handle prefixes.

---

If your project uses only Autoprefixer, you should look at other plugins.

PostCSS has many plugins. They are as awesome as Autoprefixer.

---

And if you start a new project, you should think about a PostCSS-only solution.

Twitter is happy with it.

PostCSS can do variables, nested and mixins better that preprocessors.
So why you need this big and slow tools?

Because IT is all about simplicity. And one tool is a simpler than two.

---

That’s all. You can find project and github-com-slash-postcss-slash-postcss.
Here are keynotes with all links.
Here are PostCSS Twitter and our company site and twitter.

Now it is time for your questions.
For every question you will receive small Russian candy. Like this.
