require_relative 'aged_brie'
require_relative 'sulfuras'
require_relative 'backstage_pass'
require_relative 'normal_item'

module Item
  ITEM_CLASSES = [AgedBrie, Sulfuras, BackstagePass, NormalItem]

  def self.new(name:, sell_in:, quality:)
    item_class(name).new(name:, sell_in:, quality:)
  end

  private_class_method def self.item_class(name)
    ITEM_CLASSES.find { name.match?(_1.name_regex) }
  end
end
