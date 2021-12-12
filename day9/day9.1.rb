file = File.open("input9.txt")
$nums = file.readlines.map{|line|
  line.chomp.chars.map(&:to_i)
}

def min_adj i, j
  [[-1, 0], [1, 0], [0, -1], [0, 1]].map{|x, y|
    #  check out of bounds negative indexes
    next if i-x < 0 || j-y < 0
    $nums[i-x] ? $nums[i-x][j-y] : nil
  }.flatten.compact.min
end

sum = 0;
$nums.each_with_index{|row, i|
  row.each_with_index{|v, j|
    min = min_adj(i, j)
    if v < min
      p "value: #{v}, #{i}, #{j}, min: #{min}"
      sum+=(1+v)
    end
  }
}

p sum