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
- Ruby is a dynamic and strongly typed language.
  - Once we know the type of a variable or object, Ruby is strict about what you
    can do with it.

## Strings

- A String in Ruby is an object that holds and manipulates an arbitrary sequence of bytes.
- Typically, methods with names ending in `upcase|downcase!` modify their receiver, while those without a `!` return a new String.

## Instance Variables

- Objects can hold their own state by setting instance variables, which are 
  created by prefixing `@` to a variable name.
- Objects usually set their initial state in an initialize method, which is
  automatically called when calling new on a class.
- Instance variables are private from external read and writes.
- Instance methods should be used for getting and setting instance variables.
  - Query methods should be named with a trailing `?`.
  - Methods which mutate state should have trailing `!`.\
- Methods named with a trailing `=` are recognized as setters.
- Getters and setters can be shortened using the `attr_reader`, `attr_writer` and `attr_accessor`.

## Nil

- `nil` is a special Ruby object used to represent an empty or default value.
- Many methods can return `nil` as a result (array index out of bounds or hash key doesn’t exist).
- A way to test for `nil` is to use the `nil?` method.
- Just like any other Ruby object `nil` has a set of methods like `.to_s`, `.inspect` or `.to_a`.
- `nil` is that it’s the only value, besides false, that is considered falsy.
- When a class `.new` method is called to create an object instance, the `.initialize` method is passed all arguments to initialize the instance's state.
- Instance variables default to `nil` until they are explicitly set.

## Raising Exceptions

- At any point in our code, we can "raise" an exception. We do this using the
  `raise` method.
- When Ruby sees this it bubbles the error to the top of the program and then exits.
- Exceptions are raise with `Exception.new()`.
- Exceptions should be a child class of the `StandardError`.

## Booleans

- True and false logical states are represented with `true` and `false` in Ruby.
- All objects evaluate as truthy except for false and nil.
- Ruby provides `unless` to make code read well.

## Conditionals

## Floating Point Numbers

## Numbers

## Ternary Operator

## Arrays

## Enumeration

## Loops

## Modules

## Advanced Enumeration

## Ostruct

## Multiple Assigment and Decomposition
