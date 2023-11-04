require_relative 'abstract_item'

class BackstagePass < AbstractItem
  def self.name_regex = /Backstage passes to a TAFKAL80ETC concert/i

  private

  def update_quality!
    @quality = 0 and return if sell_in <= 0

    quality_change = 1
    quality_change += 1 if sell_in <= 10
    quality_change += 1 if sell_in <= 5
    quality_change -= 1 if conjured?

    @quality += quality_change
  end
end
