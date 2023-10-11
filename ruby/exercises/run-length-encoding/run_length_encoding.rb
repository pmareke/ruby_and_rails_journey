class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |letter| "#{letter.length}#{letter[0]}" }
  end
  def self.decode(input)
    input.gsub(/\d+./) { |letter| letter[-1] * letter.to_i }
  end
end
