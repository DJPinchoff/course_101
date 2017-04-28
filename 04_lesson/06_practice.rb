# Amend this array so that the names are all shortened to just the first three characters:

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each { |word| word.slice!(3, word.length - 3) }
p flintstones

# Could also use .map! method which automatically interates through the array and executes a block { something }