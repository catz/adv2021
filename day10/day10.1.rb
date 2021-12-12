file = File.open("input10.txt")
data = file.readlines.map(&:chomp)

pairs = {
  "[" => "]",
  "(" => ")",
  "{" => "}",
  "<" => ">",
}

points = {
  ")" => 3,
  "]" => 57,
  "}" => 1197,
  ">" => 25137
}

inverted_pairs = pairs.invert

left = pairs.keys
right = pairs.values

stack = []
illegal = {}
data.each{|s|
  s.chars.each{|c|
    if left.include? c
      stack << c;
    else
      x = stack.pop
      if pairs[x] != c
        illegal[c] ||= 0
        illegal[c] += points[c]
        p "corrupted #{s} #{x} #{pairs[x]} #{c}"
        break
      end
    end
  }
}

p illegal.values.sum