file = File.open("input12.txt")
$links = file.readlines.map{|line|
  line.chomp.split "-"
}

def small_cave? cave
  cave.downcase == cave
end

additional_links = []
$links.each{|start_cave, end_cave|
  next if start_cave =="start" || end_cave == "end"

  additional_links << [end_cave, start_cave]
}

$links += additional_links
p $links

def connected_caves node
  $links.select{|start_cave, _| start_cave == node}.map{|n| n[1]}
end

$paths = []

def visit_small_cave_again path
  path.select{|s| s.downcase == s}.tally.values.any?{|c| c> 1}
end

def traverse current_path, next_caves = [], level=0
  # p "level: #{level} next_caves: #{next_caves.join(',')}"
  unless next_caves.empty?
    next_cave = next_caves.pop
    path = current_path + [next_cave]
    if next_cave == "end"
     $paths << path
     # p "success path: #{path.join(',')}"
     traverse(current_path, next_caves, level+1)
    elsif visit_small_cave_again(path)
      # p "dead path: #{path.join(',')}"
      traverse(current_path, next_caves, level+1)
    else
      traverse(path, connected_caves(next_cave), level+1)
    end
  end

  # p "current_path: #{current_path} next_caves: #{next_caves.join(',')}"

  unless next_caves.empty?
    traverse(current_path, next_caves, level+1)
  end
end

traverse(["start"], connected_caves("start"))

$paths.each {|path|
  puts path.join(',')
}

p $paths.length