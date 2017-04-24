def valid_number?(num_string)
  Float(num_string)
  true
rescue ArgumentError
  false
end

def calc_payment(amount, monthly_rate, duration)
  amount * (monthly_rate / (1 - (1 + monthly_rate)**-duration))
end

def print_calculating_timer
  index = 1
  print "Calculating"
  while index <= 6
    sleep(0.25)
    print "."
    index += 1
  end
  puts
end

def clear_screen
  system('clear') || system('cls')
end

loop do
  clear_screen
  puts "Welcome to the Mortgage/Car Loan Payment Calculator!"
  puts "Let's calculate your monthly payment and total cost:"
  puts

  loan_amount = nil
  while loan_amount.nil?
    print "What's the amount of the loan? >>> $"
    input = gets.chomp.tr(",", "_")

    if valid_number?(input) && input.to_f > 0
      loan_amount = input.to_f
    else
      puts "That's not a valid number... Try again."
    end
  end

  annual_rate = nil
  while annual_rate.nil?
    print "What's the Annual Percentage Rate? >>> "
    input = gets.chomp
    input.chomp!('%')

    if valid_number?(input) && input.to_f > 0
      annual_rate = input.to_f / 100
    else
      puts "That's not a valid percentage... Try again."
    end
  end

  year_duration = nil
  while year_duration.nil?
    print "What's the loan duration in years? >>> "
    input = gets.chomp

    if valid_number?(input) && input.to_f > 0
      year_duration = input.to_f
    else
      puts "That's not a valid number of years... Try again."
    end
  end

  monthly_rate = annual_rate / 12
  monthly_duration = year_duration * 12
  monthly_payment = calc_payment(loan_amount, monthly_rate, monthly_duration)
  total_cost = (monthly_payment * monthly_duration).round(2)
  print_calculating_timer

  puts "Your monthly payment will be $#{monthly_payment.round(2)}"
  puts "The total cost of your loan will be $#{total_cost}"
  puts
  puts "Thank you for using the Mortgage/Car Loan Payment Calculator!"

  loop do
    print "Would you like to use it again? Type 'Y' or 'N'. >>> "
    input = gets.chomp.downcase
    break if input == 'n' || input == 'y'

    puts "Please type 'Y' or 'N'."
  end

  if input == 'n'
    puts "Goodbye!"
    break
  end
end
