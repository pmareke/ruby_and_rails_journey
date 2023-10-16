require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1_is_i
    assert_equal "I", 1.to_roman
  end

  def test_2_is_ii
    assert_equal "II", 2.to_roman
  end

  def test_3_is_iii
    assert_equal "III", 3.to_roman
  end

  def test_4_is_iv
    assert_equal "IV", 4.to_roman
  end

  def test_5_is_v
    assert_equal "V", 5.to_roman
  end

  def test_6_is_vi
    assert_equal "VI", 6.to_roman
  end

  def test_9_is_ix
    assert_equal "IX", 9.to_roman
  end

  def test_27_is_xxvii
    assert_equal "XXVII", 27.to_roman
  end

  def test_48_is_xlviii
    assert_equal "XLVIII", 48.to_roman
  end

  def test_49_is_xlix
    assert_equal "XLIX", 49.to_roman
  end

  def test_59_is_lix
    assert_equal "LIX", 59.to_roman
  end

  def test_93_is_xciii
    assert_equal "XCIII", 93.to_roman
  end

  def test_141_is_cxli
    assert_equal "CXLI", 141.to_roman
  end

  def test_163_is_clxiii
    assert_equal "CLXIII", 163.to_roman
  end

  def test_402_is_cdii
    assert_equal "CDII", 402.to_roman
  end

  def test_575_is_dlxxv
    assert_equal "DLXXV", 575.to_roman
  end

  def test_911_is_cmxi
    assert_equal "CMXI", 911.to_roman
  end

  def test_1024_is_mxxiv
    assert_equal "MXXIV", 1024.to_roman
  end

  def test_3000_is_mmm
    assert_equal "MMM", 3000.to_roman
  end

  def test_16_is_xvi
    assert_equal "XVI", 16.to_roman
  end

  def test_66_is_lxvi
    assert_equal "LXVI", 66.to_roman
  end

  def test_166_is_clxvi
    assert_equal "CLXVI", 166.to_roman
  end

  def test_666_is_dclxvi
    assert_equal "DCLXVI", 666.to_roman
  end

  def test_1666_is_mdclxvi
    assert_equal "MDCLXVI", 1666.to_roman
  end

  def test_3001_is_mmmi
    assert_equal "MMMI", 3001.to_roman
  end

  def test_3999_is_mmmcmxcix
    assert_equal "MMMCMXCIX", 3999.to_roman
  end
end
