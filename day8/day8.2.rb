len_mapping = {
  2 =>  1,
  4 =>  4,
  3 =>  7,
  7 =>  8
}


file = File.open("input8.txt")

outputs = file.readlines.map(&:chomp).map{|l|
  mapping_s = {}
  mapping_l = {}
  k = l.split " | "
  # p k[0]
  signals_sorted = k[0].split(" ").map{|s|
    s = s.chars.sort.join
  }

  outputs_sorted = k[1].split(" ").map{|s|
    s = s.chars.sort.join
  }

  # go through outputs and check numbers 1 => len 2, 7 => len 3, 4 => len 4, 8 => len 7
  outputs_sorted.map{|s|
    if [2,3,4,7].include?(s.length) && signals_sorted.include?(s)
      mapping_s[s] = len_mapping[s.length]
      mapping_l[s.length] = s

      signals_sorted.reject!{|x| x == s}
    end
  }

  # go through signals and do the same
  signals_sorted.map{|s|
    if [2,3,4,7].include?(s.length)
      mapping_s[s] = len_mapping[s.length]
      mapping_l[s.length] = s
    end
  }

  # 1
  top_bar = (mapping_l[3].chars - mapping_l[2].chars).first

  # 2 top left and middle
  top_left_and_middle = (mapping_l[4].chars - mapping_l[2].chars).sort.join

  #3 take numbers 2,3,5 where len = 5. 5 must contain top left
  two_three_five = signals_sorted.filter{|s| s.length == 5}

  c1 = top_left_and_middle.chars[0]
  c2 = top_left_and_middle.chars[1]


  middle, left_top = two_three_five.all?{|s| s.include? c1} ? [c1,c2] : [c2,c1]

  five = two_three_five.find{|s| s.include? left_top}
  mapping_s[five] = 5

  # 4 take number one
  two_three = two_three_five.reject{|s| s == five}

  c1 = mapping_l[2].chars[0]
  c2 = mapping_l[2].chars[1]
  top_right, bottom_right = five.include?(mapping_l[2].chars[0]) ? [c2, c1] : [c1, c2]

  two = two_three.find{|s| !s.include? bottom_right}
  mapping_s[two] = 2

  three = two_three.find{|s| s != two}
  mapping_s[three] = 3

  #4 zero doesn't have middle
  zero_six_nine = signals_sorted.filter{|s| s.length == 6}
  zero = zero_six_nine.find{|s| !s.include? middle}
  mapping_s[zero] = 0
  six_nine = zero_six_nine.reject{|s| s == zero}


  one = mapping_l[2]
  nine = six_nine.find{|s| s.include?(one[0]) && s.include?(one[1])}
  mapping_s[nine] = 9
  six = six_nine.find{|s| !s.include? nine}
  mapping_s[six] = 6

  # p k[1] + " : " + outputs_sorted.map{|s|
  #   mapping_s[s]
  # }.join

  outputs_sorted.map{|s|
    mapping_s[s]
  }.join
}

p outputs.map(&:to_i).sum
