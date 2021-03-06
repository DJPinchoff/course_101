WELCOME = "  WELCOME TO TIC-TAC-TOE! "
TOP_OF_GRID = "         |       |"
BOT_OF_GRID = "  _______|_______|_______"
USER_X = 'X'
COMPUTER_O = 'O'
FIRST_TURN = 'choose' # Can be 'player', 'computer', or 'choose'

def middle_of_grid(index, array)
  "     #{array[index][0]}   |   #{array[index][1]}   |   #{array[index][2]}"
end

def clear_screen
  system('clear') || system('cls')
end

def update_grid(choice, array, user_boolean)
  array.each_with_index do |sub_array, sub_i|
    sub_array.each_with_index do |item, item_i|
      if choice == item
        array[sub_i][item_i] = user_boolean ? USER_X : COMPUTER_O
      end
    end
  end
  array
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

def board_full?(array)
  !array.flatten.any? { |item| [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(item) }
end

def strategic_move_calculator(array)
  return check_offenses(array) if check_offenses(array)
  return check_defenses(array) if check_defenses(array)
  5 # The most strategic move, if there are no other pressing matters!
end

def check_offenses(array)
  return check_offense_diagonals(array) if check_offense_diagonals(array)
  return check_offense_rows(array) if check_offense_rows(array)
  return check_offense_columns(array) if check_offense_columns(array)
  # Methods to check gaps could be added (ex 1 and 3 are O's.. move = 2)
  false
end

def check_defenses(array)
  return check_defense_diagonals(array) if check_defense_diagonals(array)
  return check_defense_rows(array) if check_defense_rows(array)
  return check_defense_columns(array) if check_defense_columns(array)
  # Methods to check gaps could be added (ex 1 and 3 are X's.. move = 2)
  false
end

def check_defense_diagonals(array)
  num = false
  if array[1][1] == USER_X
    num = 1 if array[2][2] == USER_X
    num = 3 if array[2][0] == USER_X
    num = 7 if array[0][2] == USER_X
    num = 9 if array[0][0] == USER_X
  end
  num
end

def check_defense_rows(array)
  return check_defense_row1(array) if check_defense_row1(array)
  return check_defense_row2(array) if check_defense_row2(array)
  return check_defense_row3(array) if check_defense_row3(array)
  false
end

def check_defense_row1(array)
  return 1 if array[0][1] == USER_X && array[0][2] == USER_X
  return 3 if array[0][0] == USER_X && array[0][1] == USER_X
end

def check_defense_row2(array)
  return 4 if array[1][1] == USER_X && array[1][2] == USER_X
  return 6 if array[1][0] == USER_X && array[1][1] == USER_X
end

def check_defense_row3(array)
  return 7 if array[2][1] == USER_X && array[2][2] == USER_X
  return 9 if array[2][0] == USER_X && array[2][1] == USER_X
end

def check_defense_columns(array)
  return check_defense_column1(array) if check_defense_column1(array)
  return check_defense_column2(array) if check_defense_column2(array)
  return check_defense_column2(array) if check_defense_column3(array)
  false
end

def check_defense_column1(array)
  return 1 if array[1][0] == USER_X && array[2][0] == USER_X
  return 7 if array[0][0] == USER_X && array[1][0] == USER_X
end

def check_defense_column2(array)
  return 2 if array[1][1] == USER_X && array[2][1] == USER_X
  return 8 if array[0][1] == USER_X && array[1][1] == USER_X
end

def check_defense_column3(array)
  return 3 if array[1][2] == USER_X && array[2][2] == USER_X
  return 9 if array[0][2] == USER_X && array[1][2] == USER_X
end

def check_offense_diagonals(array)
  num = false
  if array[1][1] == COMPUTER_O
    num = 1 if array[2][2] == COMPUTER_O
    num = 3 if array[2][0] == COMPUTER_O
    num = 7 if array[0][2] == COMPUTER_O
    num = 9 if array[0][0] == COMPUTER_O
  end
  num
end

def check_offense_rows(array)
  return check_offense_row1(array) if check_offense_row1(array)
  return check_offense_row2(array) if check_offense_row2(array)
  return check_offense_row3(array) if check_offense_row3(array)
  false
end

def check_offense_row1(array)
  return 1 if array[0][1] == COMPUTER_O && array[0][2] == COMPUTER_O
  return 3 if array[0][0] == COMPUTER_O && array[0][1] == COMPUTER_O
end

def check_offense_row2(array)
  return 4 if array[1][1] == COMPUTER_O && array[1][2] == COMPUTER_O
  return 6 if array[1][0] == COMPUTER_O && array[1][1] == COMPUTER_O
end

def check_offense_row3(array)
  return 7 if array[2][1] == COMPUTER_O && array[2][2] == COMPUTER_O
  return 9 if array[2][0] == COMPUTER_O && array[2][1] == COMPUTER_O
end

def check_offense_columns(array)
  return check_offense_column1(array) if check_offense_column1(array)
  return check_offense_column2(array) if check_offense_column2(array)
  return check_offense_column2(array) if check_offense_column3(array)
  false
end

def check_offense_column1(array)
  return 1 if array[1][0] == COMPUTER_O && array[2][0] == COMPUTER_O
  return 7 if array[0][0] == COMPUTER_O && array[1][0] == COMPUTER_O
end

def check_offense_column2(array)
  return 2 if array[1][1] == COMPUTER_O && array[2][1] == COMPUTER_O
  return 8 if array[0][1] == COMPUTER_O && array[1][1] == COMPUTER_O
end

def check_offense_column3(array)
  return 3 if array[1][2] == COMPUTER_O && array[2][2] == COMPUTER_O
  return 9 if array[0][2] == COMPUTER_O && array[1][2] == COMPUTER_O
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

def determine_first_turn
  post_user_turn_boolean = false
  post_user_turn_boolean = true if FIRST_TURN == "computer"
  post_user_turn_boolean = first_turn_choice if FIRST_TURN == "choose"
  post_user_turn_boolean
end

def first_turn_choice
  choice = ""
  loop do
    puts "Choose who you would like to go first:"
    puts "1) Player"
    puts "2) Computer"
    puts "3) Random Choice"
    print ">>> "
    choice = gets.chomp.downcase
    break if choice == "1" || choice == "2" || choice == "3"

    puts "I'm sorry. I didn't understand..."
  end
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

grid_array = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

print_after_update(grid_array)
post_user_turn = false
player_score = 0
computer_score = 0
post_user_turn = determine_first_turn

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
  end

  grid_array = update_grid(user_choice, grid_array, post_user_turn)
  print_after_update(grid_array)
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
  elsif winner?(grid_array, COMPUTER_O)
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
    post_user_turn = determine_first_turn
  end
end
