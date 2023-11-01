class Minesweeper
  def self.annotate(board)
    return [] if board.empty?

    annotated = Array.new(board.length) {  '' }
    (0..board.length - 1).inject(annotated) do |acc, row|
      (0..board.first.length - 1).each do |col|
        acc[row][col] = board[row][col] == '*' ? '*' : compute_mines(row, col, board)
      end
      acc
    end
  end

  private

  def self.compute_mines(row, col, board)
    mines = 0
    mines +=1 if row > 0 and board[row-1][col] == '*'
    mines +=1 if row < board.length-1 and board[row+1][col] == '*'
    mines +=1 if col > 0 and board[row][col-1] == '*'
    mines +=1 if col < board[0].length-1 and board[row][col+1] == '*'
    mines +=1 if row > 0 and col > 0 and board[row-1][col-1] == '*'
    mines +=1 if row > 0 and col < board[0].length-1 and board[row-1][col+1] == '*'
    mines +=1 if row < board.length-1 and col > 0 and board[row+1][col-1] == '*'
    mines +=1 if row < board.length-1 and col < board[0].length-1 and board[row+1][col+1] == '*'
    mines > 0 ? mines.to_s : ' '  
  end
end
