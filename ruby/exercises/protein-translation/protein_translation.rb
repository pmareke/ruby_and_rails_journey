class InvalidCodonError < StandardError
end

class Translation
  CONDONS_TO_AMINOACIDS = {
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP",
  }
  def self.of_rna(rna)
    result = []
    (0...rna.chars.size).step(3).each do |index|
      key = rna[index..(index + 2)].to_sym

      raise InvalidCodonError unless CONDONS_TO_AMINOACIDS.has_key?(key)
      break if CONDONS_TO_AMINOACIDS[key] == "STOP"

      result.push(CONDONS_TO_AMINOACIDS[key])
    end
    result
  end
end
