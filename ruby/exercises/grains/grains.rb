class Grains
  BASE = 2
  BOARD_SIZE = 64

  def self.square(number)
    raise ArgumentError unless (1..BOARD_SIZE).include? number

    (BASE ** number) / BASE
  end

  def self.total
    (BASE ** (BOARD_SIZE + 1)) / BASE - 1
  end
end
