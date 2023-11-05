class ArrayProduct
  def self.calculate(numbers)
    product = numbers.inject(&:*)
    numbers.map { |number| product / number }
  end

  def self.calculate_without_division(numbers)
    numbers.each_with_index.inject([]) do |product, (_, idx)|
      product_without_current_number = numbers.each_with_index.inject([]) do |acc, (value, idy)|
        next acc << value if idx != idy
        acc
      end
      product << product_without_current_number.inject(&:*)
    end
  end
end
