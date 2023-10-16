class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary=0)
    @real = real
    @imaginary = imaginary
  end

  def *(other)
    ComplexNumber.new(
      @real * other.real - @imaginary * other.imaginary,
      @imaginary * other.real + other.imaginary * @real
    )
  end

  def /(other)
    denominator = other.real ** 2 + other.imaginary ** 2

    ComplexNumber.new(
      (@real * other.real + @imaginary * other.imaginary).fdiv(denominator),
      (@imaginary * other.real - @real * other.imaginary).fdiv(denominator)
    )
  end

  def +(other)
    ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(@real - other.real, @imaginary - other.imaginary)
  end

  def ==(other)
    @real == other.real && @imaginary == other.imaginary
  end

  def abs
    (@real ** 2 + @imaginary ** 2) ** 0.5
  end

  def exp
    ComplexNumber.new(
      Math.exp(@real) * Math.cos(@imaginary),
      (Math.exp(@real) * Math.sin(@imaginary)).round
    )
  end

  def conjugate
    ComplexNumber.new(@real, -@imaginary)
  end
end
