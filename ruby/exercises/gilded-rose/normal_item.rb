require_relative 'abstract_item'

class NormalItem < AbstractItem
  def self.name_regex = /.+/

  private

  def update_quality!
    quality_change = -1
    quality_change -= 1 if sell_in <= 0
    quality_change *= 2 if conjured?

    @quality += quality_change
  end
end
