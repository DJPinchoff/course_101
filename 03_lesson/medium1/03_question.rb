=begin
Question 3

Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1

What is the purpose of the number % dividend == 0 ?

Bonus 2

What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
=end

#BONUS 1: The purpose of number % dividend == 0 checks to see if a number can be divided by the dividend with no remainder. This would be it is a factor and, therefore, should be placed into the array.

#BONUS 2: The purpose of the second to last line is to return the array of factors that was created in the method.

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(10)
p factors(-1)
p factors(0)
p factors(100)