class CustomSet
  attr_reader :items
  def initialize items
   @items = items 
  end

  def empty?
    @items.empty?
  end

  def member? item
    @items.include? item 
  end

  def subset? another_set
    @items.all? {|item| another_set.items.include? item}
  end

  def disjoint? another_set
    @items.all? {|item| !another_set.items.include? item}
  end

  def ==(another_set)
    @items.sort == another_set.items.sort
  end

  def add item
    return self if @items.include? item
    @items << item
    self
  end

  def intersection another_set
    CustomSet.new @items.filter{|item| another_set.items.include? item}
  end

  def difference another_set
    CustomSet.new @items.filter{|item| !another_set.items.include? item}
  end

  def union another_set
    CustomSet.new([*@items, *another_set.items].inject([]) do |acc, item|
      acc << item if !acc.include? item
      acc
    end)
  end

end
