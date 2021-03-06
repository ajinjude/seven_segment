require 'pry'
class SevenSegment
  @keys =
    {
      '.' => '       . ',
      '-' => '    __   ',
      '0' => ' _ | ||_|',
      '1' => '     |  |',
      '2' => ' _  _||_ ',
      '3' => ' _  _| _|',
      '4' => '   |_|  |',
      '5' => ' _ |_  _|',
      '6' => ' _ |_ |_|',
      '7' => ' _   |  |',
      '8' => ' _ |_||_|',
      '9' => ' _ |_| _|'
    }

  def self.to_numbers(segment)
    lines = segment.each_line.map { |line| line.scan(/.../) }
    number = lines.transpose.map { |n| @keys.key(n.join) }.join.to_f
    (number % 1).zero? ? number.to_i : number
  end

  def self.to_segment(number)
    raise ArgumentError, 'Characters not supported' if (number.to_s.scan(/[A-Z]/).any? || number.to_s.scan(/[a-z]/).any?)

    segment = number.to_s.chars.map { |n| @keys[n].scan(/.../) }
    segment.transpose.map(&:join).join("\n")
  end

  class << self
    alias encode to_segment
    alias decode to_numbers
  end
end
