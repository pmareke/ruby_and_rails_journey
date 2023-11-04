require_relative 'abstract_item'

class AgedBrie < AbstractItem
  def self.name_regex = /Aged Brie/

  private

  def update_quality!
    quality_change = 1
    quality_change += 1 if sell_in <= 0

    @quality += quality_change
  end
end
