# 1. order of digits doesn't matter
# 2. convolution of lines - wrong way

file = File.open("input6.txt")
fishes = file.readline.split(",").map(&:to_i)

$g = Hash.new

(0..8).each{|k|
  $g[k] = 0;
}

fishes.each{|f|
  $g[f] += 1;
}

def tick state
  (0..8).each{|k|
    v = state[k]

    if v > 0
      if k == 0
        $g[6] += v
        $g[8] += v
        $g[0] = 0
      else
        $g[k-1] += v;
        $g[k] -= v;
      end
    end
  }
end

(1..256).each{|k|
  tick $g.dup
  p "#{k}   #{$g}"
  puts "==========="
}

p $g.values.sum