class Queens
  def initialize(white: [0,0], black: [0,0])
    @white = white
    @black = black

    raise ArgumentError unless (0..7).include? @white.first
    raise ArgumentError unless (0..7).include? @white[1]
    raise ArgumentError unless (0..7).include? @black.first
    raise ArgumentError unless (0..7).include? @black[1]
  end
  def attack?
    @white.first == @black.first || 
    @white[1] == @black[1] || 
    (@white.first - @black.first).abs == (@white[1] - @black[1]).abs
  end
end
