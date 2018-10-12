WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],  
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def player_move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player_move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

  
def turn_count(board)
  counter = 0
  board.each do |square|
    # if square == "X" || square == "O"
    if square != " "
      counter += 1
    end 
  end
  return counter
end



def current_player(board)
  # if turn_count(board) % 2 == 0
  # if turn_count(board).even?
  # if 3.even?
  # if false
  if turn_count(board).even?
    return "X"
  else 
    return "O"
  end
end  
  
def won?(board)
  for i in WIN_COMBINATIONS 
    if (board[i[0]] == 'X' && board[i[1]] == 'X' && board[i[2]] == 'X') || (board[i[0]] == 'O' && board[i[1]] == 'O' && board[i[2]] == 'O')
      return i
    end
  end
  return false 
end

#i is the win combination - singular, with 3 indexes. 

def full?(board)
  for x in board 
    if x == " "
      return false
    end
  end
  return true
end 

def draw?(board)
 !won?(board) && full?(board)
end  

def over?(board)
  won?(board) || draw?(board) || full?(board)
  # if won?(board) || draw?(board) || full?(board)
  #   true
  # else
  #   false
  # end
end

def winner(board)
   winning_combination = won?(board) 
   if winning_combination
     return board[winning_combination[0]]
  end
end 
  
def play(board) 
  # until over?
  #   turn(board)
  # end
  # if won?(board)
  #   puts "Congratulations, you have won!"
  # elsif draw?(board)
  #   puts "It has been a draw"
  # end
end  
  