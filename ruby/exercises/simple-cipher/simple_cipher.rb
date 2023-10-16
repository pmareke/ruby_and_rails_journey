class Cipher
  attr_reader :key

  ALPHABET = [*'a'..'z']

  def initialize(key = nil)
    @key = key || 100.times.map { ALPHABET.sample }.join
    raise ArgumentError, 'invalid chars in key' unless valid?(@key)
  end

  def encode(text)
    a = 'a'.ord
    text.chars.zip(@key.chars).map do |char, key|
      ALPHABET[(char.ord - a + key.ord - a) % ALPHABET.length]
    end.join
  end

  def decode(code)
    code.chars.zip(@key.chars).map do |char, key|
      ALPHABET[char.ord - key.ord]
    end.join
  end

  private

  def valid?(key)
    !key.empty? && key !~ /[^a-z]/
  end

end
