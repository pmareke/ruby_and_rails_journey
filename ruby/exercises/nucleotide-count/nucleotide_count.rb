class Nucleotide
  attr_reader :histogram
  DEFAULT = {"A"=>0, "T"=>0, "C"=>0, "G"=>0}

  def initialize(histogram)
    @histogram = histogram
  end

  def self.from_dna(dna)
    histogram = dna.chars.tally

    raise ArgumentError.new("INVALID") if _validate_histogram(histogram)

    new(DEFAULT.merge(histogram))
  end

  def count(letter)
    @histogram[letter]
  end

  private

  def self._validate_histogram(histogram)
    histogram.keys.any? do |letter|
      !["A", "T", "C", "G"].include? letter
    end
  end
end
