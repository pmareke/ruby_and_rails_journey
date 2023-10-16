class PrimeFactors
  def self.of(number)
    return [] if number < 2

    factor = (2..number).find { |i| (number % i).zero? }
    [factor] + of(number / factor)
  end
end
