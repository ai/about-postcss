Hi, my name is Andrey Sitnik.

---

I am from Russia, Saint Petersburg.

“Winter is comming” is totally about my country.

---

I am lead frontend developer in Evil Martians.

---

Unfortunately, right now we have no robots and blaster.

Only Rails and React.

---

But we worked on Groupon Russia and eBay Social.

And my current project to test new technologies is Amplifr.com,
a social media tool.

---

But, I think, you can know me for my open source.
As author of Autoprefixer.

So today, I will talk about CSS processors.

How many people here do use Stylus? (Please, raise your hand.)
Less?
Sass?
Autoprefixer?

If you have used Autoprefixer, you may saw, that it does not work like mixin
libraries, like Compass or Bourbon.

It doesn’t have mixins at all. You just write selectors and properties.
And it just works — like magic.

This is because Autoprefixer is only a tip of the iceberg of an entirely new way
to process your CSS.

In fact, Autoprefixer is not a preprocessor at all.
It is just a plugin for PostCSS,
a tool to extend or even replace CSS preprocessors.

So today I will tell you about PostCSS.

---

We will start with some theory.

Why is using CSS processors so important.
And what ideas are behind PostCSS.

---

I belive in evolution.

I believe that every long-term development is based on evolution.

We have a great examples right in front of us. The biologically evolution.
We use genetic algorithms in computer science.
Richard Dawkins suggested that even human ideas are created
in same evolution process.

---

And *every* evolution process is based on three steps.

*Random* mutation.
Natural selection *in the wild*.
And inheritance.

But do we have these steps in our Web?
Does W3C uses evolution process to develop new specifications?

Of course, we have a lot of inheritance.
A lot of legacy code and old specifications.

---

Do we really have a selection?

Blink tag was a *non-standard* tag working *only* in Firefox.
But even in this case Mozilla was forced to support blink tag for *19 years*.

If some technology becomes a standard, many sites start to use it.
But how we can fix some issue in standard? For we can remove bad ideas?

---

So we have not chance to fail in our standard.

Will you think about some awesome but litle crazy ideas,
if you must support your mistakes for decades?

And it is a main problem. Many great ideas looked very crazy at the beginning.
What people thought about iPhone, when it was released?
What people thought about frontend 5 years ago?
What people thought about Web applications 15 years ago?

Development is about making a mistakes.
There is no great ideas without mistakes.

And this is why is so important to have have some playground.

---

And this is why preprocessors are a big deal.
They are this kind of a playground.

Every developer can use own compiler. It is not a global standard.
So we are not afraid to make a mistake.

We creates CoffeeScript with many crazy ideas.
We got feedback from users.
And then took best ideas to a standard.

Even the next-next ES7 takes async-await
after it was tested in IcedCoffeeScript.

And we can get real world feedback before idea becomes a standard.

---

So I am very happy about JavaScript preprocessors.
For example, Elm with time travel debugger.

But do CSS preprocessors is still this kind of playground?
I didn’t think so.

---

But let’s start from the beginning. Whhat is CSS preprocessor?

They are like a template language.
Like PHP, but you mix your code with CSS templates.

---

A preprocessor tool like Compass or Bourbon can only create mixins,
functions and variables.

---

And it is a first big problem.

How we can add polyfill for units?

Could we create Autoprefixer with mixins?

---

And second problem is a source of the first one.

Preprocessor codebase is big and very monolithic.

Can *you* add something to preprocessor?

Sass team even went further.
To get better performance, they rewrote project to C++
and now we have even less developers who can add something new.

---

And a last but not least problem. Preprocessors are template language.

But is it a good language?

Can you read this code? Me neither.
But it is just a transition mixin from Compass.

Sass is nice for simple tasks.
But is it easy to code some complicated stuff on Sass?

---

And these are the ideas behind PostCSS.

Remove limitations of current preprocessors.
Make a playground for crazy ideas.

---

But PostCSS was not the first.

3 years ago, TJ Holowaychuk, Stylus maintainer, saw the same problems.
He understood that preprocessor — as an idea — was finished.

He started a new modular CSS processor tool, Rework.

When I thought about Autoprefixer, I was looking for some new tool.
Better that Sass.
And when I saw Rework, I thought that it was a revolution.

---

But Autoprefixer quickly became too big for Rework.
We did require better source map support and
more accurate parser to process legacy CSS with hacks.

And this is how PostCSS was started.

---

So, how does a modular CSS processor work?

PostCSS core contains only two small parts. CSS parser which returns
tree of node’s objects. And stringifier that converts node tree to CSS string.

