class Isogram
  def self.isogram?(word)
    chars = word.downcase.scan(/\w/)
    chars == chars.uniq
  end
end
