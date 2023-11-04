class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, amount)
    raise NegativeTargetError if amount.negative?
    return [] if amount.zero?

    max_repeated_coins = (amount.to_f / coins.min).ceil

    (1..max_repeated_coins).each do |number_of_coins|
      change = coins.repeated_combination(number_of_coins)
      change = change.find { |possible_change| possible_change.sum == amount }

      return change unless change.nil?
    end

    raise ImpossibleCombinationError
  end
end
