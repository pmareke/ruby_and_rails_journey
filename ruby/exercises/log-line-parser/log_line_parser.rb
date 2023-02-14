class LogLineParser
  Line = Struct.new(:level, :msg)
  LOG_FORMAT = /\[([A-Z]+)\]:\s*([\w| ]+\b)/

  def initialize(line)
    @line = line.match(LOG_FORMAT) { |m| Line.new(*m.captures) }
  end

  def message
    @line.msg
  end

  def log_level
    @line.level.downcase
  end

  def reformat
    "#{@line.msg} (#{@line.level.downcase})"
  end
end
