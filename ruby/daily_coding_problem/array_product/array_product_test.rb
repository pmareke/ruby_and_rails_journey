require 'minitest/autorun'
require_relative 'array_product'

class ArrayProductTest < Minitest::Test
  def test_the_prodcut_array
    assert_equal [120, 60, 40, 30, 24], ArrayProduct.calculate([1, 2, 3, 4, 5])

    assert_equal [2, 3, 6], ArrayProduct.calculate([3, 2, 1])
  end

  def test_the_prodcut_array_without_division
    assert_equal [120, 60, 40, 30, 24], ArrayProduct.calculate_without_division([1, 2, 3, 4, 5])

    assert_equal [2, 3, 6], ArrayProduct.calculate_without_division([3, 2, 1])
  end
end
