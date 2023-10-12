module ArmstrongNumbers
  def self.include?(number)
    digits = number.to_s.chars.map(&:to_i)
    digits.sum{ |digit| digit**(digits.length) } == number
  end
end
