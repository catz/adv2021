# good explanation of Dijkstra’s Shortest Path Algorithm
# https://www.youtube.com/watch?v=pVfj6mxhdMw

file = File.open("input15.txt")

caves = {}
file.readlines.each_with_index.map{|line, i|
  line.chomp.chars.each_with_index.map{|risk, j|
    caves[[i,j]] = {
      risk: risk.to_i,
      total_risk: Float::INFINITY,
      previos_cave: nil
    }
  }
}

caves[[0,0]][:total_risk] = 0
unvisited = caves.keys

while(!unvisited.empty?)
  x, y = unvisited.min_by{|coord| caves[coord][:d] }

  cave1 = [x+1,y]
  cave2 = [x,y+1]

  [cave1, cave2].each{|coord|
    if caves[coord]
      new_risk = caves[[x,y]][:total_risk] + caves[coord][:risk]
      if new_risk < caves[coord][:total_risk]
        caves[coord][:total_risk] = new_risk
        caves[coord][:previos_cave] = [x,y]
      end
    end
  }

  unvisited.delete [x,y]
end

max = caves.keys.map{|i,j| i}.max

p caves[[max,max]][:total_risk]