file = File.open("input8.txt")
dict = {
  "abcdef": {num: 0, u: 6},
  "cf":     {num: 1, u: 2},
  "acdeg":  {num: 2, u: 5},
  "acdfg":  {num: 3, u: 5},
  "bcdf":   {num: 4, u: 4},
  "abdfg":  {num: 5, u: 5},
  "abdefg": {num: 6, u: 6},
  "acf":    {num: 7, u: 3},
  "abcdefg":{num: 8, u: 7},
  "abcdfg": {num: 9, u: 6},
}

outputs = file.readlines.map(&:chomp).map{|l|
  k = l.split " | "
  # p k[0]
  k[1].split(" ").map{|s|
    o = s.chars.sort.join
    [2,4,3,7].include?(o.length) ? 1 : 0
  }
}.flatten.sum

p outputs