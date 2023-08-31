class Triangle
  def initialize(sides)
    @sides = sides
  end

  def scalene?
    _ensure_valid_triangle and @sides.uniq.count == 3
  end

  def isosceles?
    _ensure_valid_triangle and @sides.uniq.count <= 2
  end

  def equilateral?
    _ensure_valid_triangle and @sides.uniq.count == 1
  end

  private
  def _ensure_valid_triangle
    @sides.all?(&:positive?) && @sides.permutation(3).all? { |(a, b, c)| a <= b + c  }
  end
end
