class Element
  attr_accessor :next
  attr_reader :value
  def initialize value
    @value = value
    @next = nil
  end

  def datum
    @value
  end
end

class SimpleLinkedList
  def initialize(items = [])
    @items = items.to_a.reverse.map { |item| Element.new(item) }
  end

  def push item
    @items.unshift(item)
    self
  end

  def pop
    @items.shift
  end

  def to_a
    @items.map(&:value)
  end

  def reverse!
    @items.reverse! 
    self
  end
end
