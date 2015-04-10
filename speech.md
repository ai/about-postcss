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

TODO

---

That’s all. You can fint project and github-com-slash-postcss-slash-postcss.
Here is keynotes with all links. Here is PostCSS Twitter and our company sites.

Now it is time for your questions.
For every question you will receive small Russian candy. Like this.
