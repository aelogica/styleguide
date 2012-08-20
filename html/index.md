---
layout: default
name: html
toc:
  - bookmark: introduction
  - bookmark: doctype
  - bookmark: html_guidelines
---

## Introduction
Most, if not all, of the content here is taken from [Github's HTML Styleguide](https://github.com/styleguide/html) and . The idea is to make this document evolve over time as we follow this internally.

## Doctype

A proper Doctype which triggers standards mode in your browser should always be used. Quirks mode should always be avoided.

      <!DOCTYPE html>

## Semantics

[Shay Howe](http://learn.shayhowe.com/html-css/elements-semantics) and [Paul Boag](http://boagworld.com/dev/semantic-code-what-why-how/) both wrote great articles on this. No need to summarize even if the articles are a bit long.

## Forms

Most of these are taken from [Shay Howe's Building Forms post](http://learn.shayhowe.com/html-css/building-forms). It has been summarized for easy reference.

*   When using labels, **always** use the `for` attribute. This allows the user to be able to click the label to focus on the form element it describes. The `for` attribute should have the same value as the `id` of the element it corresponds to.

        <label for="username">Username</label>
        <input id="username" name="user[name]" type="text" />

*   For checkboxes and radio buttons, you can put the input elements inside the labels so you don't have to add `for` and `id` attributes on each:

        <label><input type="radio" name="true" value="1" checked> True</label>
        <label><input type="radio" name="false" value="0" checked> False</label>

*   It is good practice to use `fieldset`s to group form controls and organized sections.
*   There are many opinions on how to structure forms, but for now, we will follow the `fieldset` with unordered lists style.

        <fieldset>
          <ul>
            <li>
              <label for="username">Username</label>
              <input type="text" id="username" name="username" />
            </li>
            <li>
              <label for="password">Password</label>
              <input type="password" id="password" name="password" />
            </li>
            <li class="actions">
              <input type="submit" value="Submit" />
            </li>
          </ul>
        </fieldset>

## General

*   **Never, ever use inline styles for whatever reason.**
*   Don't use `div`s too freely. Avoid "divitis" - a term used for using too many divs on a page so much that it is counterproductive. If you're adding a div to your structure just for styling, then you are using it wrong. 

        <!-- bad (minor mistake example) -->
        <div class="menu">
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact Us</a></li>
          </ul>
        </div>

        <!-- bad (extreme example) -->
        <div class="menu">
          <div>
            <div><a href="/">Home</a></div>
            <div><a href="/about">About</a></div>
            <div><a href="/contact">Contact Us</a></div>
          </div>
        </div>

        <!-- good -->
        <ul class="menu">
          <li><a href="/">Home</a></li>
          <li><a href="/about">About</a></li>
          <li><a href="/contact">Contact Us</a></li>
        </ul>

*   Use practical and semantic CSS classes when handcrafting HTML. **Never** use colors as class names (or even `id`s). Find a better name for the element to be styled.

        <!-- bad -->
        <span class="red">There was a problem with your form.</span>

        <!-- good -->
        <span class="error">There was a problem with your form.</span>

*   Paragraphs of text should always be placed in a `<p>` tag. Never use multiple `<br/>` tags.
*   Items in list form should always be in `<ul>`, `<ol>`, or `<dl>`, Never a set of `<div>` or `<p>`
*   Every form input that has text attached should utilize a `<label>` tag. *Especially radio or checkbox elements*.
*   Even though quotes around attributes is optional, always put quotes around attributes for readability.

        <p class="line note" data-attribute="106">This is my paragraph of special text.</p>

*   Make use of `<thead>`, `<tfoot>`, `<tbody>`, and `<th>` tags (and Scope attribute) when appropriate. (note: `<tfoot>` goes above `<tbody>` for speed reasons. You want the browser to load the footer before a table full of data.)

        <table summary="This is a chart of invoices for 2011.">
          <thead>
            <tr>
              <th scope="col">Table header 1</th>
              <th scope="col">Table header 2</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <td>Table footer 1</td>
              <td>Table footer 2</td>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td>Table data 1</td>
              <td>Table data 2</td>
            </tr>
          </tbody>
        </table>

*   Specify image alt, title and dimensions. Always follow the image's true dimension as much as possible. If you need to resize, use an image processor like ImageMagick.

        <img src="avatar.jpg" alt="My Avatar" title="This is my avatar" width="50" height="50" />

*   On a similar note, provide `title` tags to links that describe where that link is going.

        <a href="https://github.com/aelogica" title="Aelogica's Github Account">Aelogica's Github Account</a> 
