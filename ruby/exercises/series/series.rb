class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    fail ArgumentError if length > digits.size

    digits
      .chars
      .each_cons(length)
      .map(&:join)
  end
end
