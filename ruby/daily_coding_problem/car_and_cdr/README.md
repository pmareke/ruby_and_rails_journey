# Implemement Car and Cdr

- `cons(a, b)`constructs a pair
- `car(pair)` returns the first of that pair.
- `cdr(pair)` returns the last element of that pair.

For example, `car(cons(3, 4))` returns 3, and `cdr(cons(3, 4))` returns 4.

Given this implementation of cons:

```ruby
def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair
```

Implement car and cdr.


