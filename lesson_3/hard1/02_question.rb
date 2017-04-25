# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# My answer is that it puts the hash and its key, values... { a: 'hi there'}
# This is due to the fact that the variable informal_greeting and greetings[:a] are pointing to the same place in memory. So, when ' there' is << into informal_greeting, it mutates that place in memory and greetings is affected.