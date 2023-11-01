class Robot
  DIRECTIONS = %i[north east south west]
  attr_reader :bearing

  def orient direction
    raise ArgumentError unless DIRECTIONS.include? direction

    @bearing = direction
  end

  def turn_right
    index = DIRECTIONS.index(@bearing)
    next_index = (index + 1) % DIRECTIONS.size
    @bearing = DIRECTIONS[next_index]
  end
  
  def turn_left
    index = DIRECTIONS.index(@bearing)
    next_index = (index - 1) % DIRECTIONS.size
    @bearing = DIRECTIONS[next_index]
  end

  def advance
    case @bearing
    when :north
      @y += 1
    when :south
      @y -= 1
    when :east
      @x += 1
    when :west
      @x -= 1
    end 
  end

  def at(x, y)
   @x = x
   @y = y
  end

  def coordinates
    [@x, @y]
  end
end

class Simulator
  def instructions(order)
    order.chars.inject([]) do |acc, direction|
      acc << case direction
      when "L"
        :turn_left
      when "R"
        :turn_right
      when "A"
        :advance
      end
    end
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, command)
    instructions(command).each {|instruction| robot.send(instruction.to_s)}
  end
end
