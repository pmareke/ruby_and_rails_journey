class RailFenceCipher

  def self.decode(ciphertext, rails)
    zigzag(rails, ciphertext.length)
      .sort
      .zip(ciphertext.chars)
      .sort_by { |a| a.first[1] }
      .map { |a| a[1] }
      .join
  end

  def self.encode(plaintext, rails)
    zigzag(rails, plaintext.length)
      .zip(plaintext.chars)
      .sort
      .map { |a| a[1] }
      .join
  end

  def self.zigzag(rails, size)
    pattern = [*(0..rails - 1), *(1..rails - 2).to_a.reverse]
    pattern
      .cycle
      .first(size)
      .zip(0..size)
  end
end
