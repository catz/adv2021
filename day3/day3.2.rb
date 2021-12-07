#  have no idea why I needed recursion and matrix transpose...

require "matrix"
file = File.open("input3.txt")
data = file.readlines.map(&:chomp)

$m = data.map {|s|
  s.chars
}

def calculate_oxygen_rating m, row
  res1 = []

  zeros_positions, ones_positions = row.each_with_index.inject([[],[]]){
    |res2, (s, i)| if s == "0" then res2[0] << i else res2[1] << i end
    res2
  }

  if ones_positions.length > zeros_positions.length || ones_positions.length == zeros_positions.length
    ones_positions.map{|i|
      res1 << m[i]
    }
  else
    zeros_positions.map{|i|
      res1 << m[i]
    }
  end
  res1
end

def calculate_co2_rating m, row
  res1 = []

  zeros_positions, ones_positions = row.each_with_index.inject([[],[]]){
    |res2, (s, i)| if s == "0" then res2[0] << i else res2[1] << i end
    res2
  }

  if zeros_positions.length < ones_positions.length || ones_positions.length == zeros_positions.length
    zeros_positions.map{|i|
      res1 << m[i]
    }
  else
    ones_positions.map{|i|
      res1 << m[i]
    }
  end
  res1
end

def oxygen bit, m
  oxygen_value = calculate_oxygen_rating(m, m.transpose[bit])
  # p oxygen_value.join
  if oxygen_value.length == 1
    oxygen_value
  else
    oxygen bit+1, oxygen_value
  end
end

def co2 bit, m
  co2_value = calculate_co2_rating(m, m.transpose[bit])

  if co2_value.length == 1
    co2_value
  else
    co2 bit+1, co2_value
  end
end

o2 = (oxygen 0, $m).join.to_i(2)
co2 = (co2 0, $m).join.to_i(2)
p o2*co2
