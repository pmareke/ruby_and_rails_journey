# Part I Facets of Ruby

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

- The inheritance in Ruby is made using the `<` keyword after the class name.
    - By default all object inherit from the `Object` class.
- In Ruby a `Module` can do everything that a class can do, except create instances.
- Modules are a way of grouping methods, classes and constants.
- Modules provide a namespace which create a sandbox where the methods and constants can not be override.
- A module can be included in another classes, which is knows as `mixin`.
- Modules, as clases, should start with an uppercase letter.
- It's possible to `include` several modules in a class.
    - This inclusion adds the module methods as instance methods to the class.
- It's also possible to `extend` a class with other modules.
    - This extension add the module methods as class methods.
- Implementing the `each` method it's possible to include the Enumerable module and have all the module methods available.
- Usually don't use @instance variables in modules.
- Mixins is the preferable way of working, over inheritance.

## Chapter 7 Standard Types

- Numbers:
    - Integers, floats, rational and complex numbers are supported.
    - Underscore characters are ignored in the digital string.
    - All numbers are objects and respond to messages (`-1.abs`).
    - Strings with only digits are not automatically convert to numbers.
    - Integers also support some iterators like `times`, `downto` or `upto`.
- Strings:
    - They are sequences of characters.
    - Escapes sequences start with `\`.
    - Double quote Strings support string interpolation `"#{variable}"`.
    - Ruby will concatenate strings if they are next to each other without any operator.
    - There are useful methods in the String class like `.chomp`, `.split` or `.squeeze`, `.scan`.
- Ranges:
    - The `..` is an inclusive Range and the `...` an exclusive one.
    - It's possible to convert a Range into an array with `.to_a` or into an Enumerator with `to_enum`.
    - Ranges have a lot of methods to iterate them like `.include?`, `.cover?`, `.max`, `.reject` or `.reduce`.

## Chapter 8 Regular Expressions

- The most common way to write a regex is using `//`.
- It's possible to match a string against a regex using the `~=` operator.
- If we just want to know if there is a match, `.match?` is a better option.
- The `sub` and `.gsub` messages alter return a new string changing the original once or globaly.
- The '.match' method returns a `MatchData`:
    - This object contains some properties like `.pre_match` or `post_match`.
    - The value of the match or matches are accesible using indices.
- It's possible to give names to the matches using the `?<group_name>`.

## Chapter 9 Expressions

- There are operator expresions like `+ - * /`.
- As everything is an object it's possible to redifine some of this operatios openning the `Interger` class and override the method (`def +(other)`).
- It's possible to executing commands using the `\`\``, the exit status is saved in the `$?` global variable.
- Any value that it's not `nil` or `false` is `true`.
- The `.defined?` method returns `nil` if it's not defined in the current scope, otherwise a description of the argument.
- It's possible to compare objects using the following operators:
    - `==` which tests for equal value.
    - `===`
    - `<==>`
    - `=~` which tests using regex.
    - `eql?` which tests for the equal value and type.
    - `equal?` which tests for the equal object ID.
- The `unless` expression behaves the opposite to the `if`.
- The `case` expresion it's like a switch in other languages.
- When chaining method calls in the same object it's possible to find a nil, to solve this problem it's possible to use the `&` before the method call.
- Even though the recommended way to iterate list and hashes is using their methods, it's possible to use loops.
- It's possible to use pattern matching in the `case` statement.

## Chapter 10 Exceptions

- Any exception shoud inherit from the `Exception` class or one of its children.
- The most important subclass of `Exception` is `StandardError`.
- In order to create a custom exception use `class MyException < StandardError end`.
- Every `Exception` has associated with a message string and a stack backtrace.
- In order to handle a exception we need to use the `begin/rescue/ensure`.
- It's possible to raise exceptions using the `raise Exception, "error message"`.

## Chapter 11 Basic Input and Output

- The `Kernel` module is the one in charge for all the I/o related methods.
- The `IO` class is subclassed  by `File` and `BasicSocket`.
- The best way to open a file is `File.open(file_name) do |file| {} end`.
- Once the file is open there a lot of methods to iterate over it, like `.each_line`.
- In order to write a file use also the `File.open(file_name, 'w') |file| {} end`.
- In order to read and write in the network use the `socket` module.
- The `lib/net` library is the simplest way to make http calls.

## Chapter 12 Threads, Fibers and Ractors

- Ruby programs have a Global Interpreter Lock (GIL) which ensures that only one thread is running at any time.
- The `Thread` class is the basic unit of multithreaded in Ruby.
- Use `Thread.new do || {} end` to create a new thread and `thread.join` to wait for it to finish.
- Use `alive?` to determine the status a of thread.
- Use the built-in class `Thread::Mutex` to syncrhonized threads with the `.lock` and `.unlock` methods.
- A simpler way to accomplish the same behavioir is using the `.syncronize` method passing a block.
- Ruby's fibers are a way to stopped or restarted blocks of code.
    - The constructor recieves a block and return a new fiber instance.
    - Inside the block we should use the `yield` to suspend the fiber.
    - The `.resume` method starts the execution.
- `Ractor` is a Ruby implementation for the Action pattern.

## Chapter 13 Testing Ruby Code

- Ruby provides a core testing library called MiniTest.
- MiniTest:
    - Always import `minitest/autorun`.
    - The test can be run using the `ruby test_file.rb`.
    - The default syntaxis uses classes to group tests and methods to represent each test. 
        - Classes should inherit from `MiniTest::Test`.
        - Methods should start with `test_`.
        - Assertions start with `assert_`, like `assert_equal`.
        - The opposite assertions are `refute_`.
        - There are `setup` and `teardown` methods.
        - It possible to create `mocks` using the MiniTest library.
            - Use the `.expect` method to configure the responses for a given object.
            - Use the `.verify` to validate that all the expects were called.
        - It's also possible to create `stubs` in order to override specific methods instead of the hold project.
    - It's possible to create Test Suites importing all the test in a file.
    - It's possible to use an BDD (`describe/it`) syntax importing the `minitest/rspec`.
        - `describe` group tests and `it` creates a test.
- RSpec
    - RSpect focus more in the expectations rather than assertions.
    - The goal of this library is to test in a way much closer to natural language.
    - RSpec uses a DSL (Domain Specific Language).
    - The `.expect` method is use in the assertions, `expect().to eq()`.
    - It's possible to create variables without evaluating them using the `let` block.
    - RSspec generates dynamic matchers, like `.be_a_paperback` which looks for a `.paperback?`.
    - The same happen with the `.has_cover` which looks for the `.have_cover?` method.
    - In RSpec the generic term for fake objects are `doubles`.
        - `allow().to recieve().and_return()`.

