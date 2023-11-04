require_relative 'abstract_item'

class Sulfuras < AbstractItem
  def self.name_regex = /Sulfuras, Hand of Ragnaros/

  private

  def max_quality 
    80
  end

  def update_quality!
  end

  def update_sell_in!
    @sell_in -= 1 if conjured?
  end
end
