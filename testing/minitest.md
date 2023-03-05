# [MiniTest](https://github.com/minitest/minitest)

## Features

- `minitest/autorun` - the easy and explicit way to run all your tests.
- `minitest/test` - a very fast, simple, and clean test system.
- `minitest/spec` - a very fast, simple, and clean spec system.
- `minitest/mock` - a simple and clean mock/stub system.
- `minitest/benchmark` - an awesome way to assert your algorithm’s performance.
- `minitest/pride` - show your pride in testing!
- `minitest/test_task` - a full-featured and clean rake task generator.

## Spec example

```ruby
require "minitest/autorun"

describe MyClass do
  before do
    ...
  end

  describe "XXX" do
    it "YYY" do
      ...
    end
  end
  end
end
```

## Assertions

- `assert`
- `assert_empty`
- `assert_equal`
- `assert_in_delta`
- `assert_in_epsilon`
- `assert_includes`
- `assert_instance`
- `assert_kind_of`
- `assert_match`
- `assert_nil`
- `assert_operator`
- `assert_output`
- `assert_raises`
- `assert_respond_to`
- `assert_same`
- `assert_send`
- `assert_silent`
- `assert_throws`

- `.must_be`
- `.must_equal`
- `.must_be_close_to`
- `.must_be_same_as`
- `.must_include`
- `.must_be_empty`
- `.must_be_kind_of`
- `.must_be_instance_of`
- `.must_be_nil`
- `.must_match`
- `.must_respond_to`
