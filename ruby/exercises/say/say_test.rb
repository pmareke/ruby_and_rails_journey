require 'minitest/autorun'
require_relative 'say'

class SayTest < Minitest::Test
  def test_zero
    # skip
    number = 0
    expected = "zero"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one
    number = 1
    expected = "one"
    assert_equal expected, Say.new(number).in_english
  end

  def test_fourteen
    number = 14
    expected = "fourteen"
    assert_equal expected, Say.new(number).in_english
  end

  def test_twenty
    number = 20
    expected = "twenty"
    assert_equal expected, Say.new(number).in_english
  end

  def test_twenty_two
    number = 22
    expected = "twenty-two"
    assert_equal expected, Say.new(number).in_english
  end

  def test_thirty
    number = 30
    expected = "thirty"
    assert_equal expected, Say.new(number).in_english
  end

  def test_ninety_nine
    number = 99
    expected = "ninety-nine"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_hundred
    number = 100
    expected = "one hundred"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_hundred_twenty_three
    number = 123
    expected = "one hundred twenty-three"
    assert_equal expected, Say.new(number).in_english
  end

  def test_two_hundred
    number = 200
    expected = "two hundred"
    assert_equal expected, Say.new(number).in_english
  end

  def test_nine_hundred_ninety_nine
    number = 999
    expected = "nine hundred ninety-nine"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_thousand
    number = 1000
    expected = "one thousand"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_thousand_two_hundred_thirty_four
    number = 1234
    expected = "one thousand two hundred thirty-four"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_million
    number = 1_000_000
    expected = "one million"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_million_two_thousand_three_hundred_forty_five
    number = 1_002_345
    expected = "one million two thousand three hundred forty-five"
    assert_equal expected, Say.new(number).in_english
  end

  def test_one_billion
    number = 1_000_000_000
    expected = "one billion"
    assert_equal expected, Say.new(number).in_english
  end

  def test_a_big_number
    number = 987_654_321_123
    expected = "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"
    assert_equal expected, Say.new(number).in_english
  end

  def test_numbers_below_zero_are_out_of_range
    number = -1
    assert_raises(ArgumentError) do
      Say.new(number).in_english
    end
  end

  def test_numbers_above_999999999999_are_out_of_range
    number = 1_000_000_000_000
    assert_raises(ArgumentError) do
      Say.new(number).in_english
    end
  end
end
