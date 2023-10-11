class Team
  attr_reader :name
  attr :matches, :wins, :draws, :losses, :points

  def initialize(name)
    @name = name
    @matches = 0
    @wins = 0
    @draws = 0
    @losses = 0
    @points = 0
  end

  def game(result)
    @matches += 1

    case result
    when "win"
      win
    when "loss"
      lost
    else
      draw
    end
  end

  def game_as_visitor(result)
    @matches += 1

    case result
    when "win"
      lost
    when "loss"
      win
    else
      draw
    end
  end

  def stats
    team_name = @name
    matches = @matches.to_s.ljust(2, " ")
    wins = @wins.to_s.ljust(2, " ")
    draws = @draws.to_s.ljust(2, " ")
    losses = @losses.to_s.ljust(2, " ")
    points = @points.to_s.rjust(2, " ")

    "#{@name.ljust(31, " ")}|  #{matches}|  #{wins}|  #{draws}|  #{losses}| #{points}"
  end

  private

  def win
    @wins += 1
    @points += 3
  end

  def lost
    @losses += 1
  end

  def draw
    @draws += 1
    @points += 1
  end
end
