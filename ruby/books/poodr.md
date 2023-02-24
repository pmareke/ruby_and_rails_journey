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

- To collaborate, an object must know something know about others. Knowing creates a dependency.
- An object depends on another object if, when one object changes, the other might be forced to change in turn.
- An object has a dependency when it knows:
  - The name of another class.
  - The name of a message that it intends to send to someone other than self.
  - The arguments that a message requires.
  - The order of those arguments.
- These unnecessary dependencies make the code less reasonable.
- One especially destructive kind of dependency occurs where an object knows another who knows another who knows something (Law of Demeter).
- Moving the creation of the another instance outside of one class decouples the two classes.
- Passing our class dependencies in the constructor is called **Depedency Injection**.
- If we cannot remove unnecessary dependencies, we should isolate them within your class.
- The habit of routinely injecting dependencies, make our classe less loosely coupled.
- Remove the external dependency encapsulating it in a method of its own.
- When we send a message that requires arguments, we, as the sender, cannot avoid having knowledge of those arguments.
  - Use `Hashes` for initialization arguments imrpove the dependency.
  - Explicitly define defaults.
  - Use a `Wrapper` when we don´t have control of a class which we're instantiating in order to change the public interface.
- **Depend on things that change less often than you do**.
- Concrete classes are more likely to change than abstract classes.
- Depending on an abstraction is always safer than depending on a concretion.
- Ruby does not make you explicitly declare the abstraction in order to define the interface.
  - The term`class` stands for both class and this kind of interface. 
- Injecting dependencies creates loosely coupled objects.

## Chapter 4 -  Interfaces

- Here interfaces are methods within a class and how and what to expose to others.
- The methods that make up the public interface of your class:
  - Reveal its primary responsibility.
  - Are expected to be invoked by others.
  - Will not change on a whim.
  - Are safe for others to depend on.
  - Are thoroughly documented in the tests.
- All other methods in the class are part of its private interface:
  - Handle implementation details.
  - Are not expected to be sent by other objects.
  - Can change for any reason whatsoever.
  - Are unsafe for others to depend on.
  - May not even be referenced in the tests.
- The public interface is a contract that articulates the responsibilities of your class.
- The public parts of a class are the stable parts.
- The private parts are the changeable parts.
- The best possible situation is for an object to be completely independent of its context.
- **WIP**
