class IsbnVerifier
  def self.valid? isbn
    digits = isbn.delete("-").scan(/^\d{9}[\dX]$/).join.chars

    return false if digits.size != 10

    checksum = []
    digits.each_with_index do |item, index|
      item = "10" if item == "X"
      checksum << item.to_i * (index + 1)
    end

    checksum.sum % 11 == 0
  end
  
end
