class ResistorColorTrio
  NUMBERS = %w[black brown red orange yellow green blue violet grey white].freeze

  attr_reader :label

  def initialize(numbers)
    first, second, zeroes = numbers.map {|stripe| NUMBERS.index(stripe)}
    resistance = "#{first}#{second}#{'0'*zeroes}"
    unit = resistance
      .sub(/0{6}$/, " meg")
      .sub(/0{3}$/, " kilo")
      .sub(/(\d)$/, "\\1 ")
    @label = "Resistor value: #{unit}ohms"
  end
end
