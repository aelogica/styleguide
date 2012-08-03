---
layout: default
name: css
toc:
  - bookmark: introduction
  - bookmark: coding_style
  - bookmark: sass_style
  - bookmark: file_organization
  - bookmark: px_vs_em
  - bookmark: selectors
  - bookmark: misc
  - bookmark: on_ie

---

## Introduction
Most of this is taken from [Github's CSS Styleguide](https://github.com/styleguide/css).

As discussed in our Tuesday lunch meeting, we will use SASS and the Compass Framework using the 960-plugin whenever we can.

## Coding Style

* Use `SASS` syntax (property: value, **not** :property value)
* Use soft-tabs with a two space indent.
* Put spaces after : in property declarations.
* Use hex color codes (downcased) #000 unless using rgba.
* Use // for comment blocks (instead of /* \*/).

Here is a good sample style:

    .menu-item
      display: block
      padding: 10px
      color: #999
      font:
        weight: bold

## SASS Style

* Any $variable or @mixin that is used in more than one file should be put in globals/. Others should be put at the top of the file where they're used.
* As a rule of thumb, don't nest further than 3 levels deep. If you find yourself going further, think about reorganizing your rules (either the specificity needed, or the layout of the nesting).
* Use namespaces whenever possible

      // use the font namespace
      font:
        size: 12px
        style: italic

      // use list-style namespace
      list-style:
        type: disc
        position: inside

## File Organization

* Most components, globals and sections should not be compiled to a css file, so make it a SASS partial by adding an underscore before the filename.
* Plugin styles should be converted to sass for easy modification. Use the [CSS2SASS Converter](http://css2sass.heroku.com/). Or you can also do it from irb using:

    Sass::CSS.new(@css).render(:sass)

where @css is the CSS to be converted. (You'll have to open up the file via Ruby etc., so just use the converter)

    styles
      |─ components
         |─ _markdown.sass
         |─ _sidebar.sass
         |─ _table_of_contents.sass
      |─ globals
         |─ _colors.sass
         |─ _html_defaults.sass
         |─ _mixins.sass
      |─ plugins
         |─ snippet.sass
      |─ sections
         |─ _main_content.sass
      |─ shared
         |─ _header.sass
         |─ _layout.sass
         |─ _nav.sass
      |─ ie.sass
      |─ print.sass
      |─ screen.sass

## PX vs EM

* Use px for font-size, because it offers absolute control over text.

## Selectors

Don't use inefficient selectors. More info can be seen in the [Google Browser Rendering Guide](https://developers.google.com/speed/docs/best-practices/rendering) and in [Mozilla's Writing Efficient CSS](https://developer.mozilla.org/en/Writing_Efficient_CSS). These are some of the main points of the articles:

* Don't overqualify rules. Overqualifying means adding the tag name to an id or a class.

      // bad
      div#nav
      a.current

      // good
      #nav
      .current

* When you have different styles for the same class but different tags for some reason (i.e. different background colors for an li with the current class vs an anchor), use the cascade.

      // bad
      li.current
        background: #f00

      a.current
        background: #ccc

      // good
      .list-item
        .current
          background: #f00

      .links
        .current
          background: #ccc

* Avoid using the child selector. Either use specific classes or when overriding, use the cascade.

      // bad
      ul > li > a.nav-link
        color: #00f

      // good
      .nav-link
        color: #00f

* On the same note, avoid using the universal selector (*).

      // bad
      ul *
        font:
          size: 12px

      // somewhat good
      ul
        font:
          size: 12px

## Misc

* Use simple colors whenever possible:

      // bad
      color: #ffffff

      // good
      color: #fff

      // bad
      color: #aaee33

      // good
      color: #ae3

* Remove units when using 0 values

      // bad
      margin: 10px 0px

      // good
      margin: 10px 0

## On IE

* When required to support IE 7 or 8, avoid using the `:hover` pseudo-selector on non-link elements. Better use a javascript hover or onmouseover function as IE doesn't support it.
