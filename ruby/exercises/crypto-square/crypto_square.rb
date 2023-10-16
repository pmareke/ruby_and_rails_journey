class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    normalized_text = @plaintext.downcase.gsub(/[^\da-z]/, '')
    length = normalized_text.length
    return '' if length.zero?

    cols = Math.sqrt(length).ceil
    rows = length.quo(cols).ceil
    "#{normalized_text}#{' ' * (cols * rows - length)}"
      .chars
      .each_slice(cols)
      .to_a
      .transpose
      .map(&:join)
      .join(' ')
  end
end
