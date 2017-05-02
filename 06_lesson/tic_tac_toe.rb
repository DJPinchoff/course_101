require 'pry'
FIRST_TURN = 'Choose' # Set to 'Player', 'Computer', or 'Choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system('clear') || system('cls')
  puts "   WELCOME TO TIC-TAC-TOE!"
  puts "         Player = #{PLAYER_MARKER} "
  puts "        Computer = #{COMPUTER_MARKER}"
  puts ""
  puts "         |       |"
  puts "     #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "  _______|_______|_______"
  puts "         |       |"
  puts "     #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}"
  puts "  _______|_______|_______"
  puts "         |       |"
  puts "     #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "         |       |"
  puts ""
end

def display_initial_board
  system('clear') || system('cls')
  puts "   WELCOME TO TIC-TAC-TOE!"
  puts "         Player = #{PLAYER_MARKER} "
  puts "        Computer = #{COMPUTER_MARKER}"
  puts ""
  puts "         |       |"
  puts "     1   |   2   |   3"
  puts "  _______|_______|_______"
  puts "         |       |"
  puts "     4   |   5   |   6"
  puts "  _______|_______|_______"
  puts "         |       |"
  puts "     7   |   8   |   9"
  puts "         |       |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, delimiter, word)
  if array.size == 1
    return array[0].to_s
  elsif array.size == 2
    return array.join(" #{delimiter} ")
  else
    array[-1] = "#{word} #{array[-1]}"
    array.join("#{delimiter} ")
  end
end

def place_piece!(brd, current_player)
  square = nil
  if current_player == PLAYER_MARKER
    loop do
      prompt "Choose a square: #{joinor(empty_squares(brd), ',', 'or')}"
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)

      prompt "Sorry, that's not a valid choice."
    end

    brd[square] = PLAYER_MARKER
  else
    # offense
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
    # defense
    if !square
      WINNING_LINES.each do |line|
        square = find_at_risk_square(line, brd, PLAYER_MARKER)
        break if square
      end
    end
    # pick 5 if nothing else matters
    square = 5 if empty_squares(brd).include?(5)
    # or just a random square
    if !square
      square = empty_squares(brd).sample
    end

  brd[square] = COMPUTER_MARKER
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_scores(player_score, computer_score)
  puts "Player Points: #{player_score}"
  puts "Computer Points: #{computer_score}"
end

def alternate_player(current_player)
  if current_player == PLAYER_MARKER
    current_player = COMPUTER_MARKER
  else
    current_player = PLAYER_MARKER
  end
  current_player
end

def choose_first_player
  answer = ""
  loop do
    puts "Who should go first? (P)layer or (C)omputer"
    answer = gets.chomp.downcase
    break if answer == 'p' || answer == 'c'
    puts "I'm sorry... I didn't understand."
    puts
  end
  return PLAYER_MARKER if answer == 'p'
  return COMPUTER_MARKER if answer == 'c'
end

def detect_first_player(current_player)
  if FIRST_TURN == "Computer"
  COMPUTER_MARKER
elsif FIRST_TURN == "Player"
  PLAYER_MARKER
else
  choose_first_player
end

end
player_score = 0
computer_score = 0
current_player = ""
display_initial_board
current_player = detect_first_player(current_player)

loop do
  board = initialize_board
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} got a point!"
    player_score += 1 if detect_winner(board) == "Player"
    computer_score += 1 if detect_winner(board) == "Computer"
    display_scores(player_score, computer_score)
    if player_score == 3 || computer_score == 3
      prompt "#{detect_winner(board)} won the match!! First to three points!"
      player_score = 0
      computer_score = 0
    end
  else
    prompt "It's a tie!"
    display_scores(player_score, computer_score)
  end

  prompt "Play again? Y or N"
  answer = ""
  loop do
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    puts "I'm sorry. I didn't understand..."
  end

  break if answer == 'n'
  current_player = detect_first_player(current_player)
end

prompt "Thank you for playing Tic Tac Toe!! Goodbye!"
