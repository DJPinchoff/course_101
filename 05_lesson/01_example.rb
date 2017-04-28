# How would you order this array of number strings by descending numeric value?

p arr = ['10', '11', '9', '7', '8']

arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr


#######OR#########

p arr = ['10', '11', '9', '7', '8']

int_arr = arr.map do |num_string|
  num_string.to_i
end

arr = int_arr.sort.reverse.map do |int|
  int.to_s
end

p arr

