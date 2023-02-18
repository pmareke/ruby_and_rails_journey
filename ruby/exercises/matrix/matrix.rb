class Matrix

  def initialize(input)
    @input = input
  end

  def rows
    @input.each_line.map do |line|
      line.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end
