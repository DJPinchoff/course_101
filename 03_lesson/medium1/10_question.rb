=begin
Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
What would be the output of this code:

bar(foo)
=end

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) == "no" # it's really bar('yes') which goes to 'no' in the ternary operator evaluation

