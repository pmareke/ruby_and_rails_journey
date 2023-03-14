class Luhn
  def self.valid?(number)
    number
      .tr(" ", "")
      .tap { |s| return false unless s[/\A\d\d+\z/] }
      .chars
      .reverse
      .map.with_index { |digit, index| index.odd? ? digit.to_i * 2 : digit.to_i }
      .map { |digit| digit > 9 ? digit - 9 : digit }
      .sum % 10 == 0
  end
end
