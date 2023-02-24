# [Practical Object-Oriented Design in Ruby](https://www.informit.com/store/practical-object-oriented-design-an-agile-primer-using-9780134456478?ranMID=24808)

## Chapter 2 - Single Responsibility

- Easy change is:
  - Changes have no unexpected side effects.
  - Small changes in requirements require correspondingly small changes in code.
  - Existing code is easy to reuse.
  - The easiest way to make a change is to add code that in itself is easy to change.
- Code should be TRUE (**Transparent**, **Reasonable**, **Usable** and **Examplary**).
- Nouns represent the simplest candidates to be classes.
- A class that has more than one responsibility is difficult to reuse.
- A class should do the smallest possible useful thing.
  - If the simplest description you can devise uses the word `and`, the class likely has more than one responsibility. 
  - If it uses the word `or`, then the class has more than one responsibility and they aren’t even very related.
- When everything in a class is related to its central purpose, the class is said to be `highly cohesive`.
- `SRP` requires that a class be cohesive, that everything the class does be highly related to its purpose.
- `Behavior` is captured in methods and invoked by sending messages.
- `Data` is held in an instance variable and can be anything from a simple string or a complex hash.
- **Always wrap instance variables in accessor methods instead of directly referring to variables**.
- Direct references into complicated structures are confusing.
- Methods, like classes, should have a single responsibility.
- Separating iteration from the action that’s being performed on each element is a common case of multiple responsibility that is easy to recognize.

## Chapter 3 - Dependencies

WIP

## Chapter 4 -  Interfaces

WIP
