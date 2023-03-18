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
- Duplication of Knowledge about Topology.
- Behavior Attractors.
- Testing State vs Testing Behaviour.
- Don't Have Tests Depend on Previous Tests.
- Breaking Abstraction Level.
- Naive Duplication.
- Procedural Polymorphism.
- Making Assumptions About Usage.
- Unwrapping an Object.
- Inverting Composition as a Replacement for Inheritance.

## Other Good Stuff

- S.O.L.I.D Principles.
- Law of Demeter.
- Constraints:
  - Lines of code per method <= 3.
  - No in-method branching statements.
  - No primitives across method boundaries.
  - Mute ping-pong pairing.
  - Find loophole.
  - No return values.
  - Program like it's 1969.
  - Object Calisthenics.