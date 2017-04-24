VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_result(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear')
end

loop do
  choice = ''
  loop do
    clear_screen
    prompt("Choose one: #{VALID_CHOICES.join(', ')}!")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for playing Rock, Paper, Scissors. Goodbye!")
