class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number.negative?

    number_factors_sum = (1..number / 2).sum { |n| (number % n).zero? ? n : 0 }

    if number_factors_sum < number
      return "deficient"
    elsif number_factors_sum > number
      return "abundant"
    else
      return "perfect"
    end
  end
end
