require 'minitest/autorun'
require_relative 'up_to'

class TestUpToPartOne < Minitest::Test
  def test_up_to_should_be_true
    up_to = UpTo.new([10, 15, 3, 7])

    assert up_to.calculate_part_one(17)
  end

  def test_up_to_should_be_also_true
    up_to = UpTo.new([10, 15, 3, 7])

    assert up_to.calculate_part_one(22)
  end

  def test_up_to_should_be_false
    up_to = UpTo.new([1, 5, 4, 10, 100, 2])

    refute up_to.calculate_part_one(17)
  end

  def test_up_to_should_be_also_false
    up_to = UpTo.new([1, 5, 4, 10, 100, 2])

    refute up_to.calculate_part_one(99)
  end
end

class TestUpToPartTwo < Minitest::Test
  def test_up_to_should_be_true
    up_to = UpTo.new([10, 15, 3, 7])

    assert up_to.calculate_part_two(17)
  end

  def test_up_to_should_be_also_true
    up_to = UpTo.new([10, 15, 3, 7])

    assert up_to.calculate_part_two(22)
  end

  def test_up_to_should_be_false
    up_to = UpTo.new([1, 5, 4, 10, 100, 2])

    refute up_to.calculate_part_two(17)
  end

  def test_up_to_should_be_also_false
    up_to = UpTo.new([1, 5, 4, 10, 100, 2])

    refute up_to.calculate_part_two(99)
  end
end
