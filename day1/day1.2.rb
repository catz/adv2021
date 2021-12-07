file = File.open("input1.txt")
data = file.readlines.map(&:to_i)

sums = data.each_with_index.map { |x,i|
  if data[i+1] && data[i+2]
    data[i] + data[i+1]+ data[i+2]
  else
    nil
  end
}.compact

res = sums.inject([sums[0], 0]) {|res, n|
  if n > res[0] then
    res[1] += 1;
    puts "#{n} increased"
  elsif n == res[0]
    puts "#{n} no changes"
  else
    puts "#{n} decreased"
  end
  res[0] = n;

  res
}

puts res[1]


