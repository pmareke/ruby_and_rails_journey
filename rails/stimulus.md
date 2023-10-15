# [Stimulus](https://stimulus.hotwired.dev)

- Stimulus is a JavaScript framework with modest ambitions.
- Stimulus is designed to enhance static or server-rendered HTML by connecting JavaScript 
objects to elements on the page using simple annotations.
- These JavaScript objects are called controllers, and Stimulus continuously monitors 
the page waiting for HTML data-controller attributes to appear.
- Aside from controllers, the three other major Stimulus concepts are:
  - `actions`: which connect controller methods to DOM events using data-action attributes
  - `targets`: which locate elements of significance within a controller.
  - `values`: which read, write, and observe data attributes on the controller’s element.

## Controllers Bring HTML to Life

- At its core, Stimulus’s purpose is to automatically connect DOM elements to JavaScript objects.
  - Those objects are called controllers.
- In order to define how this controller should be connected to our HTML, we placing an 
identifier in the `data-controller` attribute in the HTML element.
  - Identifiers serve as the link between elements and controllers.
- The `connect()` method is called each time a controller is connected to the document.
- In order to react to actions (like clicks) in the DOM we need to insert the `data-action` attribute.
- Stimulus lets us mark important elements as targets so we can easily reference them in the controller 
through corresponding properties.

### Controllers

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  ...
}
```

- A controller is the basic organizational unit of a Stimulus application.
- Controllers are instances of JavaScript classes.
- Each controller class inherits from the `Controller` base class exported by the @hotwired/stimulus module.
- Define your controller classes in JavaScript modules, one per file.

### Identifiers

- An identifier is the name you use to reference a controller class in HTML.
- When you add a `data-controller` attribute to an element, Stimulus reads the identifier from the attribute’s value.

### Scopes

- When Stimulus connects a controller to an element, that element and all of its children make up the controller’s scope.
- When nested, each controller is only aware of its own scope excluding the scope of any controllers nested within.
- The `data-controller` attribute’s value is a space-separated list of identifiers.
- Always use camelCase for method and property names in a controller class.

### Events

- If you need controllers to communicate with each other, you should use events.
  - The Controller class has a convenience method called `dispatch`.
  - It takes an `eventName` as the first argument, the payload is held in `detail`.

## LifeCycle callbacks

- The 3 main callbacks are `initialize`, `cinnect` and `disconnect`.

## Actions

```html
<div data-controller="gallery">
  <button data-action="click->gallery#next">…</button>
</div>
```

- Actions are how you handle DOM events in your controllers.
- The `data-action` value is called an action descriptor.
  - It has the form of `event->controller#method`.
- The `data-action` attribute’s value is a space-separated list of action descriptors.
- Actions can have parameters that are be passed from the submitter element.
  - They follow the format of `data-[identifier]-[param-name]-param`.

## Targets

```html
<div data-controller="search">
  <input type="text" data-search-target="query">
  <div data-search-target="errorMessage"></div>
  <div data-search-target="results"></div>
</div>
```

- Targets let you reference important elements by name.
- The `data-[controller]-target` attribute is called a target attribute.
- Its value is a space-separated list of target names.
- Define target names in your controller class using the `static targets` array.

## Outlets

- Outlets let you reference Stimulus controller instances and their controller 
element from within another Stimulus Controller by using CSS selectors.

## Values

```html
<div data-controller="loader" data-loader-url-value="/messages">
</div>
```

```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    fetch(this.urlValue).then(/* … */)
  }
}
```

- Define values in a controller using the `static values` object.
- Value change callbacks let you respond whenever a value’s data attribute changes.
  - `urlValueChanged(value, previousValue) {...}`
