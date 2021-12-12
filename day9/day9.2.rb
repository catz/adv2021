file = File.open("input9.txt")
$nums = file.readlines.map{|line|
  line.chomp.chars.map(&:to_i)
}

$width = $nums[0].length
$height = $nums.length

def neighbors i, j
  [[-1, 0], [1, 0], [0, -1], [0, 1]].map{|x, y|
    #  check out of bounds negative indexes
    next if i-x < 0 || j-y < 0 || i-x >= $height || j-y >= $width
    [i-x, j-y]
  }.compact
end

def min_adj i, j
  coords = neighbors i, j

  coords.map{|x, y|
    $nums[x][y]
  }.min
end

$visited = {}
def calculate_basin_size i, j, size = 1
  v = $nums[i][j]
  n = neighbors i, j

  while n.length > 0
    next_coord = n.shift
    # p next_coord
    if next_coord && !$visited[next_coord]
      v1 = $nums[next_coord[0]][next_coord[1]]

      if v1 > v && v1 != 9
        $visited[next_coord] = true
        size = calculate_basin_size next_coord[0], next_coord[1], size + 1
      end
    end
  end
  size
end

# 1. find lowest coordinates
coord = [];
$nums.each_with_index{|row, i|
  row.each_with_index{|v, j|
    min = min_adj(i, j)
    if v < min
      coord << [i, j]
    end
  }
}

# 2. find basins sizes
basins = coord.map{|x,y|
  calculate_basin_size x, y
}

b1 = basins.max
basins.delete_at(basins.index b1)
b2 = basins.max
basins.delete_at(basins.index b2)
b3 = basins.max
p b1 * b2 * b3