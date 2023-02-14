# Ruby notes

## Basics

- Everything in Ruby is an object.
- There are two primary ways to assign objects to names in Ruby.
  - Variables are always written in snake case.
    - They can reference different objects over its lifetime. 
  - Constants are meant to be assigned once.
    - They must use capitals letters with words separated by underscores.
- Classes are defined using the `class` keyword followed by the name of the class.
- Objects are generally created by instantiating classes using the `.new` method.
- A method can optionally be defined with positional arguments, and/or keyword 
  arguments that are defined and called using the `:` syntax.
- Methods implicitly return the result of the last evaluated statement.
