class Clock
  attr_reader :minute, :hours_from_minutes

  def initialize(hour: 0, minute: 0)
    @minute = minute % 60
    @hours_from_minutes = hour + (minute / 60)
    @hour = @hours_from_minutes % 24
  end

  def to_s
    "#{@hour.to_s.rjust(2, "0")}:#{@minute.to_s.rjust(2, "0")}"
  end

  def -(other)
    hour = @hours_from_minutes - other.hours_from_minutes
    minute = @minute - other.minute
    Clock.new(hour:hour, minute:minute)
  end

  def +(other)
    hour = @hours_from_minutes + other.hours_from_minutes
    minute = @minute + other.minute
    Clock.new(hour:hour, minute:minute)
  end
  def ==(other)
    to_s == other.to_s
  end
end
