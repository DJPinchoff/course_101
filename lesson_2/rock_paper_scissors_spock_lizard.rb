VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_INPUT = ['r', 'p', 's', 'sp', 'l']
PLAYER_POINT = "YOU!"
COMPUTER_POINT = "Computer"

def input_index_to_choice(index)
  VALID_CHOICES[index]
end

def rock_result(computer)
  case computer
  when 'lizard', 'scissors'
    PLAYER_POINT
  when 'spock', 'paper'
    COMPUTER_POINT
  end
end

def paper_result(computer)
  case computer
  when 'rock', 'spock'
    PLAYER_POINT
  when 'scissors', 'lizard'
    COMPUTER_POINT
  end
end

def scissors_result(computer)
  case computer
  when 'lizard', 'paper'
    PLAYER_POINT
  when 'spock', 'rock'
    COMPUTER_POINT
  end
end

def spock_result(computer)
  case computer
  when 'rock', 'scissors'
    PLAYER_POINT
  when 'lizard', 'paper'
    COMPUTER_POINT
  end
end

def lizard_result(computer)
  case computer
  when 'spock', 'paper'
    PLAYER_POINT
  when 'rock', 'scissors'
    COMPUTER_POINT
  end
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def player_won?(player_score)
  player_score == 5
end

def computer_won?(computer_score)
  computer_score == 5
end

def print_dramatic_effect
  index = 1
  print "=> And the winner is"
  while index <= 3
    sleep(0.35)
    print "."
    index += 1
  end
  puts
end

player_score = 0
computer_score = 0

puts
prompt("Let's play Rock, Paper, Scissors, Spock, or Lizard!")
prompt("First to 5 points wins the match! (Unless you quit...)")
prompt("Press ENTER to play!")
gets

loop do
  clear_screen
  choice = ''
  loop do
    prompt("Choose an action:")
    VALID_CHOICES.each_with_index do |word, index|
      prompt("'#{VALID_INPUT[index]}' for " + word)
    end
    choice = gets.chomp

    if VALID_INPUT.include?(choice)
      choice = VALID_CHOICES[VALID_INPUT.index(choice)]
      break
    end

    prompt("That wasn't a valid choice. Try again!")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer_choice}")

  print_dramatic_effect
  result =  case choice
            when computer_choice
              "It's a tie!"
            when 'rock'
              rock_result(computer_choice)
            when 'paper'
              paper_result(computer_choice)
            when 'scissors'
              scissors_result(computer_choice)
            when 'spock'
              spock_result(computer_choice)
            when 'lizard'
              lizard_result(computer_choice)
            end
  prompt(result)

  puts
  player_score += 1 if result == PLAYER_POINT
  computer_score += 1 if result == COMPUTER_POINT
  prompt("Your score: #{player_score}")
  prompt("Computer score: #{computer_score}")

  if player_won?(player_score)
    prompt("CONGRATULATIONS!! You won the match.")
  elsif computer_won?(computer_score)
    prompt("Computer won the match! Please try again...")
  end

  puts
  answer = ''
  loop do
    prompt("Do you want to keep going? Please type 'Y' or 'N'.")
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'

    prompt("I'm sorry I didn't understand.")
  end

  break unless answer == 'y'

  if player_won?(player_score) || computer_won?(computer_score)
    player_score = 0
    computer_score = 0
  end
end

prompt("Thank you for playing Rock, Paper, Scissors, Spock, or Lizard.")
prompt("Goodbye!")
