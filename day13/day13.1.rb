# file = File.open("test13.txt")
file = File.open("input13.txt")

folds = []
coords = []
file.readlines.each{|line|
  if line.start_with? "fold along "
    fold = line.chomp.split("fold along ")[1]
    folds << fold.split("=")
  else
    coords << line.chomp.split(",").map(&:to_i)
  end
}

def print coords
  width = coords.map{|x| x[0]}.max
  height = coords.map{|x| x[1]}.max

  (0..height).each{|y|
    puts (0..width).map{|x|
      coords.include?([x,y]) ? "#" : "."
    }.join
  }
end

def fold arr, i, dir
  arr.map{|x, y|
    if dir == "x"
      if x <= i
        [x, y]
      else
        [i-(x-i), y]
      end
    else
      if y <= i
        [x, y]
      else
        [x, i-(y-i)]
      end
    end
  }.uniq
end

[folds[0]].each{|dir, line|
  coords = fold(coords, line.to_i, dir)

  p coords.length
}
