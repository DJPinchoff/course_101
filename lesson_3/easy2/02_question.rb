=begin
Question 2

Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

Convert the string in the following ways (code will be executed on original munsters_description above):

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
=end

munsters_description = "The Munsters are creepy in a good way."
p "The munsters are creepy in a good way." == munsters_description.gsub!("M", 'm')
p "The munsters are creepy in a good way." == munsters_description.capitalize! # Same effect as above!

munsters_description = "The Munsters are creepy in a good way."
p "tHE mUNSTERS ARE CREEPY IN A GOOD WAY." == munsters_description.swapcase!

munsters_description = "The Munsters are creepy in a good way."
p "the munsters are creepy in a good way." == munsters_description.downcase!

munsters_description = "The Munsters are creepy in a good way."
p "THE MUNSTERS ARE CREEPY IN A GOOD WAY." == munsters_description.upcase!