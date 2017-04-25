INPUT_TO_CHOICES_HASH = { "r" => 'rock', 'p' => 'paper',
                          "s" => 'scissors', 'sp' => 'spock',
                          "l" => 'lizard' }
PLAYER_WINS_ROUND_STRING = "=> You won this round!"
COMPUTER_WINS_ROUND_STRING = "=> Computer won this round."
PHRASES_HASH = { 'rock' => { 'lizard' => 'crushes',
                             'scissors' => 'crushes' },
                 'paper' => { 'rock' => 'covers',
                              'spock' => 'disproves' },
                 'scissors' => { 'paper' => 'cuts',
                                 'lizard' => 'decapitates' },
                 'lizard' => { 'spock' => 'poisons',
                               'paper' => 'eats' },
                 'spock' => { 'rock' => 'vaporizes',
                              'scissors' => 'smashes' } }

def phrase_string_constructor(winner_choice, loser_choice)
  first_word = winner_choice.capitalize
  second_word = PHRASES_HASH[winner_choice][loser_choice]
  third_word = loser_choice
  third_word = third_word.capitalize if loser_choice == 'spock'

  "#{first_word} #{second_word} #{third_word}!"
end

def rock_result(computer)
  case computer
  when 'lizard', 'scissors'
    PLAYER_WINS_ROUND_STRING
  when 'spock', 'paper'
    COMPUTER_WINS_ROUND_STRING
  end
end

def paper_result(computer)
  case computer
  when 'rock', 'spock'
    PLAYER_WINS_ROUND_STRING
  when 'scissors', 'lizard'
    COMPUTER_WINS_ROUND_STRING
  end
end

def scissors_result(computer)
  case computer
  when 'lizard', 'paper'
    PLAYER_WINS_ROUND_STRING
  when 'spock', 'rock'
    COMPUTER_WINS_ROUND_STRING
  end
end

def spock_result(computer)
  case computer
  when 'rock', 'scissors'
    PLAYER_WINS_ROUND_STRING
  when 'lizard', 'paper'
    COMPUTER_WINS_ROUND_STRING
  end
end

def lizard_result(computer)
  case computer
  when 'spock', 'paper'
    PLAYER_WINS_ROUND_STRING
  when 'rock', 'scissors'
    COMPUTER_WINS_ROUND_STRING
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

def print_thumbs_down
  string = <<-TU
███▄█████▄▄
▓▓▓█░░░░░░░██
▓▓▓█░░░░░░░██
▓▓▓█░░░░░░░██
▓▓▓█░░░░░░░██
███▀░░░███▀▀
░░░█░░░█░░
░░░░█░░█░░
░░░░█░░█░░
░░░░░▀▀░░░
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
    INPUT_TO_CHOICES_HASH.each do |k, v|
      prompt("Type #{k} for #{v}.")
    end
    input = gets.chomp.downcase

    if INPUT_TO_CHOICES_HASH.include?(input)
      choice = INPUT_TO_CHOICES_HASH[input]
      break
    end

    prompt("That wasn't a valid choice. Try again!")
  end

  computer_choice = INPUT_TO_CHOICES_HASH.values.sample

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
  print(result + " ")

  if result == PLAYER_WINS_ROUND_STRING
    player_score += 1
    puts phrase_string_constructor(choice, computer_choice)
  elsif result == COMPUTER_WINS_ROUND_STRING
    computer_score += 1
    puts phrase_string_constructor(computer_choice, choice)
  end

  puts
  prompt("Your score: #{player_score}")
  prompt("Computer score: #{computer_score}")

  if player_won?(player_score)
    print_thumbs_up
    prompt("CONGRATULATIONS!! You won the match!")
  elsif computer_won?(computer_score)
    print_thumbs_down
    prompt("YOU LOST!! The computer won the match!")
  end

  answer = ''
  loop do
    prompt("Press ENTER to try again. Type 'Q' to quit.")
    answer = gets.chomp.downcase
    break if answer == '' || answer == 'q'

    prompt("I'm sorry I didn't understand.")
  end

  break if answer == 'q'

  if player_won?(player_score) || computer_won?(computer_score)
    player_score = 0
    computer_score = 0
  end
end

prompt("Thank you for playing Rock, Paper, Scissors, Spock, or Lizard.")
prompt("Goodbye!")
