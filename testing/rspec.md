# [RSpec](https://rspec.info/)

- Behaviour Driven Development for Ruby

## Example

```ruby
describe MyClass do
  it "XXXX" do
    ...
  end
end
```

## Matchers

### Equivalence

- `expect(actual).to eq(expected)`
- `expect(actual).to eql(expected)`
- `expect(actual).not_to eql(not_expected)`

### Identity
- `expect(actual).to be(expected)`
- `expect(actual).to equal(expected)`

### Comparisons
- `expect(actual).to be >  expected`
- `expect(actual).to be >= expected`
- `expect(actual).to be <= expected`
- `expect(actual).to be <  expected`
- `expect(actual).to be_within(delta).of(expected)`

### Regular expressions
- `expect(actual).to match(/expression/)`

### Types/classes
- `expect(actual).to be_an_instance_of(expected)`
- `expect(actual).to be_a(expected)`
- `expect(actual).to be_an(expected)`
- `expect(actual).to be_a_kind_of(expected)`

### Truthiness
- `expect(actual).to be_truthy`
- `expect(actual).to be true`
- `expect(actual).to be_falsy`
- `expect(actual).to be false`
- `expect(actual).to be_nil`
- `expect(actual).to_not be_nil`

### Expecting errors
- `expect { ... }.to raise_error`
- `expect { ... }.to raise_error(ErrorClass)`
- `expect { ... }.to raise_error("message")`
- `expect { ... }.to raise_error(ErrorClass, "message")`

### Expecting throws
- `expect { ... }.to throw_symbol`
- `expect { ... }.to throw_symbol(:symbol)`
- `expect { ... }.to throw_symbol(:symbol, 'value')`

### Predicate matchers
- `expect(actual).to be_xxx` # passes if `actual.xxx?`
- `expect(actual).to have_xxx(:arg)` # passes if `actual.has_xxx?(:arg)`

### Ranges
- `expect(1..10).to cover(3)`

### Collection membership
- `expect(actual).to eq(expected)`
- `expect(actual).to start_with(expected)`
- `expect(actual).to end_with(expected)`
- `expect(actual).to match_array(expected)`
- `expect(actual).to contain_exactly(expected_element1, expected_element2)`
- `expect(actual).to include(expected)`

## Rails Matchers

- `be_a_new`
- `render_template`
- `redirect_to`	
- `route_to	assert_recognizes`
- `be_routable`
- `have_http_status`
- `match_array`
- `have_been_enqueued`
- `have_enqueued_job`
