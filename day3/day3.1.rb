require "matrix"
file = File.open("input3.txt")
data = file.readlines.map(&:chomp)

m = data.map {|s|
  s.chars
}.transpose

n = m.inject([[], []]) {|res, row|
  zeros = row.find_all{|x| x == "0"}.length
  ones = row.length - zeros
  if ones > zeros
    res[0] << "1"
    res[1] << "0"
  else
    res[0] << "0"
    res[1] << "1"
  end
  res
}

gamma = n[0].join.to_i(2)
epsilon = n[1].join.to_i(2)
p gamma, epsilon, gamma * epsilon