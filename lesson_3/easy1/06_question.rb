=begin
Question 6

Starting with the string:

famous_words = "seven years ago..."

show two different ways to put the expected "Four score and " in front of it.
=end

puts famous_words = "seven years ago..."

puts famous_words.prepend('Four score and ')

famous_words = "seven years ago..."

puts "Four score and #{famous_words}"

puts "Four score and " + famous_words

puts "Four score and " << famous_words