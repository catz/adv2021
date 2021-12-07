file = File.open("input2.txt")
data = file.readlines.map(&:chomp)

x = 0
depth = 0
aim = 0
data.map{|s|
  command, value = s.split " "
  num_value = value.to_i

  if command == "forward" then
    x += num_value

    depth += aim * num_value
  elsif command == "up"  then


    aim -= num_value
  elsif command == "down"  then


    aim += num_value
  else
    puts "unknown command"
  end

  puts "#{x} - #{depth} - #{aim}"
}


puts x * depth
