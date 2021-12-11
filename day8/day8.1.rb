file = File.open("input8.txt")

outputs = file.readlines.map(&:chomp).map{|l|
  k = l.split " | "
  # p k[0]
  k[1].split(" ").map{|s|
    [2,4,3,7].include?(s.length) ? 1 : 0
  }
}.flatten.sum

p outputs