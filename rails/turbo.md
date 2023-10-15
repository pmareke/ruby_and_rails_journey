# [Turbo](https://turbo.hotwired.dev)

The heart of Hotwire is Turbo. A set of complementary techniques for speeding
up page changes and form submissions, dividing complex pages into components,
and stream partial page updates over WebSocket:

- *Turbo Drive* accelerates links and form submissions by negating the need for full page reloads.
- *Turbo Frames* decompose pages into independent contexts, which scope navigation and can be lazily loaded.
- *Turbo Streams* deliver page changes over WebSocket, SSE or in response to form submissions using just HTML and a set of CRUD-like actions.

## Introduction

The server deliver HTML directly, which means all the logic for checking permissions,
interacting directly with your domain model, and everything else that goes into
programming an application can happen more or less exclusively within your favorite
programming language.

## Turbo Drive: Navigate within a persistent process

- `Turbo.visit` performs an Application Visit to the given location.
- If location is a cross-origin URL Turbo performs a full page load by setting `window.location`.
- If action is unspecified, Turbo Drive assumes a value of `advance`.
- `Turbo.cache.clear()` removes all entries from the Turbo Drive page cache.
- `Turbo.setConfirmMethod(confirmMethod)` Sets the method that is called by links decorated with data-turbo-confirm.
- `Turbo.session.drive = false` turns Turbo Drive off by default.

## Turbo Frames: Decompose complex pages

```html
<turbo-frame id="messages">
  <a href="/messages/expanded">
    Show all expanded messages in this frame.
  </a>
</turbo-frame>
```

- Eager-loaded frame works like the basic frame, but the content is loaded from a remote src first.
- Lazy-loaded frame like an eager-loaded frame, but the content is not loaded from src until the frame is visible.
- Use `target="_top"` links and form will replace the whole page.
- The `<turbo-frame>` element is a custom element with its own set of HTML attributes and JavaScript properties.
  - `src` accepts a URL or path value that controls navigation of the element.
  - `loading` has two valid enumerated values: `eager` and `lazy`.

## Turbo Streams: Deliver live page changes

```html
<turbo-stream action="ACTION" target="dom_id">
  <template>
    ...
  </template>
</turbo-stream>
```

- There are several actions:
  - `append`: appends the content within the template tag to the container designated by the target dom id.
  - `prepend`: prepends the content within the template tag to the container designated by the target dom id.
  - `replace`: replaces the element designated by the target dom id..
  - `update`: updates the content within the template tag to the container designated by the target dom id.
  - `remove`: removes the element designated by the target dom id.
  - `before`: inserts the content within the template tag before the element designated by the target dom id.
  - `after`: inserts the content within the template tag after the element designated by the target dom id.

