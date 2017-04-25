=begin
Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
=end

statement = "The Flintstones Rock!"
p statement.scan('t').length

# Launch School's solution is much more direct:
p statement.count('t')