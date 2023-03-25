class Microwave
  attr_reader :seconds
  
  def initialize(time)
    @time= time
  end

  def timer
    minutes, seconds = @time.divmod(100)
    extra_minutes, seconds = seconds.divmod(60)
    "%02d:%02d" % [minutes + extra_minutes, seconds]
  end
end