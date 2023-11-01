class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @qualifier = qualifier.nil? ? " " : " #{qualifier} "
  end

  def to_s
    sentences = @words.each_cons(2).inject([]) do |acc, pair|
      acc << "For want of a #{pair.first} the #{pair[1]} was lost."
    end

    sentences << "And all for the want of a#{@qualifier}#{@words.first}."
    sentences.join("\n")
  end
end
