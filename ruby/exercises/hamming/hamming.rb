class Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.size != s2.size

    mixin = s1.chars.zip(s2.chars)
    mixin.count { |x, y| x != y }
  end
end
