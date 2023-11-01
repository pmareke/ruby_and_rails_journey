class PythagoreanTriplet
  def self.triplets_with_sum(sum)
    (1..sum/3).each_with_object([]) do |number, acc|
      b = (sum * (sum - 2 * number)) / (2 * (sum - number))
      c = sum - number - b

      next if b < number || c < b

      acc << [number, b, c] if (number**2 + b**2 == c**2)
    end
  end
end
