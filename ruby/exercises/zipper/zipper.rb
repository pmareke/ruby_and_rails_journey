class Node
  attr_accessor :value, :left, :right

  def initialize value, left, right
    @value = value
    @left = left
    @right = right
  end

  def == other
    value == other.value && left == other.left && right == other.right
  end
end

class Zipper
  def self.from_tree tree
    self.new(tree, [])
  end

  def to_tree
    @tree
  end

  def left
    focus.left and self.class.new(tree, steps + [:left])
  end

  def right
    focus.right and self.class.new(tree, steps + [:right])
  end

  def up
    steps.first and self.class.new(tree, steps[0...-1])
  end

  def value
    focus.value
  end

  def set_left node
    focus.left = node
    self
  end

  def set_right node
    focus.right = node
    self
  end

  def set_value value
    focus.value = value
    self
  end

  def == other
    tree == other.tree && steps == other.steps
  end

  protected

  attr_accessor :tree, :steps

  private

  def focus
    focus = tree
    steps.each do |step|
      focus = focus.send step
    end
    focus
  end

  def initialize tree, steps
    @tree = tree
    @steps = steps
  end
end
