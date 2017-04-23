def valid_number?(num_string)
  Float(num_string) rescue false
end

def calc_payment(amount, monthly_rate, duration)
  amount * (monthly_rate / (1 - (1 + monthly_rate)**-duration))
end

def print_thinking_timer
  i = 1
  print "Calculating"
  while i <= 6
    sleep(0.25)
    print "."
    i += 1
  end
  puts
end

puts
puts "Welcome to the Mortgage/Car Loan Payment Calculator!"
puts "Let's calculate your monthly payment and total cost:"
puts
loop do
  loan_amount = nil
  while loan_amount.nil?
    print "What's the amount of the loan? >>> $"
    input = gets.chomp
    if input.include?(",") then input.tr!(",", "_") end
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
    if input.include?("%") then input.chop! end
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
  puts
  monthly_rate = annual_rate / 12
  monthly_duration = year_duration * 12
  monthly_payment = calc_payment(loan_amount, monthly_rate, monthly_duration)
  print_thinking_timer
  puts "Your monthly payment will be $#{monthly_payment.round(2)}"
  total_cost = (monthly_payment * monthly_duration).round(2)
  puts "The total cost of your loan will be $#{total_cost}"
  puts
  puts "Thank you for using the Mortgage/Car Payment Calculator!"
  loop do
    print "Would you like to use it again? Type 'Y' or 'N'. >>> "
    input = gets.chomp
    if input.downcase == 'n' || input.downcase == 'y' then break end
    puts "Please type 'Y' or 'N'."
  end
  if input.downcase == 'n'
    puts "Goodbye!"
    break
  end
  puts
end
