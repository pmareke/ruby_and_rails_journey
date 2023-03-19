class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted_chars = @word.chars.sort
  end

  def match(word_list)
    word_list.select do |candidate|
      sorted_candidate_chars = candidate.downcase.chars.sort
      candidate.downcase != @word and sorted_candidate_chars == @sorted_chars
    end
  end
end