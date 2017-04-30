WELCOME = "  WELCOME TO TIC-TAC-TOE! "
TOP_OF_GRID = "         |       |"
BOT_OF_GRID = "  _______|_______|_______"
USER_X = 'X'
COMP_O = 'O'
FIRST_TURN = 'choose' # Can be set to 'player', 'computer', or 'choose'

def middle_of_grid(index, array)
  "     #{array[index][0]}   |   #{array[index][1]}   |   #{array[index][2]}"
end

def display_grid(grid_array)
  puts TOP_OF_GRID
  puts middle_of_grid(0, grid_array)
  puts BOT_OF_GRID
  puts TOP_OF_GRID
  puts middle_of_grid(1, grid_array)
  puts BOT_OF_GRID
  puts TOP_OF_GRID
  puts middle_of_grid(2, grid_array)
  puts TOP_OF_GRID
  puts
end

def clear_screen
  system('clear') || system('cls')
end

def update_grid(choice, array, post_user_turn)
  array.each_with_index do |sub_array, sub_i|
    sub_array.each_with_index do |item, item_i|
      if choice == item
        array[sub_i][item_i] = post_user_turn ? USER_X : COMP_O
      end
    end
  end
  array
end

def board_full?(array)
  !array.flatten.any? { |item| [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(item) }
end

def strategic_move_calculator(array)
  return check_offenses(array) if check_offenses(array)
  return check_defenses(array) if check_defenses(array)
  5 # The most strategic move, if there are no other pressing matters!
end

def check_offenses(array)
  return check_diagonals(array, COMP_O) if check_diagonals(array, COMP_O)
  return check_rows(array, COMP_O) if check_rows(array, COMP_O)
  return check_columns(array, COMP_O) if check_columns(array, COMP_O)
  return check_gaps(array, COMP_O) if check_gaps(array, COMP_O)
  false
end

def check_defenses(array)
  return check_diagonals(array, USER_X) if check_diagonals(array, USER_X)
  return check_rows(array, USER_X) if check_rows(array, USER_X)
  return check_columns(array, USER_X) if check_columns(array, USER_X)
  return check_gaps(array, USER_X) if check_gaps(array, USER_X)
  false
end

def check_gaps(array, marker)
  return check_row_gaps(array, marker) if check_row_gaps(array, marker)
  return check_column_gaps(array, marker) if check_column_gaps(array, marker)
  return check_diag_gaps(array, marker) if check_diag_gaps(array, marker)
end

def check_row_gaps(array, marker)
  return row_gap(array, marker, 0) if row_gap(array, marker, 0)
  return row_gap(array, marker, 1) if row_gap(array, marker, 1)
  return row_gap(array, marker, 2) if row_gap(array, marker, 2)
end

def row_gap(array, marker, row)
  if array[row][0] == marker && array[row][2] == marker
    return 2 if row == 0
    return 5 if row == 1
    return 8 if row == 2
  end
end

def check_column_gaps(array, marker)
  return column_gap(array, marker, 0) if column_gap(array, marker, 0)
  return column_gap(array, marker, 1) if column_gap(array, marker, 1)
  return column_gap(array, marker, 2) if column_gap(array, marker, 2)
end

def column_gap(array, marker, col)
  if array[0][col] == marker && array[2][col] == marker
    return 4 if col == 0
    return 5 if col == 1
    return 6 if col == 2
  end
end

def check_diag_gaps(array, marker)
  if (array[0][0] == marker && array[2][2] == marker) ||
     (array[0][2] == marker && array[2][0] == marker)
    5
  end
end

def check_diagonals(array, marker)
  num = false
  if array[1][1] == marker
    num = 1 if array[2][2] == marker
    num = 3 if array[2][0] == marker
    num = 7 if array[0][2] == marker
    num = 9 if array[0][0] == marker
  end
  num
end

def check_rows(array, marker)
  return check_row1(array, marker) if check_row1(array, marker)
  return check_row2(array, marker) if check_row2(array, marker)
  return check_row3(array, marker) if check_row3(array, marker)
end

def check_row1(array, marker)
  return 1 if array[0][1] == marker && array[0][2] == marker
  return 3 if array[0][0] == marker && array[0][1] == marker
end

def check_row2(array, marker)
  return 4 if array[1][1] == marker && array[1][2] == marker
  return 6 if array[1][0] == marker && array[1][1] == marker
end

def check_row3(array, marker)
  return 7 if array[2][1] == marker && array[2][2] == marker
  return 9 if array[2][0] == marker && array[2][1] == marker
end

def check_columns(array, marker)
  return check_column1(array, marker) if check_column1(array, marker)
  return check_column2(array, marker) if check_column2(array, marker)
  return check_column2(array, marker) if check_column3(array, marker)
end

def check_column1(array, marker)
  return 1 if array[1][0] == marker && array[2][0] == marker
  return 7 if array[0][0] == marker && array[1][0] == marker
end

def check_column2(array, marker)
  return 2 if array[1][1] == marker && array[2][1] == marker
  return 8 if array[0][1] == marker && array[1][1] == marker
end

def check_column3(array, marker)
  return 3 if array[1][2] == marker && array[2][2] == marker
  return 9 if array[0][2] == marker && array[1][2] == marker
end

def diagonal_win?(array, x_or_o)
  [array[0][0], array[1][1], array[2][2]].all? { |item| item == x_or_o } ||
    [array[0][2], array[1][1], array[2][0]].all? { |item| item == x_or_o }
end

def row_win?(array, x_or_o)
  array[0].all? { |item| item == x_or_o } ||
    array[1].all? { |item| item == x_or_o } ||
    array[2].all? { |item| item == x_or_o }
end

def column_win?(array, x_or_o)
  column(array, 0).all? { |item| item == x_or_o } ||
    column(array, 1).all? { |item| item == x_or_o } ||
    column(array, 2).all? { |item| item == x_or_o }
end

def column(array, num)
  [array[0][num], array[1][num], array[2][num]]
end

def winner?(array, x_or_o)
  row_win?(array, x_or_o) ||
    column_win?(array, x_or_o) ||
    diagonal_win?(array, x_or_o)
end

def print_after_update(array)
  clear_screen
  puts WELCOME
  puts
  display_grid(array)
end

def print_scores(player_score, computer_score)
  puts "Player Won: #{player_score}"
  puts "Computer Won: #{computer_score}"
end

def first_turn_choice(array)
  choice = ""
  loop do
    puts "Choose who you would like to go first:"
    puts "1) Player"
    puts "2) Computer"
    puts "3) Random Choice"
    print ">>> "
    choice = gets.chomp.to_i
    break if choice == 1 || choice == 2 || choice == 3

    puts "I'm sorry. I didn't understand..."
    puts
  end
  print_after_update(array)
  choice_method(choice)
end

def choice_method(choice)
  case choice
  when 1
    false
  when 2
    true
  when 3
    [false, true].sample
  end
end

def determine_first_turn(array)
  if FIRST_TURN == 'player'
    false
  elsif FIRST_TURN == 'computer'
    true
  else
    first_turn_choice(array)
  end
end

grid_array = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

print_after_update(grid_array)
post_user_turn = determine_first_turn(grid_array)
player_score = 0
computer_score = 0

loop do
  user_choice = 0
  if post_user_turn == false
    loop do
      break if board_full?(grid_array)
      puts "Which square do you want?"
      print ">>> "
      user_choice = gets.chomp.to_i
      if grid_array.flatten.include?(user_choice)
        post_user_turn = true
        break
      end
      puts "I'm sorry. I didn't understand..."
    end
  grid_array = update_grid(user_choice, grid_array, post_user_turn)
  print_after_update(grid_array)
  end

  puts "...Thinking..."
  sleep(1.5)

  if !winner?(grid_array, "X") && post_user_turn == true
    computer_choice = 0
    loop do
      break if board_full?(grid_array)

      if strategic_move_calculator(grid_array)
        computer_choice = strategic_move_calculator(grid_array)
        if grid_array.flatten.include?(computer_choice)
          post_user_turn = false
          grid_array = update_grid(computer_choice, grid_array, post_user_turn)
          print_after_update(grid_array)
          break
        end
      end

      computer_choice = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
      if grid_array.flatten.include?(computer_choice)
        post_user_turn = false
        grid_array = update_grid(computer_choice, grid_array, post_user_turn)
        print_after_update(grid_array)
        break
      end
    end
  end

  if winner?(grid_array, USER_X)
    puts
    puts "CONGRATULATIONS!! You won!"
    player_score += 1
    print_scores(player_score, computer_score)
  elsif winner?(grid_array, COMP_O)
    puts
    puts "GAME OVER!! Computer won!"
    computer_score += 1
    print_scores(player_score, computer_score)
  elsif board_full?(grid_array)
    puts
    puts "What a match!! It's a tie!"
    print_scores(player_score, computer_score)
  else
    next
  end

  if player_score == 3
    puts "You've won too many games!! I quit."
    puts
    break

  elsif computer_score == 3
    puts "I'm exhausted from all that winning!! See you next time."
    puts
    break
  end

  again = ""
  loop do
    puts "Do you want to play again? 'Y' or 'N'"
    print ">>> "
    again = gets.chomp.downcase
    break if again == 'y' || again == 'n'
    puts "I'm sorry. I didn't understand..."
  end

  if again == 'n'
    puts "Thanks for playing! Goodbye."
    puts
    break

  else
    grid_array = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]
    print_after_update(grid_array)
    post_user_turn = determine_first_turn(grid_array)
  end
end
