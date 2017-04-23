require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('messages.yml')
language = 'en'
CONSTANT = true
# ask use for two numbers
# ask user for operation to perform
# perform operation on two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  # num.to_i.to_s == num # changed this line for better (not perfect) validation
  Float(num) rescue false # is a way to check for ints and floats
end

def operation_to_message(op, lang)
  binding.pry
  operation = case op
              when '1'
                MESSAGES[lang]['adding']
              when '2'
                MESSAGES[lang]['subtracting']
              when '3'
                MESSAGES[lang]['multiplying']
              when '4'
                MESSAGES[lang]['dividing']
              end
  # now you can put any code here you'd like because operation was assigned
  # to the case statement's value
  operation
end

prompt('Choose one of the languages below:')
prompt('1) English')
prompt('2) Español')
input = gets.chomp.to_i
language =  case input
            when 1
              'en'
            when 2
              'es'
            end

prompt(MESSAGES[language]['welcome'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES[language]['valid_name'])
  else
    break
  end
end

prompt(MESSAGES[language]['hi'] + " #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(MESSAGES[language]['first'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES[language]['valid_number'])
    end
  end
  number2 = nil
  loop do
    prompt(MESSAGES[language]['second'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES[language]['valid_number'])
    end
  end
  prompt(MESSAGES[language]['operation'])
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[language]['valid_operator'])
    end
  end
  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end
  print("........#{operation_to_message(operator, language)}")
  # For fun, I looked up sleep and added a loop to add periods like a timer.
  count = 1
  while count <= 8
    sleep(0.25)
    print '.'
    count += 1
  end
  puts
  prompt(MESSAGES[language]['result'] + "#{result}.")
  prompt(MESSAGES[language]['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt(MESSAGES[language]['goodbye'] + "#{name}!")
