class Garden
  Kids = %w[
   Alice Bob Charlie David
   Eve Fred Ginny Harriet
   Ileana Joseph Kincaid Larry
  ]

  Plants = %i[radishes clover grass violets]
    .map do |plant|
      [plant, plant[0].upcase]
    end.to_h 

  def initialize(plants, kids = Kids)
    @plants = plants.split
    @kids_position = kids
      .sort
      .map(&:downcase)
      .each_with_index
      .map { |kid, index| [kid, 2 * index] }.to_h
  end

  def method_missing(kids)
    @plants.map{ |item| item.slice(@kids_position[kids.to_s], 2) }
      .join
      .each_char
      .map { |item| Plants.key(item) }
  end
end
