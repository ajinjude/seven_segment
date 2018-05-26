class SevenSegment
  @keys = {
      "       . " => ".",
      "    __   " => "-",
      " _ | ||_|" => "0",
      "     |  |" => "1",
      " _  _||_ " => "2",
      " _  _| _|" => "3",
      "   |_|  |" => "4",
      " _ |_  _|" => "5",
      " _ |_ |_|" => "6",
      " _   |  |" => "7",
      " _ |_||_|" => "8",
      " _ |_| _|" => "9"
    }

  def self.to_numbers(segment)
    lines = segment.split(/\n/).map{|line| line.scan(/.../)}
    number = lines.transpose.map{|n| @keys[n.join]}.join.to_f
    number % 1 == 0 ? number.to_i : number
  end

  def self.to_segment(number)
    segment = number.to_s.chars.map { |n| @keys.key(n).scan(/.../) }
    segment.transpose.map { |s| s.join }.join("\n")
  end

  def self.encode(number)
    SevenSegment.to_segment(number)
  end

  def self.decode(segment)
    SevenSegment.to_numbers(segment)
  end
end