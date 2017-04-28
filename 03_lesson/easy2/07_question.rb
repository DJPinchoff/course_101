=begin
Question 7

In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

We could have used either Array#concat or Array#push to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.insert(-1, "Dino", "Hoppy")

# Launch School answers were:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain

# or
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item