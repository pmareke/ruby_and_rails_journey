class Element
  attr_accessor :pred, :succ
  attr_reader :value

  def initialize(value, pred, succ)
    @value = value
    @pred  = pred || self
    @succ  = succ || self
  end

  def unlink
    pred.succ = succ
    succ.pred = pred
    self
  end

  def link
    pred.succ = self
    succ.pred = self
    self
  end
end

class Deque
  attr_reader :head

  def initialize
    @head = Element.new(:sentinel, nil, nil)
  end

  def unshift(value)
    Element.new(value, head, head.succ).link
    self
  end

  def shift
    head.succ.unlink.value
  end

  def push(value)
    Element.new(value, head.pred, head).link
    self
  end

  def pop
    head.pred.unlink.value
  end

end
