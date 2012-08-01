---
layout: default
name: js
toc:
  - bookmark: overview
  - bookmark: code_layout
  - bookmark: module_imports
  - bookmark: whitespace_in_expressions_and_statements
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

<!-- ## Documentation

Use [TomDoc][4] to the best of your ability. Since we do a lot of DOM caching and such, I don't think it's plausable to strictly keep to it (and document every single method/property).

## Selectors

Try to prefix all javascript-based selectors with `js-`. This is taken from [slightly obtrusive javascript][5]. The idea is that you should be able to tell a presentational class from a functional class. Most of the codebase doesn't do this, let's try and move toward it. -->

 [1]: https://github.com/jashkenas
 [2]: http://jashkenas.github.com/coffee-script/
 [3]: http://mislav.uniqpath.com/2010/05/semicolons/
 [4]: http://tomdoc.org
 [5]: http://ozmm.org/posts/slightly_obtrusive_javascript.html


# CoffeeScript Style Guide

Since new javascript should be written in coffeescript, we will immediately proceed with the best practices and coding conventions for the [CoffeeScript][coffeescript] programming language.

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

* Immediately inside parentheses, brackets or braces

      ($ 'body') # Yes
      ( $ 'body' ) # No

* Immediately before a comma

      console.log x, y # Yes
      console.log x , y # No

Additional recommendations:

- Always surround these binary operators with a **single space** on either side
  
  - assignment: `=`
  
    - _Note that this also applies when indicating default parameter value(s) in a function declaration_

          test: (param = null) -> # Yes
          test: (param=null) -> # No

    - augmented assignment: `+=`, `-=`, etc.
    - comparisons: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
    - arithmetic operators: `+`, `-`, `*`, `/`, etc.

    - _(Do not use more than one space around these operators)_

          # Yes
          x = 1
          y = 1
          fooBar = 3

          # No
          x      = 1
          y      = 1
          fooBar = 3


## Comments

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code. (Ideally, improve the code to obviate the need for the comment, and delete the comment entirely.)

The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.

If a comment is short, the period at the end can be omitted.

### Block Comments

Block comments apply to the block of code that follows them.

Each line of a block comment starts with a `#` and a single space, and should be indented at the same level of the code that it describes.

Paragraphs inside of block comments are separated by a line containing a single `#`.

      # This is a block comment. Note that if this were a real block
      # comment, we would actually be describing the proceeding code.
      #
      # This is the second paragraph of the same block comment. Note
      # that this paragraph was separated from the previous paragraph
      # by a line containing a single comment character.

      init()
      start()
      stop()

### Inline Comments

Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).

All inline comments should start with a `#` and a single space.

The use of inline comments should be limited, because their existence is typically a sign of a code smell.

Do not use inline comments when they state the obvious:

      # No
      x = x + 1 # Increment x


However, inline comments can be useful in certain scenarios:

      # Yes
      x = x + 1 # Compensate for border


## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives][camel-case-variations].)_

_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)_

For constants, use all uppercase with underscores:

      CONSTANT_LIKE_THIS

Methods and variables that are intended to be "private" should begin with a leading underscore:

      _privateMethod: ->

[coffeescript]: http://jashkenas.github.com/coffee-script/
[coffeescript-issue-425]: https://github.com/jashkenas/coffee-script/issues/425
[camel-case-variations]: http://en.wikipedia.org/wiki/CamelCase#Variations_and_synonyms