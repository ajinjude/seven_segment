require 'minitest/autorun'
require 'seven_segment'

class TestEncodingWithAlias < Minitest::Test
  def test_encoding_positive_number
    assert_equal SevenSegment.encode(123),"    _  _ \n  | _| _|\n  ||_  _|"
  end

  def test_encoding_negative_number
    assert_equal SevenSegment.encode(-5278),"    _  _  _  _ \n __|_  _|  ||_|\n    _||_   ||_|"
  end

  def test_floating_point_number
    assert_equal SevenSegment.encode(12.5),"    _     _ \n  | _|   |_ \n  ||_  .  _|"
  end

  def test_all_digits
    assert_equal SevenSegment.encode(-1234567890),
    "       _  _     _  _  _  _  _  _ \n __  | _| _||_||_ |_   ||_||_|| |\n     ||_  _|  | _||_|  ||_| _||_|"
  end

  def test_positive_octal
    assert_equal SevenSegment.encode(0435)," _  _  _ \n _||_||_ \n|_ |_| _|"
  end

  def test_negative_octal
    assert_equal SevenSegment.encode(-0435),"    _  _  _ \n __ _||_||_ \n   |_ |_| _|"
  end

  def test_positive_hex
    assert_equal SevenSegment.encode(0x71b0e),"    _  _  _  _  _ \n|_||_ |_ |_   ||_|\n  ||_| _||_|  ||_|"
  end

  def test_negative_hex
    assert_equal SevenSegment.encode(-0x11a7c),"    _  _  _     _ \n __  | _| _|  ||_ \n     ||_  _|  ||_|"
  end
end