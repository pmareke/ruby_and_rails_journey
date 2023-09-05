# Part II: Ruby in Its Setting

## Chapter 14 Ruby from the Command Line

- Use the `ruby` command ro execute ruby files.
- It's possible to invoke the interpreter using the `-e` flag.
- In order to make our ruby files executable we need to add at the top of the file `#!/usr/bin/env ruby`.
- The parameters are available in the `ARGV` global variable.
- Ruby provides also the `OptionParser` class to parse the flags when we run our Ruby programs.
- The method `exit` terminates the program.
- Then environment variables are stored in the `ENV` hash.
- Use `require` for gems and `require_relative` for our ruby files.
- Ruby has the `Makefile` equivalent called [Rake](../../rake/notes.md).

## Chapter 15 Ruby Gems

- Ruby comes with a RubyGems tool called `gem` and a Bundler tool to manage dependencies called `bundle`.
- It's possible to install gems using the `gem install XXX` command.
- Once the gem is installed we need to `require` it in our code.
- In order to manage our dependencies we need to create a file called `Gemfile`.
- To install all the gems at once, run the `bundle install` command.

## Chapter 16 Interactive Ruby

- It's possible to open a Ruby console running the `irb` command.
