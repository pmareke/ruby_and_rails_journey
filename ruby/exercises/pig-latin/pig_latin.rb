class PigLatin
  def self.translate(string)
    string.split(' ').inject([]) do |acc, word|
      if word =~ /^([aeiou]|xr|yt)/
        word << 'ay'
      elsif word =~ /^.*qu/
        word = word.gsub(/^(.*qu)(.+)$/, '\2\1') + 'ay'
      elsif word =~ /^.+y.+/
        word = word.gsub(/^(.+)(y.+)$/, '\2\1') + 'ay'
      else
        word = word.gsub(/^([^aeiou]+)(.+)$/, '\2\1') + 'ay'
      end
      acc << word
    end.join(" ")
  end
end
