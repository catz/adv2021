file = File.open("input7.txt")
nums = file.readline.split(",").map(&:to_i)

sorted_nums = nums.sort
if nums.length % 2 == 0
  i1 = nums.length/2
  i2 = i1-1
  i = [sorted_nums[i1], sorted_nums[i2]].uniq
else
  i1 = [i1 = nums.length/2]
  i = [sorted_nums[i1]]
end

p i

fuel = nums.map{|n|
  f = (n-i[0]).abs
  # puts "Move from #{n} to #{i[0]}: #{f} fuel"
  f
}.sum

p fuel

