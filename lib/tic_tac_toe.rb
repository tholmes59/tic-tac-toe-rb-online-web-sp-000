

def turn_count(board)
   counter = 0 
   board.each do |board|
   if board == "X" || board == "O"
    counter += 1 
  end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

def won?(board)
  WIN_COMBINATIONS.find do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

def full?(board)
  board.all?{|char| char == "X" || char == "O"}
end

def draw?(board)
 full?(board) && !won?(board) 
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if win = won?(board)
    board[win[0]]
  end
end