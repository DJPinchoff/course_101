def double_numbers!(array)
  index = 0

  loop do
    break if index == array.size
    array[index] *= 2
    index += 1
  end
end

numbers = [1, 2, 3, 4, 5]
double_numbers!(numbers)

p numbers

empty_array = []
double_numbers!(empty_array)

p empty_array

# Implemented this with .each, then a while loop, and now a loop do.