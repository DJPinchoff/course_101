=begin
What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
=end

# VERY INTERESTING - the counter/index within the #each method goes to the next element of the new array. So, in the first example, it skips over 2 because 2 is the first element now, and on the next iteration, it goes to the second element.

# In the second example, it prints 1 then 2 and then stops, because 3 and 4 were popped off and are no longer part of the array that is being iterated over.