class Raindrops
  RAINDROPS = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  def self.convert(number)
    result = ""
    RAINDROPS.each { |prime, sound| result += sound if number % prime == 0 }
    result.empty? ? number.to_s : result
  end
end
