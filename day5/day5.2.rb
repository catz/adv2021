file = File.open("input5.txt")
data = file.readlines.map{|line|
  x = line.chomp.match(/(\d+),(\d+)\s->\s(\d+),(\d+)/)
  [x[1].to_i,x[2].to_i,x[3].to_i,x[4].to_i]
}

board = Hash.new

def draw board
  max = board.keys.flatten.max
  (0..max).each{|y|
    puts (0..max).map{|x|
      board[[x,y]] ? board[[x,y]] : '.'
    }.join
  }
end

data.each{|x1,y1,x2,y2|
  # horizontal line
  if x1 == x2
    puts "horiziontal x1=#{x1}, y1=#{y1}, x2=#{x2}, y2=#{y2}"
    ((y1>y2 ? y2 : y1)..(y1>y2 ? y1: y2)).each{|y|
      board[[x1,y]] ||= 0
      board[[x1,y]] += 1
    }
    next
  end

  # vertical line
  if y1 == y2
    puts "verical x1=#{x1}, y1=#{y1}, x2=#{x2}, y2=#{y2}"
    ((x1>x2 ? x2 : x1)..(x1>x2 ? x1: x2)).each{|x|
      board[[x,y1]] ||= 0
      board[[x,y1]] += 1
    }
    next
  end

  # diagonal line
  if (x2-x1).abs == (y2-y1).abs
    puts "diagonal x1=#{x1}, y1=#{y1}, x2=#{x2}, y2=#{y2}"
    x = (x1>x2 ? x1.downto(x2) : x1..x2).to_a
    y = (y1>y2 ? y1.downto(y2) : y1..y2).to_a
    x.zip(y).each{|x,y|
      board[[x,y]] ||= 0
      board[[x,y]] += 1
    }
  end
}

p board.values.count{|v| v>=2}