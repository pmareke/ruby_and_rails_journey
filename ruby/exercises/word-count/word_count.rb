class Phrase
  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    sentence.downcase.scan(/\b[\w']+\b/).tally
  end
end
