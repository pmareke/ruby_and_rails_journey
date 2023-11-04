require 'set'

class UpTo
  def initialize(numbers)
   @numbers = numbers 
  end

  def calculate_part_one(k)
    @numbers.each_with_index do |x, idx|
      @numbers.each_with_index do |y, idy|
        next if idx == idy

        return true if x + y == k
      end
    end
    false
  end

  def calculate_part_two(k)
    seen = Set.new()
    @numbers.each do |number|
      return true if seen.include?(k - number)

      seen.add(number)
    end
    return false
  end
end
