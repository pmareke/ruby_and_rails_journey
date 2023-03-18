# [Understanding the Four Rules of Simple Design](https://leanpub.com/4rulesofsimpledesign)

## 4 Rules of Simple Design

- The order of the rules matters.

### Tests Pass

- If you can't verify that your system works, then it doesn't matter how great your design is.

### Express Intent

- Paying attention to the names and how our code express itself is the key to making our lives easy we came back to it.

### No duplitacion (DRY)

- Every piece of knowledge should have one and only one representation.

### Small

- Do we have code no longer used? Do we have duplicate abstractions? Do we extract too far?.

## Examples

- Tests Names Should Influence Object's API.
  - Symmetry between test names and test code.
  - The tests are the first consumer of the code.
  - We want to describe behaviour and the way we expect to user our code.
- Duplication of Knowledge about Topology.
  - A good way to detect duplication os to ask what happens if we want to change something.
  - `Reification` is the act of taking a concept and make it real by `abstraction`.
  - Isolate the knowledge make our code easy to change.
- Behavior Attractors.
  - By aggressively eliminating knowledge duplication using `reification`, new behaviours will naturally arise.
- Testing State vs Testing Behaviour.
  - Focus on behaviour rather than the state of the objects.
  - Ask what behaviour of our systems require this?.
- Don't Have Tests Depend on Previous Tests.
  - We wan't test failures to be explicit, quickly and effectively.
  - External callers can't use the base constructor.
  - There must be an explicitly named builder method on the class to create and object in a specific and valid state.
- Breaking Abstraction Level.
  - Don't test behaviour including details.
  - Isolate test from the internals of our classes.
- Naive Duplication.
  - Before remove duplicate code, give them a good name.
- Procedural Polymorphism.
  - Variables named `state`are a red flag for expressiveness.
  - Polymorphism is about being able to call a method to an object and have more then one possible behaviour.
  - `if` statements could be replace with Polymorphism.
- Making Assumptions About Usage.
  - `Entity classes` tend to encapsulate and provide behaviour and state.
- Unwrapping an Object.
  - Try to no return values.
  - By eliminating the aability to query data we build objects that are very encapsulated.
  - Objects access their internal state instead of asking other about theirs.
- Inverting Composition as a Replacement for Inheritance.
  - Sometimes duplication is the representation of a bigger entity.
  - Avoid inheritance as much as possible.

## Other Good Stuff

- `S.O.L.I.D` Principles.
  - Single Responsability.
  - Open/Closed.
  - Liskov Substitution.
  - Interface Segreagation.
  - Dependency Injection.
- Law of Demeter.
  - A method can only access either local variables, parameters and instance variables.
  - Only one dot per statement.
- Constraints:
  - Lines of code per method <= 3.
  - No in-method branching statements.
  - No primitives across method boundaries.
  - Mute ping-pong pairing.
  - Find loophole.
  - No return values.
  - Program like it's 1969.
  - Object Calisthenics.