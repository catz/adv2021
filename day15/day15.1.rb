# good explanation of Dijkstra’s Shortest Path Algorithm
# https://www.youtube.com/watch?v=pVfj6mxhdMw

file = File.open("input15.txt")

cave = {}
file.readlines.each_with_index.map{|line, i|
  line.chomp.chars.each_with_index.map{|c, j|
    cave[[i,j]] = {
      risk: c.to_i,
      d: Float::INFINITY,
      prev: nil
    }
  }
}

cave[[0,0]][:d] = 0
unvisited = cave.keys

while(!unvisited.empty?)
  x, y = unvisited.min_by{|c| cave[c][:d] }

  cave1 = [x+1,y]
  cave2 = [x,y+1]

  [cave1, cave2].each{|c|
    if cave[c]
      new_risk = cave[[x,y]][:d] + cave[c][:risk]
      if new_risk < cave[c][:d]
        cave[c][:d] = new_risk
        cave[c][:prev] = [x,y]
      end
    end
  }

  unvisited.delete [x,y]
end

max = cave.keys.map{|i,j| i}.max

p cave[[max,max]][:d]