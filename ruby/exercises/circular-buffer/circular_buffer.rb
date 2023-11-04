class CircularBuffer
  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end

  def initialize(length)
    @length = length
    @buffer = []
  end

  def write(element)
    raise BufferFullException.new if full?

    @buffer << element
  end

  def write!(element)
    read if full?
    write(element)
  end

  def read
    raise BufferEmptyException.new if @buffer.empty?

    @buffer.shift 
  end

  def clear
    @buffer.clear
  end

  private

  def full?
    @buffer.length == @length
  end
end
