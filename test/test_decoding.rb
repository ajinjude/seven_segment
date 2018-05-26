require 'minitest/autorun'
require 'seven_segment'

class TestDecoding < Minitest::Test
  def test_positive_number
    assert_equal SevenSegment.to_numbers("    _  _ \n  | _| _|\n  ||_  _|"),123
  end

  def test_negative_number
    assert_equal SevenSegment.to_numbers("    _  _  _  _ \n __|_  _|  ||_|\n    _||_   ||_|"),-5278
  end
  def test_floating_point_number
    assert_equal SevenSegment.to_numbers("    _     _ \n  | _|   |_ \n  ||_  .  _|"),12.5
  end

  def test_all_digits
    assert_equal SevenSegment.to_numbers("       _  _     _  _  _  _  _  _ \n __  | _| _||_||_ |_   ||_||_|| |\n     ||_  _|  | _||_|  ||_| _||_|"),
    -1234567890
  end

  def test_positive_octal
    assert_equal SevenSegment.to_numbers(" _  _  _ \n _||_||_ \n|_ |_| _|"),0435
  end

  def test_negative_octal
    assert_equal SevenSegment.to_numbers("    _  _  _ \n __ _||_||_ \n   |_ |_| _|"),-0435
  end

  def test_positive_hex
    assert_equal SevenSegment.to_numbers("    _  _  _  _  _ \n|_||_ |_ |_   ||_|\n  ||_| _||_|  ||_|"),0x71b0e
  end

  def test_negative_hex
    assert_equal SevenSegment.to_numbers("    _  _  _     _ \n __  | _| _|  ||_ \n     ||_  _|  ||_|"),-0x11a7c
  end
end