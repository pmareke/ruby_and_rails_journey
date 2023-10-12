class Sieve
  attr_reader :primes
  def initialize(number)
    @primes = calculate_primes(number)
  end

  private

  def calculate_primes(number)
    (2..number)
      .reject {|number| (2...number).any? {|n| (number.remainder(n)).zero?}}
  end
end
