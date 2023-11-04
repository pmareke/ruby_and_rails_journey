require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each(&:update!)
  end
end

