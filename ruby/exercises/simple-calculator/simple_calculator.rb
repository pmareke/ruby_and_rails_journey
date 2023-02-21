class SimpleCalculator
  class UnsupportedOperation < StandardError; end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation if not ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError.new("") if not self.are_valid_arguments?(first_operand, second_operand)

    begin
      result = eval("#{first_operand} #{operation} #{second_operand}")
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end

  private

  def self.are_valid_arguments?(first_operand, second_operand)
    first_operand.is_a?(Integer) and second_operand.is_a?(Integer)
  end
end
