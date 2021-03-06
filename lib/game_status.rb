# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    win_array.each do |win_index|
      if board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board, win_array[1])
        return win_array
      end
    end
  end
  return false
end

def draw?(board)
  if won?(board) == false
    return true
  end
return false
end

def full?(board)
  board.all? do |input|
    input == "X" || input == "O"
  end
end

def over?(board)
  if full?(board) && draw?(board) || won?(board)
    return true
  end
  return false
end

def winner(board)
  WIN_COMBINATIONS.each do |win_array|
    win_array.each do |win_index|
      if board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board, win_array[1])
        return board[win_array[0]]
      end
    end
  end
return nil
end
