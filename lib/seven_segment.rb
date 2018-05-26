require 'pry'
class SevenSegment
  @keys = {
      "." => "       . ",
      "-" => "    __   ",
      "0" => " _ | ||_|",
      "1" => "     |  |",
      "2" => " _  _||_ ",
      "3" => " _  _| _|",
      "4" => "   |_|  |",
      "5" => " _ |_  _|",
      "6" => " _ |_ |_|",
      "7" => " _   |  |",
      "8" => " _ |_||_|",
      "9" => " _ |_| _|"
    }

  def self.to_numbers(segment)
    lines = segment.split(/\n/).map{|line| line.scan(/.../)}
    number = lines.transpose.map{|n| @keys.key(n.join)}.join.to_f
    number % 1 == 0 ? number.to_i : number
  end

  def self.to_segment(number)
    raise ArgumentError,"Characters not supported" if (number.to_s.scan(/[A-Z]/).any? || number.to_s.scan(/[a-z]/).any?)
    segment = number.to_s.chars.map { |n| @keys[n].scan(/.../) }
    segment.transpose.map { |s| s.join }.join("\n")
  end

  def self.encode(number)
    SevenSegment.to_segment(number)
  end

  def self.decode(segment)
    SevenSegment.to_numbers(segment)
  end
end