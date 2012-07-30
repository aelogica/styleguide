---
layout: default
name: js
toc:
  - bookmark: overview
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
Most, if not all, the content in this part was taken from [Github Styleguide](https://github.com/styleguide/javascript). Changes were made to fit our work environment.

# Javascript Styleguide
If you're visiting from the internet, feel free to learn from our style. This is a guide we use for our own apps internally at GitHub. We encourage you to setup one that works for your own team.

## Coding Style

### CoffeeScript
 - write new JS in Coffescript
 - Use soft-tabs with a two space indent.
 - Always use camelCase, never underscores.
 - Use implicit parentheses when possible.
 - Follow @jashkenas's style. See the documentation for good examples.
 - Any top level objects should be namespaced under the GitHub namespace.
 - Don't ever use $.get or $.post. Instead use $.ajax and provide both a success handler and an error handler.
 - Use $.fn.on instead of $.fn.bind, $.fn.delegate and $.fn.live.

### Existing Javascript
 - Avoid adding new .js files.
 - Use soft-tabs with a two space indent.
 - Do your best to never use a semicolon. This means avoiding them at line breaks and avoiding multi-statement lines.
 - For more info, read Mislav's blog post.

### Sample Header
 - some js content
 - another
 - something

