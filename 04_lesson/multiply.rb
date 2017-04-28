=begin
my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
Try coding a method that allows you to multiply every array item by a specified value:
=end

def multiply(number_array, factor)
  multiplied_array = []
  index = 0

  loop do
    break if index == number_array.size

    multiplied_array << number_array[index] * factor
    index += 1
  end
  multiplied_array
end

my_numbers = [1, 2, 3, 4, 5, 6]
p multiply(my_numbers, 3)
p my_numbers


# number_array.each_index { |index| multiplied_array << number_array[index] * factor }