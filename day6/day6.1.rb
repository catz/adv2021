file = File.open("input6.txt")
fishes = file.readline.split(",").map(&:to_i)

def tick fishes
  old_fishes = []
  new_born_fishes = []
  fishes.each{|f|
    if f==0
      old_fishes << 6
      new_born_fishes << 8
    else
       old_fishes<<(f-1)
    end
  }
  old_fishes + new_born_fishes
end

new_generation = fishes
(1..80).each{|f|
  new_generation = tick(new_generation)
}
p new_generation.count

