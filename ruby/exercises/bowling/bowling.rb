class Game
  def initialize
    @current_frame = 0
  end

  def roll(pins)
    raise BowlingError unless frames[9].extendable?
    raise BowlingError if pins < 0
    raise BowlingError if pins > 10

    @current_frame += 1 if frames[@current_frame].start_next_frame?
    frames[0..@current_frame].each do |frame|
      frame << pins
    end
  end

  def score
    raise BowlingError if frames[9].extendable?

    frames[0..9].map(&:score).inject(0, :+)
  end

  private

  def frames
    @frames ||= Array.new(11) { Frame.new }
  end

  class Frame
    def <<(score)
      rolls << score if extendable?
      check_valid_frame
    end

    def extendable?
      rolls.length < 2 || (rolls[0] == 10 && rolls.length < 3) || (rolls[0] + rolls[1] == 10 && rolls.length < 3)
    end

    def start_next_frame?
      rolls[0] == 10 || rolls.length > 1
    end

    def score
      @rolls.sum
    end

    private

    def rolls
      @rolls ||= []
    end

    def check_valid_frame
      raise BowlingError if rolls.length == 2 && rolls[0] < 10 && rolls[0] + rolls[1] > 10
    end
  end

  class BowlingError < StandardError; end
end
