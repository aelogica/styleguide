---
layout: default
name: js
toc:
  - bookmark: overview
  - bookmark: code_layout
  - bookmark: module_imports
  - bookmark: whitespace_in_expressions
  - bookmark: comments
  - bookmark: naming_conventions
  - bookmark: functions
  - bookmark: strings
  - bookmark: conditionals
  - bookmark: looping_and_comprehensions
  - bookmark: extending_native_objects
  - bookmark: exceptions
  - bookmark: annotations
  - bookmark: miscellaneous
---

# Overview

Most, if not all, of this page was taken from [polarmobile's Coffeescript Styleguide](https://github.com/polarmobile/coffeescript-style-guide). The idea is to make this document evolve over time as we follow this internally.

## Coding Style

*   Avoid adding new `.js` files. Instead, write new JS in CoffeeScript.
*   Use implicit parentheses when possible.
<!-- *   Follow [@jashkenas][1]'s style. See the [documentation][2] for good examples. -->
<!-- *   Any top level objects should be namespaced under the `GitHub` namespace. -->
*   Don't ever use `$.get` or `$.post`. Instead use `$.ajax` and provide both a success handler **and** an error handler.
*   Use `$.fn.on` instead of `$.fn.bind`, `$.fn.delegate` and `$.fn.live`.

## Documentation

Use [TomDoc][4] to the best of your ability. Since we do a lot of DOM caching and such, I don't think it's plausable to strictly keep to it (and document every single method/property).

## Selectors

Try to prefix all javascript-based selectors with `js-`. This is taken from [slightly obtrusive javascript][5]. The idea is that you should be able to tell a presentational class from a functional class. Most of the codebase doesn't do this, let's try and move toward it.

 [1]: https://github.com/jashkenas
 [2]: http://jashkenas.github.com/coffee-script/
 [3]: http://mislav.uniqpath.com/2010/05/semicolons/
 [4]: http://tomdoc.org
 [5]: http://ozmm.org/posts/slightly_obtrusive_javascript.html


# CoffeeScript Style Guide

Since new javascript should be written in coffeescript, we will proceed with the best-practices and coding conventions for the [CoffeeScript][coffeescript] programming language.

<!-- ## Table of Contents

* [The CoffeeScript Style Guide](#guide)
  * [Code Layout](#code_layout)
    * [Tabs or Spaces?](#tabs_or_spaces)
    * [Maximum Line Length](#maximum_line_length)
    * [Blank Lines](#blank_lines)
    * [Trailing Whitespace](#trailing_whitespace)
    * [Encoding](#encoding)
  * [Module Imports](#module_imports)
  * [Whitespace in Expressions and Statements](#whitespace)
  * [Comments](#comments)
    * [Block Comments](#block_comments)
    * [Inline Comments](#inline_comments)
  * [Naming Conventions](#naming_conventions)
  * [Functions](#functions)
  * [Strings](#strings)
  * [Conditionals](#conditionals)
  * [Looping and Comprehensions](#looping_and_comprehensions)
  * [Extending Native Objects](#extending_native_objects)
  * [Exceptions](#exceptions)
  * [Annotations](#annotations)
  * [Miscellaneous](#miscellaneous) -->

## Code layout

### Tabs or Spaces?

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

### Maximum Line Length

Limit all lines to a maximum of 79 characters.

### Blank Lines

Separate top-level function and class definitions with a single blank line.

Separate method definitions inside of a class with a single blank line.

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

### Trailing Whitespace

Do not include trailing whitespace on any lines.

### Encoding

UTF-8 is the preferred source file encoding.

## Module Imports

If using a module system (CommonJS Modules, AMD, etc.), `require` statements should be placed on separate lines.

    require 'lib/setup'
    Backbone = require 'backbone'

These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

## Whitespace in Expressions and Statements

Avoid extraneous whitespace in the following situations:

- Immediately inside parentheses, brackets or braces

      ($ 'body') # Yes
      ( $ 'body' ) # No

- Immediately before a comma

    console.log x, y # Yes
    console.log x , y # No

Additional recommendations:

- Always surround these binary operators with a **single space** on either side

  - assignment: `=`

    - _Note that this also applies when indicating default parameter value(s) in a function declaration_

        test: (param = null) -> # Yes
        test: (param=null) -> # No


[coffeescript]: http://jashkenas.github.com/coffee-script/
[coffeescript-issue-425]: https://github.com/jashkenas/coffee-script/issues/425
[camel-case-variations]: http://en.wikipedia.org/wiki/CamelCase#Variations_and_synonyms