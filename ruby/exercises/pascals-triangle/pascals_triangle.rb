class Triangle
  attr_reader :rows

  def initialize row_count
    @rows = [[1]]
    (row_count - 1).times { build_next_row }
  end

  private

  def build_next_row
    padded_row = [0] + @rows.last + [0]
    @rows.push padded_row.each_cons(2).map { |a, b| a + b }
  end
end
