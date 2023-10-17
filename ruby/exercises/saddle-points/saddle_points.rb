module Grid
  def self.saddle_points(rows)
    columns = rows.transpose
    rows.each_with_index.inject([]) do |points, (row, idx)|
      row.each_with_index do |num, idy|
        if num === row.max and num === columns[idy].min
          points << {"row" => idx + 1, "column" => idy + 1}
        end
      end
      points
    end
  end
end
