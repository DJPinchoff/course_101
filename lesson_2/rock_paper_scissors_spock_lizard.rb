VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
VALID_INPUT = ['r', 'p', 's', 'sp', 'l']
PLAYER_POINT_STRING = "You won this round!"
COMPUTER_POINT_STRING = "Computer won this round."

def rock_result(computer)
  case computer
  when 'lizard', 'scissors'
    PLAYER_POINT_STRING
  when 'spock', 'paper'
    COMPUTER_POINT_STRING
  end
end

def paper_result(computer)
  case computer
  when 'rock', 'spock'
    PLAYER_POINT_STRING
  when 'scissors', 'lizard'
    COMPUTER_POINT_STRING
  end
end

def scissors_result(computer)
  case computer
  when 'lizard', 'paper'
    PLAYER_POINT_STRING
  when 'spock', 'rock'
    COMPUTER_POINT_STRING
  end
end

def spock_result(computer)
  case computer
  when 'rock', 'scissors'
    PLAYER_POINT_STRING
  when 'lizard', 'paper'
    COMPUTER_POINT_STRING
  end
end

def lizard_result(computer)
  case computer
  when 'spock', 'paper'
    PLAYER_POINT_STRING
  when 'rock', 'scissors'
    COMPUTER_POINT_STRING
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
  print "=> And the result is"
  while index <= 3
    sleep(0.35)
    print "."
    index += 1
  end
  puts
end

def print_thumbs_up
  string = <<-TU

┈┈┈┈┈┈▕▔╲
┈┈┈┈┈┈┈▏▕
┈┈┈┈┈┈┈▏▕▂▂▂
▂▂▂▂▂▂╱┈▕▂▂▂▏
▉▉▉▉▉┈┈┈▕▂▂▂▏
▉▉▉▉▉┈┈┈▕▂▂▂▏
▔▔▔▔▔▔╲▂▕▂▂▂I

  TU
  puts string
end

player_score = 0
computer_score = 0

puts
prompt("Let's play Rock, Paper, Scissors, Spock, or Lizard!")
prompt("First to 5 points wins the match.")
prompt("Press ENTER to continue.")
gets

loop do
  clear_screen
  choice = ''
  loop do
    prompt("Choose an action:")
    VALID_CHOICES.each_with_index do |word, index|
      prompt("'#{VALID_INPUT[index]}' for " + word)
    end
    input = gets.chomp.downcase

    if VALID_INPUT.include?(input)
      choice = VALID_CHOICES[VALID_INPUT.index(input)]
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
  player_score += 1 if result == PLAYER_POINT_STRING
  computer_score += 1 if result == COMPUTER_POINT_STRING
  prompt("Your score: #{player_score}")
  prompt("Computer score: #{computer_score}")

  if player_won?(player_score)
    print_thumbs_up
    prompt("CONGRATULATIONS!! You won the match!")
  elsif computer_won?(computer_score)
    prompt("The computer won the match. Please try again.")
  end

  puts
  answer = ''
  loop do
    prompt("Press ENTER to try again. Type 'Q' to quit.")
    answer = gets.chomp.downcase
    break if answer == '' || answer == 'q'

    prompt("I'm sorry I didn't understand.")
  end

  break unless answer == ''

  if player_won?(player_score) || computer_won?(computer_score)
    player_score = 0
    computer_score = 0
  end
end

prompt("Thank you for playing Rock, Paper, Scissors, Spock, or Lizard.")
prompt("Goodbye!")
