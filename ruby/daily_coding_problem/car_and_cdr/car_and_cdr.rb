def cons(a, b)
  @a = a
  @b = b
  def pair(f = Proc.new {})
    f.call(@a, @b)
  end
  pair
end

def car(pair)
  pair(-> (a, _) { a })
end


def cdr(pair)
  pair(-> (_, b) { b })
end
