---
layout: default
name: js
toc:
  - bookmark: introduction
  - bookmark: naming_conventions
  - bookmark: code_layout
  - bookmark: module_imports
  - bookmark: whitespace_in_expressions_and_statements
  - bookmark: comments
  - bookmark: functions
  - bookmark: strings
  - bookmark: conditionals
  - bookmark: looping_and_comprehensions
  - bookmark: extending_native_objects
  - bookmark: exceptions
  - bookmark: annotations
  - bookmark: miscellaneous
---

## Intoduction

Most, if not all, of this page was taken from [polarmobile's Coffeescript Styleguide](https://github.com/polarmobile/coffeescript-style-guide). The idea is to make this document evolve over time as we follow this internally.

The guide can be summarized in two steps:

*   Avoid adding new `.js` files. Instead, write new JS in CoffeeScript.
*   Follow [@jashkenas][1]'s style. See the [documentation][2] for good examples.

 [1]: https://github.com/jashkenas
 [2]: http://jashkenas.github.com/coffee-script/

Since new javascript should be written in coffeescript, we will immediately proceed with the best practices and coding conventions for the [CoffeeScript](http://jashkenas.github.com/coffee-script/) programming language. Most of the content here will still be applicable to Javascript.


## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives](http://en.wikipedia.org/wiki/CamelCase#Variations_and_synonyms).)_

_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here](https://github.com/jashkenas/coffee-script/issues/425).)_

For constants, use all uppercase with underscores:

      CONSTANT_LIKE_THIS

Methods and variables that are intended to be "private" should begin with a leading underscore:

      _privateMethod: ->


## Code layout

### Tabs or Spaces?

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

### Parenthesis

Use implicit parentheses when possible.

### Bindings

Use `$.fn.on` instead of `$.fn.bind`, `$.fn.delegate` and `$.fn.live`.

### AJAX

Don't ever use `$.get` or `$.post`. Instead use `$.ajax` and provide both a success handler **and** an error handler.

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



## Functions

_(These guidelines also apply to the methods of a class.)_

When declaring a function that takes arguments, always use a single space after the closing parenthesis of the arguments list:

      foo = (arg1, arg2) -> # Yes
      foo = (arg1, arg2)-> # No


Do not use parentheses when declaring functions that take no arguments:

      bar = -> # Yes
      bar = () -> # No


In cases where method calls are being chained and the code does not fit on a single line, each call should be placed on a separate line and indented by one level (i.e., two spaces), with a leading `.`.

      [1..3]
        .map((x) -> x * x)
        .concat([10..12])
        .filter((x) -> x < 11)
        .reduce((x, y) -> x + y)


When calling functions, choose to omit or include parentheses in such a way that optimizes for readability. Keeping in mind that "readability" can be subjective, the following examples demonstrate cases where parentheses have been omitted or included in a manner that the community deems to be optimal:

      baz 12

      brush.ellipse x: 10, y: 20 # Braces can also be omitted or included for readability

      foo(4).bar(8)

      obj.value(10, 20) / obj.value(20, 10)

      print inspect value

      new Tag(new Value(a, b), new Arg(c))


You will sometimes see parentheses used to group functions (instead of being used to group function parameters). Examples of using this style (hereafter referred to as the "function grouping style"):

      ($ '#selektor').addClass 'klass'

      (foo 4).bar 8


This is in contrast to:

      $('#selektor').addClass 'klass'

      foo(4).bar 8


In cases where method calls are being chained, some adopters of this style prefer to use function grouping for the initial call only:

      ($ '#selektor').addClass('klass').hide() # Initial call only
      (($ '#selektor').addClass 'klass').hide() # All calls


The function grouping style is not recommended. However, **if the function grouping style is adopted for a particular project, be consistent with its usage.**

## Strings

Use string interpolation instead of string concatenation:

      "this is an #{adjective} string" # Yes
      "this is an " + adjective + " string" # No

Prefer single quoted strings (`''`) instead of double quoted (`""`) strings, unless features like string interpolation are being used for the given string.


## Conditionals

Favor `unless` over `if` for negative conditions.

Instead of using `unless...else`, use `if...else`:

      # Yes
      if true
        ...
      else
        ...

      # No
      unless false
        ...
      else
        ...

Multi-line if/else clauses should use indentation:

      # Yes
      if true
        ...
      else
        ...

      # No
      if true then ...
      else ...


## Looping and Comprehensions

Take advantage of comprehensions whenever possible:

      # Yes
      result = (item.name for item in array)

      # No
      results = []
      for item in array
        results.push item.name

To filter:

      result = (item for item in array when item.name is "test")

To iterate over the keys and values of objects:

      object = one: 1, two: 2
      alert("#{key} = #{value}") for key, value of object


## Extending Native Objects

Do not modify native objects.

For example, do not modify `Array.prototype` to introduce `Array#forEach`.


## Exceptions

Do not suppress exceptions.


## Annotations

Use annotations when necessary to describe a specific action that must be taken against the indicated block of code.

Write the annotation on the line immediately above the code that the annotation is describing.

The annotation keyword should be followed by a colon and a space, and a descriptive note.

      # FIXME: The client's current state should *not* affect payload processing.
      resetClientState()
      processPayload()

If multiple lines are required by the description, indent subsequent lines with two spaces:

      # TODO: Ensure that the value returned by this call falls within a certain
      #   range, or throw an exception.
      analyze()

Annotation types:

- `TODO`: describe missing functionality that should be added at a later date
- `FIXME`: describe broken code that must be fixed
- `OPTIMIZE`: describe code that is inefficient and may become a bottleneck
- `HACK`: describe the use of a questionable (or ingenious) coding practice
- `REVIEW`: describe code that should be reviewed to confirm implementation

If a custom annotation is required, the annotation should be documented in the project's README.


## Miscellaneous

`and` is preferred over `&&`.

`or` is preferred over `||`.

`is` is preferred over `==`.

`not` is preferred over `!`.

`or=` should be used when possible:

      temp or= {} # Yes
      temp = temp || {} # No

Prefer shorthand notation (`::`) for accessing an object's prototype:

      Array::slice # Yes
      Array.prototype.slice # No

Prefer `@property` over `this.property`.

      return @property # Yes
      return this.property # No

However, avoid the use of **standalone** `@`:

      return this # Yes
      return @ # No

Avoid `return` where not required, unless the explicit return increases clarity.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

      console.log args... # Yes

      (a, b, c, rest...) -> # Yes
