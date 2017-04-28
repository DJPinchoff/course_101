# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting #Error - greeting not defined b/c the block above never gets executed was my guess.

#SOLUTION - nothing happens... greeting is nil because it is initialized in the block, even though it hasn't been executed! CRAZY!!!