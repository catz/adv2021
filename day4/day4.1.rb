require "matrix"
file = File.open("input4numbers.txt")
numbers = file.readline.split(",").map(&:to_i)

file = File.open("input4boards.txt")
boards = Hash.new
n = 0
file.readlines.map{|line|
  ls = line.chomp.split(" ").map{|num| {num: num.to_i, marked: false}}
  boards[n] ||= []
  if ls.length > 0
    boards[n] << ls
  else
    n+=1
  end
}

def marked_row board
  row = board.find{|l| l.all? {|e| e[:marked]}}
  column = board.transpose.find{|l| l.all? {|e| e[:marked]}}
  row || column
end

def board_score called_number, board
  winning = marked_row(board)
  if winning
    called_number * board.flatten.reject{|e| e[:marked]}.map{|e| e[:num]}.sum
  else
    0
  end
end

score = 0;
boards_win = [];

numbers.each{|n|
  puts "processing: #{n}"
  boards.values.each_with_index{|board, i|
    if !boards_win.include? i
      # puts "processing board: #{i}"
      board.flatten.each{|e|
        if e[:num] == n
          e[:marked] = true
        end
      }

      score = board_score n, board
      if score > 0
        puts "score:#{score} board: #{i}"
        boards_win << i;
        break
      end
    end
  }
  if score > 0 && boards_win.length > 0
    puts "final score: #{score}"
    break
  end
  puts "======"
}

