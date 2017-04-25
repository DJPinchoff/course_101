=begin
Question 2

The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?
=end

# You can't add an integer to a string. Thid could work:

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"