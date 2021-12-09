file = File.open("input7.txt")
$nums = file.readline.split(",").map(&:to_i)

def fuel_needed n1, n2
  (0..(n2-n1).abs).sum
end

def total_full pivot
  $nums.map{|n|
    fuel_needed pivot, n
  }.sum
end

total = (0..$nums.max).map{|n|
  total_full(n)
}.min

p total