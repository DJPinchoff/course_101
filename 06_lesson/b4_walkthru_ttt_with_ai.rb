WELCOME = "  WELCOME TO TIC-TAC-TOE! "
TOP_OF_GRID = "         |       |"
BOT_OF_GRID = "  _______|_______|_______"
USER_X = 'X'
COMPUTER_O = 'O'
FIRST_TURN = 'choose'

def middle_of_grid(index, array)
  "     #{array[index][0]}   |   #{array[index][1]}   |   #{array[index][2]}"
end

def clear_screen
  system('clear') || system('cls')
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
end

def board_full?(array)
  !array.flatten.any? { |item| [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(item) }
end

def check_defense_center(array)
  num = false
  if array[1][1] == USER_X
    num = 2 if array[2][1] == USER_X
    num = 4 if array[1][2] == USER_X
    num = 6 if array[1][0] == USER_X
    num = 8 if array[0][1] == USER_X
  end
  num
end

def check_defense_corners(array)
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
  num = false
  if array[0][0] == USER_X && array[0][1] == USER_X
    num = 3
  elsif array[1][0] == USER_X && array[1][1] == USER_X
    num = 6
  elsif array[2][0] == USER_X && array[2][1] == USER_X
    num = 9
  elsif array[0][2] == USER_X && array[0][1] == USER_X
    num = 1
  elsif array[1][2] == USER_X && array[1][1] == USER_X
    num = 4
  elsif array[2][2] == USER_X && array[2][1] == USER_X
    num = 7
  end
  num
end

def check_defense_columns(array)
  num = false
  if array[0][0] == USER_X && array[1][0] == USER_X
    num = 7
  elsif array[0][1] == USER_X && array[1][1] == USER_X
    num = 8
  elsif array[0][2] == USER_X && array[1][2] == USER_X
    num = 9
  elsif array[2][0] == USER_X && array[1][0] == USER_X
    num = 1
  elsif array[2][1] == USER_X && array[1][1] == USER_X
    num = 2
  elsif array[2][2] == USER_X && array[1][2] == USER_X
    num = 3
  end
  num
end

def check_offense_center(array)
  num = false
  if array[1][1] == COMPUTER_O
    num = 2 if array[2][1] == COMPUTER_O
    num = 4 if array[1][2] == COMPUTER_O
    num = 6 if array[1][0] == COMPUTER_O
    num = 8 if array[0][1] == COMPUTER_O
  end
  num
end

def check_offense_corners(array)
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
  num = false
  if array[0][0] == COMPUTER_O && array[0][1] == COMPUTER_O
    num = 3
  elsif array[1][0] == COMPUTER_O && array[1][1] == COMPUTER_O
    num = 6
  elsif array[2][0] == COMPUTER_O && array[2][1] == COMPUTER_O
    num = 9
  elsif array[0][2] == COMPUTER_O && array[0][1] == COMPUTER_O
    num = 1
  elsif array[1][2] == COMPUTER_O && array[1][1] == COMPUTER_O
    num = 4
  elsif array[2][2] == COMPUTER_O && array[2][1] == COMPUTER_O
    num = 7
  end
  num
end

def check_offense_columns(array)
  num = false
  if array[0][0] == COMPUTER_O && array[1][0] == COMPUTER_O
    num = 7
  elsif array[0][1] == COMPUTER_O && array[1][1] == COMPUTER_O
    num = 8
  elsif array[0][2] == COMPUTER_O && array[1][2] == COMPUTER_O
    num = 9
  elsif array[2][0] == COMPUTER_O && array[1][0] == COMPUTER_O
    num = 1
  elsif array[2][1] == COMPUTER_O && array[1][1] == COMPUTER_O
    num = 2
  elsif array[2][2] == COMPUTER_O && array[1][2] == COMPUTER_O
    num = 3
  end
  num
end

def check_defenses(array)
  return check_defense_rows(array) if check_defense_rows(array)
  return check_defense_columns(array) if check_defense_columns(array)
  return check_defense_center(array) if check_defense_center(array)
  return check_defense_corners(array) if check_defense_corners(array)
  false
end

def check_offenses(array)
  return check_offense_center(array) if check_offense_center(array)
  return check_offense_corners(array) if check_offense_corners(array)
  return check_offense_rows(array) if check_offense_rows(array)
  return check_offense_columns(array) if check_offense_columns(array)
  false
end

def strategic_move_calculator(array)
  return check_offenses(array) if check_offenses(array)
  return check_defenses(array) if check_defenses(array)
  5 # The most strategic move, if there are no other pressing matters!
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

def diagonal?(array, x_or_o)
  [array[0][0], array[1][1], array[2][2]].all? { |item| item == x_or_o } ||
    [array[0][2], array[1][1], array[2][0]].all? { |item| item == x_or_o }
end

def horizontal?(array, x_or_o)
  array[0].all? { |item| item == x_or_o } ||
    array[1].all? { |item| item == x_or_o } ||
    array[2].all? { |item| item == x_or_o }
end

def vertical?(array, x_or_o)
  [array[0][0], array[1][0], array[2][0]].all? { |item| item == x_or_o } ||
    [array[0][1], array[1][1], array[2][1]].all? { |item| item == x_or_o } ||
    [array[0][2], array[1][2], array[2][2]].all? { |item| item == x_or_o }
end

def winner?(array, x_or_o)
  horizontal?(array, x_or_o) ||
    vertical?(array, x_or_o) ||
    diagonal?(array, x_or_o)
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
  boolean = false
  if FIRST_TURN == "computer"
    boolean = true
  elsif FIRST_TURN == "choose"
    choice = ""
    loop do
      puts
      print "Who would you like to go first? (player or computer) >>> "
      choice = gets.chomp
      break if choice == "player" || choice == "computer"

      puts "I'm sorry. I didn't understand..."
    end
    boolean = choice == "computer" ? true : false
  elsif FIRST_TURN == "player"
    boolean = false
  end
  boolean
end

grid_array = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

print_after_update(grid_array)
after_user = false
player_score = 0
computer_score = 0
after_user = determine_first_turn

loop do
  user_choice = 0
  if after_user == false
    loop do
      break if board_full?(grid_array)
      puts
      puts "Which square do you want?"
      print ">>> "
      user_choice = gets.chomp.to_i
      if grid_array.flatten.include?(user_choice)
        after_user = true
        break
      end
      puts "I'm sorry. I didn't understand..."
    end
  end

  grid_array = update_grid(user_choice, grid_array, after_user)
  print_after_update(grid_array)
  puts
  puts "...Thinking..."
  sleep(1.3)

  if !winner?(grid_array, "X") && after_user == true
    computer_choice = 0
    loop do
      break if board_full?(grid_array)

      if strategic_move_calculator(grid_array)
        computer_choice = strategic_move_calculator(grid_array)
        if grid_array.flatten.include?(computer_choice)
          after_user = false
          grid_array = update_grid(computer_choice, grid_array, after_user)
          print_after_update(grid_array)
          break
        end
      end
      computer_choice = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
      if grid_array.flatten.include?(computer_choice)
        after_user = false
        grid_array = update_grid(computer_choice, grid_array, after_user)
        print_after_update(grid_array)
        break
      end
    end
  end

  if winner?(grid_array, "X")
    puts
    puts "CONGRATULATIONS!! You won!"
    player_score += 1
    print_scores(player_score, computer_score)
  elsif winner?(grid_array, "O")
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
    print "Do you want to play again? 'Y' or 'N' >>> "
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
    after_user = determine_first_turn
  end
end
