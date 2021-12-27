# good explanation of Dijkstra’s Shortest Path Algorithm
# https://www.youtube.com/watch?v=pVfj6mxhdMw

# you can't go only right & down
# you can't take only upper-righy/down-right part from diagonal

require "algorithms"

# file = File.open("test15.txt")
file = File.open("input15.txt")

caves = {}
file.readlines.each_with_index.map{|line, i|
  line.chomp.chars.each_with_index.map{|risk, j|
    caves[[i,j]] = {
      risk: risk.to_i,
      total_risk: Float::INFINITY,
      previous_cave: nil
    }
  }
}

def increase_risk caves
  width = caves.keys.map{|i,j| j}.max+1
  height = caves.keys.map{|i,j| i}.max+1

  big_cave = {}
  (0..4).map{|delta_y|
    (0..4).map{|delta_x|
      # next if delta_x > delta_y

      caves.each{|(x,y), cave|
        new_risk = (cave[:risk]+delta_x+delta_y) % 9
        big_cave[[x+delta_x*width, y+delta_y*height]] = {
          risk: new_risk == 0 ? 9 : new_risk,
          total_risk: Float::INFINITY,
        }
      }
    }
  }
  big_cave
end

caves = increase_risk caves
caves[[0,0]][:total_risk] = 0
unvisited = Containers::PriorityQueue.new
unvisited.push([0,0], 0)

width = caves.keys.map{|i,j| j}.max
height = caves.keys.map{|i,j| i}.max

previous_caves = {}

while(!unvisited.empty?)
  x, y = unvisited.pop

  current_risk = caves[[x,y]][:total_risk]

  cave1 = [x+1, y]
  cave2 = [x, y+1]
  cave3 = [x-1, y]
  cave4 = [x, y-1]

  [cave1, cave2, cave3, cave4].each{|coord|
    if caves[coord]
      risk = caves[coord][:risk]
      new_risk = current_risk + risk

      if new_risk < caves[coord][:total_risk]
        caves[coord][:total_risk] = new_risk
        previous_caves[coord] = [x,y]
        unvisited.push(coord, -new_risk)
      end
    end
  }
end

p caves[[width,height]][:total_risk]

# success_path = []
# q = [previous_caves[[width, height]]]
# while q.any?
#   x = q.shift
#   # p [x, caves[x][:risk], caves[x][:total_risk]]
#   success_path << x
#   q << previous_caves[x]
# end


# puts "<table>"
#   puts "<tbody>"
#     height.times {|i|
#       puts "<tr>"
#         width.times {|j|
#           # if i>80 && i<100 && j>80 && j<100
#           puts "<td>"
#           puts "<small>"
#             if success_path.include? [i,j]
#               puts "<b>#{caves[[i,j]][:risk]}</b>"
#             else
#               # puts caves[[i,j]][:risk]
#             end
#           puts "</small>"
#           puts "</td>"
#           # end
#         }
#       puts  "</tr>"
#     }

#   puts "</tbody>"
# puts "</table>"