INPUT_TO_CHOICES_HASH = { "r" => 'rock', 'p' => 'paper',
                          "s" => 'scissors', 'sp' => 'spock',
                          "l" => 'lizard' }
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
ASCII_PAPER = <<-PAPER

           ___..__
  __..--""" ._ __.'
              "-..__
            '"--..__";
 ___        '--...__"";
    `-..__ '"---..._;"
          """"----'

PAPER

ASCII_ROCK = <<-ROCK

       ,--.--.__
------" _, \_____)
        / _/____)
        \//(____)
------\     (__)
       `-----"

ROCK

ASCII_SCISSORS = <<-SCISSORS

      .-.  _
      | | / )
      | |/ /
     _|__ /_
    / __)-' )
    |   (.-')
     >._>-'

SCISSORS

ASCII_SPOCK = <<-SPOCK
        _
     .-T |   _
     | | |  / |
     | | | / /`|
  _  | | |/ / /
 | `,' '.' / /
  |_  `-. '--|
    |    '   |
     |  .` _/
     |    |

SPOCK

ASCII_LIZARD = <<-LIZARD

          _____________
 ....-''``'._ _________)
         ,_  '-.___)
           `'-._)_)
 -----'``"-,__(__)

LIZARD

ASCII_HASH = { 'rock' => ASCII_ROCK, 'scissors' => ASCII_SCISSORS,
               'paper' => ASCII_PAPER, 'spock' => ASCII_SPOCK,
               'lizard' => ASCII_LIZARD }

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
    :player
  when 'spock', 'paper'
    :computer
  end
end

def paper_result(computer)
  case computer
  when 'rock', 'spock'
    :player
  when 'scissors', 'lizard'
    :computer
  end
end

def scissors_result(computer)
  case computer
  when 'lizard', 'paper'
    :player
  when 'spock', 'rock'
    :computer
  end
end

def spock_result(computer)
  case computer
  when 'rock', 'scissors'
    :player
  when 'lizard', 'paper'
    :computer
  end
end

def lizard_result(computer)
  case computer
  when 'spock', 'paper'
    :player
  when 'rock', 'scissors'
    :computer
  end
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def end_of_match?(score)
  score == 3
end

def print_dramatic_effect
  index = 1
  print "=> Battling"
  sleep(0.6)
  while index <= 3
    print "."
    sleep(0.6)
    index += 1
  end
  puts
end

def print_thumbs_up
  string = <<-TU
        _
       /(|
      (  :
     __\  \    _____
   (____)  `|
  (____)|   |
   (____).__|
    (___)__.|_____

  TU
  puts string
end

def print_thumbs_down
  string = <<-TU
     _,....._
    (___     `'-.__
   (____
   (____
   (____         ___
        `)   .-'`
        /  .'
        | =|
         \_/

  TU
  puts string
end

def print_current_scores(player_score, computer_score)
  prompt("Player Score: #{player_score}")
  prompt("Computer Score: #{computer_score}")
end

player_score = 0
computer_score = 0

puts
prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!" + "<=".rjust(3))
prompt("First player with 3 points WINS the match!!".center(47) + "<=".rjust(4))
prompt("Press ENTER to Continue".center(45) + "<=".rjust(6))
gets

loop do
  clear_screen

  choice = ''
  loop do
    INPUT_TO_CHOICES_HASH.each do |k, v|
      puts "#{k.upcase} for #{v.capitalize}".center(27)
    end
    prompt("Pick one and press ENTER.")
    print "=> "
    input = gets.chomp.downcase

    if INPUT_TO_CHOICES_HASH.include?(input)
      choice = INPUT_TO_CHOICES_HASH[input]
      break
    end

    prompt("That wasn't a valid choice. Try again!")
  end

  computer_choice = INPUT_TO_CHOICES_HASH.values.sample

  puts ASCII_HASH[choice]
  puts "        -VS-"
  puts ASCII_HASH[computer_choice]

  print_dramatic_effect

  result =  case choice
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

  if result == :player
    print("=> You won!! ")
    player_score += 1
    puts phrase_string_constructor(choice, computer_choice)
  elsif result == :computer
    print("=> Computer won! ")
    computer_score += 1
    puts phrase_string_constructor(computer_choice, choice)
  else
    prompt("It's a tie!")
  end

  print_current_scores(player_score, computer_score)

  if end_of_match?(player_score)
    clear_screen
    print_thumbs_up
    prompt("CONGRATULATIONS!! You win the match!")
    prompt(phrase_string_constructor(choice, computer_choice))
    print_current_scores(player_score, computer_score)
  elsif end_of_match?(computer_score)
    clear_screen
    print_thumbs_down
    prompt("GAME OVER! Computer wins the match.")
    prompt(phrase_string_constructor(computer_choice, choice))
    print_current_scores(player_score, computer_score)
  end

  answer = ''
  loop do
    prompt("Press ENTER to play again! Type 'Q' to quit.")
    answer = gets.chomp.downcase
    break if answer == '' || answer == 'q'

    prompt("I'm sorry I didn't understand.")
  end

  break if answer == 'q'

  if end_of_match?(player_score) || end_of_match?(computer_score)
    player_score = 0
    computer_score = 0
  end
end

prompt("Thank you for playing!")
prompt("Goodbye".center(20))
