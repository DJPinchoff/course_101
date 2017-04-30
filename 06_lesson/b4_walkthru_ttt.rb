WELCOME = "  WELCOME TO TIC-TAC-TOE! "
TOP_OF_GRID = "         |       |"
BOT_OF_GRID = "  _______|_______|_______"

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
  answer = true
  answer = false if array.flatten.any? do |item|
    [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(item)
  end
  answer
end

def update_grid_array(choice, array, user_boolean)
  array.each_with_index do |sub_array, sub_i|
    sub_array.each_with_index do |item, item_i|
      if choice == item
        array[sub_i][item_i] = user_boolean ? "X" : "O"
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
  winner = false
  if horizontal?(array, x_or_o) ||
     vertical?(array, x_or_o) ||
     diagonal?(array, x_or_o)
    winner = true
  end
  winner
end

def print_after_update(array)
  clear_screen
  puts WELCOME
  puts
  display_grid(array)
end

grid_array = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

print_after_update(grid_array)

loop do
  user_choice = 0
  after_user = false
  loop do
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

  grid_array = update_grid_array(user_choice, grid_array, after_user)
  print_after_update(grid_array)
  puts
  puts "...Thinking..."
  sleep(1.3)

  if !winner?(grid_array, "X")
    computer_choice = 0
    loop do
      break if board_full?(grid_array)
      computer_choice = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
      if grid_array.flatten.include?(computer_choice)
        after_user = false
        grid_array = update_grid_array(computer_choice, grid_array, after_user)
        print_after_update(grid_array)
        break
      end
    end
  end

  if winner?(grid_array, "X")
    puts
    puts "CONGRATULATIONS!! You won!"
  elsif winner?(grid_array, "O")
    puts
    puts "Better luck next time!! Computer won!"
  elsif board_full?(grid_array)
    puts
    puts "What a match!! It's a tie!"
  else
    next
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
  end
end
