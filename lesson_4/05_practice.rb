=begin
In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Find the index of the first name that starts with "Be"
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.index { |word| word.start_with?("Be") } == 3
