---
layout: default
name: js
---
Most, if not all, the content in this part was taken from [Github Styleguide](https://github.com/styleguide/javascript). Changes were made to fit our work environment.

# JavaScript Styleguide

If you're visiting from the internet, feel free to learn from our style. This is a guide we use for our own apps internally at GitHub. We encourage you to setup one that works for your own team.

## Coding Style

### CoffeeScript

*   Write new JS in CoffeeScript.
*   Use soft-tabs with a two space indent.
*   Always use camelCase, never underscores.
*   Use implicit parentheses when possible.
*   Follow [@jashkenas][1]'s style. See the [documentation][2] for good examples.
*   Any top level objects should be namespaced under the `GitHub` namespace.
*   Don't ever use `$.get` or `$.post`. Instead use `$.ajax` and provide both a success handler **and** an error handler.
*   Use `$.fn.on` instead of `$.fn.bind`, `$.fn.delegate` and `$.fn.live`.

### Existing JavaScript

*   Avoid adding new `.js` files.
*   Use soft-tabs with a two space indent.
*   Do your best to never use a semicolon. This means avoiding them at line breaks and avoiding multi-statement lines. For more info, read [Mislav's blog post][3].

## Documentation

Use [TomDoc][4] to the best of your ability. Since we do a lot of DOM caching and such, I don't think it's plausable to strictly keep to it (and document every single method/property).

## Selectors

Try to prefix all javascript-based selectors with `js-`. This is taken from [slightly obtrusive javascript][5]. The idea is that you should be able to tell a presentational class from a functional class. Most of the codebase doesn't do this, let's try and move toward it.

 [1]: https://github.com/jashkenas
 [2]: http://jashkenas.github.com/coffee-script/
 [3]: http://mislav.uniqpath.com/2010/05/semicolons/
 [4]: http://tomdoc.org
 [5]: http://ozmm.org/posts/slightly_obtrusive_javascript.html