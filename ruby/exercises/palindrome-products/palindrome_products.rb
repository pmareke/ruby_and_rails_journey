Palindrome = Struct.new(:factors, :value)

class Palindromes
  attr_reader :min_factor, :max_factor, :palindromes

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    @palindromes = (min_factor..max_factor)
      .to_a
      .repeated_combination(2)
      .each_with_object({}) do |(num1, num2), acc|
      if palindrome? num1 * num2
        acc[num1 * num2] ||= []
        acc[num1 * num2] << [num1, num2]
      end
    end.sort
  end

  def largest
    palindrome = palindromes.last
    Palindrome.new(palindrome[1], palindrome[0])
  end

  def smallest
    palindrome = palindromes.first
    Palindrome.new(palindrome[1], palindrome[0])
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
