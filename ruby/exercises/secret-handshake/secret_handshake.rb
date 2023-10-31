class SecretHandshake
  def initialize(number)
    @number = number
  end

  def commands
    return [] unless @number.is_a? Integer

    numbers = @number.to_s(2).rjust(5, "0")
    values = ["wink", "double blink", "close your eyes", "jump"]
    acc = []
    digits = numbers.chars[1..]
    digits.reverse.each_with_index do |digit, index|
      acc << values[index] if !digit.to_i.zero?
    end

    return numbers.start_with?("1") ? acc.reverse : acc
  end
  
end
