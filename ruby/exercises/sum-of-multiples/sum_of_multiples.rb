require "set"

class SumOfMultiples
  def initialize(*bases)
    @bases = bases
  end

  def to(level)
    return 0 if @bases.include? 0

    Set[
      *@bases.map {|base| energy_points(level, base)}.flatten
    ].sum
  end

  private

  def energy_points(level, base)
    (0...level).filter { |current_level| current_level.remainder(base).zero? }
  end
end