That’s all. By default, PostCSS will not change a byte of your CSS.
It will just parse it, even saves all whitespace.
And converts it back to string.

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

Do you remember my slide about units in preprocessors?
In PostCSS it is very easy to add new unit.

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

But emotions don’t matter. If your crazy idea works, you will receive
good feedback. More developers will use it.

And we will know that this new way or new syntax works before
it becomes a specification.
Even if at the beginning that idea looked really strange.

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

But these features are not built-in as part of PostCSS.
They are just a common plugins.
If you didn’t use mixins, you can remove the mixin plugin.
Or even replace it by a plugin with different syntax.

But it is not about freedom to choose.
Main benefit is that these plugins are really small and simple.
For example, nesting is working because of few functions in 60 lines of JS code.
It is very easy to maintain these features.

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

But why can’t we do so for CSS? Maxime from France wrote cssnext,
a PostCSS plugin to compile future CSS 4 to CSS 3 for current browsers.

For example, in CSS 4 you can use variables, color transformations,
many shortcuts, or even define your own custom selector.
And all of that will work right now.

---

Next I will tell you very scary story.
China is a big market with a lots of money.
But even IE 6 is still popular there.
Poor Chinese developers.

So, Alibaba, one of the biggest Chinese IT companies, wrote a PostCSS plugin
to solve their IE problem. It is live previous cssnext but it works
in other way.

It coverts CSS 3 to CSS 2. Add adds many hacks for old IE.

---

Have you read article “The End of Global CSS”?
There is a idea how to isolate component selector.
Like a BEM but with 100% guarantees.

This idea was already implemented in webpack. And name has CSS Modules name.

They transform all you selectors. Add component name and random number.
And, of course, they do it with PostCSS.

It is a great example of that evolution.
Crazy idea, PostCSS prototype, real feedback and now in webpack and special
GitHub orgranization.

---

Or other example. About 5% of users can’t see some colors. 5% is big number.
It is more, that IE users for some projects.
So we need to test colors combinations.

This plugin from Netflix replaces all colors to how colorblinds see.

Of course, there are many other better way to test it.
But it is a good example of PostCSS power.
Maybe it will be more useful in your case.

---

But PostCSS is not only to add something to your styles.
PostCSS working awesome as CSS linter.

Twitter wrote PostCSS plugin to lint their CSS for Twitter BEM guidelines.

---

But PostCSS linters can be much smarter.

Doiuse is a PostCSS plugin, like a Autoprefixer.
But it works in a different way.

It takes Can I Use data and check do all your browsers support CSS that
you write. Maybe you have forgot that IE 9 doesn’t support flexbox?

---

And this is my favorite plugin.

This is a Hebrew Wikipedia.

As you know there is right-to-left writing in Arabic world.
Our language affects on our mind, and the way how we think.

So in right-to-left countries the “future” is not on the right.
Time goes from right to left.
So a progress bar should go in another direction too, from right to left.

We need to mirror all our of design. But, of course, we don’t want to support
two different CSS files.

---

And Mohammad from Jordan wrote a really awesome plugin.
It mirrors your styles automatically.
It replaces left to right, changes margin values order.

It works like magic, and so WordPress uses it to convert own styles
for Arabic and Hebrew users.

---

I've mentioned only the most interesting plugins,
which are impossible with Sass.

But PostCSS has many other plugins from really good developers around the world.

I will post a link to this presentation on the last slide.
Following this link, you can find many other awesome tools to make
your work better.

---

I’ve shown you that PostCSS can do much more than preprocessors.
Autoprefixer is much smarter that Compass.
And cssnext can even add a new syntax.

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

According to npm statistics, we’re close to half a million downloads.
It is more than Babel, Stylus or libsass have.

---

Paul Irish told me that Google uses PostCSS with Autoprefixer.

WordPress uses PostCSS with Autoprefixer and RTLCSS.

Taobao, largest e-commerce in China, not only uses PostCSS, but also wrote
many awesome plugins.

But the most exciting example is Twitter. Nicolas told that Twitter doesn’t use
any preprocessor at all. They moved from Less to Rework postprocessor
and not in the middle of migration to PostCSS only solution.

And this is why PostCSS is absolutely production ready.
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

If you don’t use PostCSS at all, you must add at least Autoprefixer.

There are many reasons why Autoprefixer is must-have library.
But I will use big names.

Google recommends to use only Autoprefixer as a tool to handle prefixes.

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
Here are PostCSS Twitter and our company sites.

Now it is time for your questions.
For every question you will receive small Russian candy. Like this.
