class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2
    raise ArgumentError if output_base < 2
    raise ArgumentError if digits.any?(&:negative?)
    raise ArgumentError if digits.any?{|digit| 0 < digit and digit >= input_base}

    from_decimal(output_base, to_decimal(input_base, digits))
  end

  private

  def self.to_decimal(base, digits)
    result = []
    digits.reverse.each_with_index do |digit, index|
      result << (base ** index) * digit
    end
    result.sum
  end

  def self.from_decimal(base, decimal)
    result = []
    while(decimal >= base)
      result << (decimal % base)
      decimal /= base
    end
    result << decimal
    result.reverse
  end
end
