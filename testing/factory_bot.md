# [Factory Bot](https://thoughtbot.github.io/factory_bot/summary.html)

## Build strategies

- The non-list (`.build, .build_pair, .create`) methods take one mandatory argument: the name of the factory.
- The list methods (`.build_list, .create_list`) have two required arguments: the name of the factory, and the number of instances to build.

### build

- The `FactoryBot.build` method constructs an instance of a class which defaults to calling the `.new` class method.

### create

- The `FactoryBot.create` method constructs an instance of a class and then persists it.

### attributes_for

- The `FactoryBot.attributes_for` method constructs a Hash with the attributes and their values

### build_stubbed

- The `FactoryBot.build_stubbed` method returns a fake ActiveRecord object.

### null

- The `FactoryBot.null` method returns nil.
- The `FactoryBot.null_pair` method gives you a pair of nils
- The `FactoryBot.null_list` gives as many nils as you desire.

## FactoryBot.find_definitions

- The `FactoryBot.find_definitions` method loads in all factory_bot definitions across the project.
- In Rails these definitions are called automatically by factory_bot_rails after initialize.

## FactoryBot.define

- Each file loaded by factory_bot is expected to call `FactoryBot.define` with a block.

## Factory

- Within a `FactoryBot.define` block, you can define factories.
- Anything defined using factory can be built using a build strategy.
- The factory method takes three arguments:
    - A required name (expected to ve a Symbol)
    - An optional hash of options, a
    - An optional block.
## add_attribute

- Within a factory definition, the `add_attribute` method defines a key/value pair that will be set when the object is built.
- The `add_attribute` method takes two arguments:
    - A name (Symbol or String)
    - A block.

## FactoryBot.lint

- The `FactoryBot.lint` method tries each factory and raises `FactoryBot::InvalidFactoryError` on failure.

## Guide

- Install the `gem "factory_bot_rails"` gem.
- Add `config.include FactoryBot::Syntax::Methods` in the `factory_bot.rb` file under the support folder.

### Factory name and attributes

- Each factory has a name and a set of attributes.
- The name is used to guess the class of the object by default.

### Definition Paths

- Factories can be defined anywhere, but will be automatically loaded after calling `FactoryBot.find_definitions` if factories are defined in files at the following locations:
    - `test/factories.rb`.
    - `spec/factories.rb`.
    - `test/factories/*.rb`.
    - `spec/factories/*.rb`.

### Best practices

- It is recommended that you have one factory for each class that provides the simplest set of attributes necessary to create an instance of that class.
- If you're creating ActiveRecord objects, that means that you should only provide attributes that are required through validations and that do not have defaults.
