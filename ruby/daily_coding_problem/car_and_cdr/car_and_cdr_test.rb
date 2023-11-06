require 'minitest/autorun'
require_relative 'car_and_cdr'

class CarAndCdrTest < Minitest::Test
  def test_car
    assert_equal 3, car(cons(3, 4))
  end

  def test_cdr
    assert_equal 4, cdr(cons(3, 4))
  end
end
