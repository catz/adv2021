file = File.open("input5.txt")
data = file.readlines.map{|line|
  x = line.chomp.match(/(\d+),(\d+)\s->\s(\d+),(\d+)/)
  if x[1] == x[3] || x[2] == x[4]
    [x[1].to_i,x[2].to_i,x[3].to_i,x[4].to_i]
  else
    nil
  end
}.compact

board = Hash.new

data.each{|x1,y1,x2,y2|
  # horizontal line
  puts "x1=#{x1}, y1=#{y1}, x2=#{x2}, y2=#{y2}"
  if x1 == x2
    ((y1>y2 ? y2 : y1)..(y1>y2 ? y1: y2)).each{|y|
      board[[x1,y]] ||= 0
      board[[x1,y]] += 1
    }
  end

  # vertical line
  if y1 == y2
    ((x1>x2 ? x2 : x1)..(x1>x2 ? x1: x2)).each{|x|
      board[[x,y1]] ||= 0
      board[[x,y1]] += 1
    }
  end
}

p board.values.count{|v| v>=2}