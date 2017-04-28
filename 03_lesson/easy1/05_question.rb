=begin
Question 5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Ruby's range object in your solution.
=end

puts (10..100).include?(42)

# Launch School solution is below:

puts (10..100).cover?(42)

# Also possible upon research: (But it doesn't use the range object.)
puts 42.between?(10, 100)