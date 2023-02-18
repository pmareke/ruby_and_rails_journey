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
- We can concatenate two strings using `+` or the `.concat` method.
- The String interpolation is done using the `"#{variable}"`.
- The most common String methods are `length`, `downcase`, `upcase`, `capitalize`, `reverse` and `gsub`.

## Instance Variables

- Instance variables are variables that are associated with a specific instance of a class.
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
- `nil` is also used as the return value for methods that do not explicitly return a value.

## Raising Exceptions

- At any point in our code, we can "raise" an exception. We do this using the
  `raise` method.
- When Ruby sees this it bubbles the error to the top of the program and then exits.
- Exceptions are raise with `Exception.new()`.
- Exceptions should be a child class of the `StandardError`.
- The `begin/rescue/ensure/end` is the way to catch exceptions.

## Booleans

- True and false logical states are represented with `true` and `false` in Ruby.
- All objects evaluate as truthy except for false and nil.
- Ruby provides `unless` to make code read well.

## Conditionals

- There are multiple conditional statements in Ruby:
  - `if / elsif / else`
  - `unless / else`
  - `case / when`

## Floating Point Numbers

- A floating-point number is a number with zero or more digits behind the decimal separator.
- They are implemented through the `Float` class.

## Numbers

- A Number is a number with zero digits after the decimal separator.
- They are implemented through the `Integer` class.
- Arithmetic operations between instances of `Integer` and instances of `Float` will result in instances of `Float`.
- The `Float` and `Integer` classes have methods that will coerce values from one to the other.

## Ternary Operator

- A ternary conditional is a shorter way of writing simple `if/else` statements.
- Ternaries use a combination of the ? and : symbols to split up a conditional.

## Arrays

- They are ordered, integer-indexed collections of any object.
- Array indexing starts at 0. 
- A negative index is assumed to be relative to the end of the array.
- Elements can be accessed using indexes or `.at`.
- Elements can be accessed or changed using indexes.
- To query an array about the number of elements it contains, use `length`, `count` or `size`.
- Items can be added to the end of an array by using either `.push` or `<<`.
- Items can be removed from an array by using `.pop`.
- Items can be join from an array by using `.join("")`.
- We can check the existence of an item inside the array with `.include?`.
- The `sort` method returns a new array with the elements sorted in ascending order.
- The `sort` method returns a new array with the elements in reverse order.

## Enumeration

- Enumeration is the act of stepping through a collection (`Array`, `Hash`, etc) and performing some action on each object.
- It's used for sorting (`.sort_by`), grouping (`.group_by`), mapping (`.map`), reducing (`.reduce`) and iterating (`.each` or `.with_index `).

## Loops

- There are multiple ways to loop over data in Rails, the most important are:
  - `each`.
  - `each_with_index`.
  - `times`.
  - `while ... end`.
  - `until ... end`.
  - `X.upto(Y)`.
- You can skip iterations in all of these loop types using `next`.
- You can stop iterations in all of these loop types using `break`.

## Modules

- Modules provide a namespace and prevent name clashes.
- Modules implement the mixin facility.
- Modules can not be instantiated.
- A Module is an ancestor of Class in the object hierarchy.
- The main difference being that rather than using instance methods, we use class methods.
  - Class methods start with `self.` and are directly called on a module.
- A module could have also instance methods that will available in the classes which include the module. 
- We can include a module in another class with `include ModuleName`.

## Advanced Enumeration

- Enumerating Hash objects is exactly the same as enumerating Array objects.
- Another interesting enumeration methods are:
  - `count`.
  - `any?`.
  - `select`.
  - `all`.
  - `map`.

## Ostruct

- The `stdlib` is a library with a collection of classes for working with things 
  such as dates, json, and networking.
- `OpenStruct` is part of the Standard Library and allows you to easily create an object from a `Hash`.
- In situations where a block calls a single method, you can replace the block with `&:` followed by the method name.

## Multiple Assigment and Decomposition

- Decomposition refers to the act of extracting the elements of a collection, such as an `Array or `Hash`.
- Multiple assignment is the ability to assign multiple variables to decompose values within one statement.
- Splat operator `*` can be used to combine multiple arrays into one array by decomposing each into a new common array.
- Double splat operator `**` can be used to combine multiple hashes into one hash by decomposing each into a new common hash. 
