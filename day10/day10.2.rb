file = File.open("input10.txt")
data = file.readlines.map(&:chomp)

pairs = {
  "[" => "]",
  "(" => ")",
  "{" => "}",
  "<" => ">",
}

points = {
  ")" => 1,
  "]" => 2,
  "}" => 3,
  ">" => 4
}

left = pairs.keys
right = pairs.values


scores = []
data.each{|s|
  stack = []
  ok = true

  s.chars.each_with_index{|c, i|
    if left.include? c
      stack << c;
    else
      x = stack.pop
      if pairs[x] != c
        ok = false
        break
      end
    end
  }

  if ok
    score = 0
    while !stack.empty?
      x = stack.pop
      score = score * 5 + points[pairs[x]]
    end
    scores << score
  end
}

sorted_score = scores.sort

p sorted_score[sorted_score.length/2]
