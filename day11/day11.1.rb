file = File.open("input11.txt")
$nums = file.readlines.map{|line|
  line.chomp.chars.map(&:to_i)
}

$width = $nums[0].length
$height = $nums.length

def neighbors i, j
  [[-1,-1], [0,-1], [1,-1],
   [-1, 0],         [1, 0],
   [-1, 1], [0, 1], [1, 1]].map{|x, y|
    #  check out of bounds negative indexes
    next if i-x < 0 || j-y < 0 || i-x >= $height || j-y >= $width
    [i-x, j-y]
  }.compact
end

def get_coordinates
  coordinates = []
  $nums.each_with_index{|row, x|
    $nums.each_with_index{|col, y|
      coordinates << [x,y]
    }
  }
  coordinates
end

$step = 1
$flashes = 0

def process
  coordinates = get_coordinates
  already_flashed = []

  while(!coordinates.empty?)
    x, y = coordinates.shift

    if $nums[x][y] >= 9
      n = neighbors x, y
      $nums[x][y] = 0
      $flashes += 1
      already_flashed << [x,y]

      n.each{|i, j|
        next if already_flashed.include?([i,j])

        # will flash
        if $nums[i][j]+1 > 9
          $nums[i][j] = 9
          coordinates << [i,j] unless coordinates.include?([i,j])
        else
          $nums[i][j] += 1
        end
      }
    else
      $nums[x][y]+=1
    end
  end
end

def print_greed
  $nums.each_with_index{|row, y|
    p row.join
  }
  p "====================="
end

100.times{ process }
p $flashes