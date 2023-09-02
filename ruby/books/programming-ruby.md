# [Programming Ruby 3.2 (5th Edition)](https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/)

## Chapter 1 Getting Started

- There is a command-line tool called `ri` for the Ruby code documentation.

## Chapter 2 Ruby.new

- Every Ruby object has an unique object identifier, accesible via the property
  `object_id`.
- Methods are defined with the keyword `def`.
- Ruby does not use braces, instead it has the `end` keyword.
- Using double-quote strings and the expression `"{EXPRESION}"` to generate
  dinamic strings.
- By default Ruby returns the last evaluated expresion in a method.
- Global variables are prefixed with a `$`.
- Instance variables begin with a `@`.
- Class variables start with `@@`.
- An `Array` is a linear list of objects.
- A `Hash` is an association.
- A `Symbol` is a special and immutable string, which are created only once and
  with a very fast look up.
- The operator `~=` matches a string against a regular expresion.
- A code block is a chunck of code passed to a method as any other parameter.
- The method `gets` reads from the command-line.
- There is a global array called `ARGV` which contains each of the arguments
  passed to running the program.
- The `#` comments the lines.

## Chapter 3 Classes, Objects and variables

- Classes start with uppercase.
- Methods start with lowercase.
- The `initialize` method sets the internal state of the class and it's called
  when the `.new` is called.
- The internal state of the class is stored in the instance variables.
  - The `@` is part of the name of the variable (`price != @price`).
- The `p` method prints the internal representation of an object (`inspect`
  method).
- The `puts` method prints the string representation of and object (`to_s`
  method).
- Non other object can access an object's instance variables.
- Ruby provide several accessor methods to read (`attr_reader`), write (`attr_writer`) 
  or both (`attt_accessor`) the instance variables.
- The class methods could be `public` (default), `protected` and `private`.
  - The access level could be defined for the rest of the file or per each
    method.
- A variable in Ruby is not an object, instead is a reference to an object.
  - Variable holds references to objects, not othe objects themselves. 
- In Ruby the strings are immutable.
- The `dup` method of `String` creates a new string with the same content.
- The `freeze` method of `String` prevent anyone from changing the object.
- In Ruby is possible to redefine a class and add or overide methods.

## Chapter 4 Collections, Blocks and Iterators.

- Arrays can be created with the `[]` syntax or `Array.new`.
- The `[]` operator is implemented as a method.
- There is a shortcut to create arrays using `%w{}` for values or `½i{}` for
  symbols.
- The `push/pop` methods works at the end of the array.
- The `unshift/shift` works at the begginig of the array.
- Hashes can be digged using the `dig` method.
- It's possible to create hashes with a default value using the `Hash.new(value)`.
- Ruby provides the `tap` method, which has access to the current value and pass it
  to the next.
- A block is a chunk of code either enclosed between braces or `do/end`.
- A block variable with the same name as another one from outside the block will
  override this last one.
- If the last parameter in a method is prefixed with `&`, ruby looks for a code
  block which couble be called with `.call`.

## Chapter 5 More About Methods

- They are defined with the `def` keyword.
- The value of the last expression is returned by default, it's possible to use the `return` keyword.
- If the same method is define two times, the last definition will last.
- They should begin with a lowercase letter or underscore followed by a combination of letters or digits.
- Methods that return a boolean are often named with a `?` suffix.
- Methods that modify the variable are often named with a `!` suffix.
- It's possible to declare static methods using the `def self.XXX` keyword.
- If the method doesn't have parameters, the convention is to omit the parenthesis.
- It's possible to default values to the parameters using the `=`.
- If the method has multiple parameters and you want to group them, you can use the `*`.
- It's possible to named the values of the parameters using the `:`.
- If the method has multiple keyword parameters and you want to group them, you can use the `**`.
- Using the `yield` keyword is possible to pass a block as parameter.
- If the last parameter of the method is prefixed with a `&` you can `.call` it.

## Chapter 6 Inheritance, Modules and Mixins

- TBD

## Chapter 7 Standard Types

- TBD

## Chapter 8 Regular Expressions

- TBD

## Chapter 9 Expressions

- TBD

## Chapter 10 Exceptions

- TBD

## Chapter 11 Basic Input and Output

- TBD
