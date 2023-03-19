class Pangram
  def self.pangram?(sentence)
    letters = sentence
      .downcase
      .scan(/[a-zA-Z]+/)
      .join
      .chars

    letters.uniq.size == 26
  end
end