class AbstractItem
  attr_reader :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name, @sell_in, @quality = name, sell_in, quality
    @conjured = name.start_with? "Conjured"
  end

  def conjured? = @conjured

  def update!
    update_quality!
    @quality = 0 if quality < 0
    @quality = 0 if conjured? && sell_in <= 0
    @quality = max_quality if quality > max_quality

    update_sell_in!
  end

  private

  def max_quality 
    50
  end

  def update_quality!
    raise NotImplementedError
  end

  def update_sell_in!
    @sell_in -= 1
  end
end
