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

- There’s no client-side router to maintain, there’s no state to carefully manage.
- This happens by intercepting all clicks on `<a href>` links to the same domain.
- Forms are turned into fetch requests from which Turbo Drive will follow the redirect and render the HTML response. 
- During rendering, Turbo Drive replaces the current `<body>` element outright and merges
the contents of the `<head>` element.
- The JavaScript window and document objects, and the `<html>` element,
persist from one rendering to the next.

## Turbo Frames: Decompose complex pages

- With Turbo Frames, you can place those independent segments inside frame
elements that can scope their navigation and be lazily loaded.
- Scoped navigation means all interaction within a frame, like clicking links
or submitting forms, happens within that frame, keeping the rest of the
page from changing or reloading.
- To wrap an independent segment in its own navigation context, enclose it in a `<turbo-frame>` tag.
- Frames can also defer loading their contents in addition to scoping navigation.
- To defer loading a frame, add a `src` attribute whose value is the URL to be automatically loaded.

## Turbo Streams: Deliver live page changes

- Turbo Streams let us change any part of the page in response to updates sent
over a WebSocket connection, SSE or other transport.
- Turbo Streams introduces a `<turbo-stream>` element with seven basic actions:
  - `append`.
  - `prepend`.
  - `replace`.
  - `update`.
  - `remove`.
  - `before`.
 
