class Acronym
  WORDS_REGEX = /\b\w/

  def self.abbreviate(sentence)
    sentence.scan(WORDS_REGEX).join.upcase
  end
  
end
