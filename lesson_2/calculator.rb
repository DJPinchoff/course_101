# ask use for two numbers
# ask user for operation to perform
# perform operation on two numbers
# output the result
puts 'Welcome to Calculator!'
puts "What's the first number?"
number1 = gets.chomp
puts "What's the second number?"
number2 = gets.chomp
puts 'What operation would you like to perform? Type a, s, m, or d.'
operator = gets.chomp

result =  if operator == 'a'
            number1.to_i + number2.to_i
          elsif operator == 's'
            number1.to_i - number2.to_i
          elsif operator == 'm'
            number1.to_i * number2.to_i
          else
            number1.to_f / number2.to_f
          end

puts "The result is #{result}."
