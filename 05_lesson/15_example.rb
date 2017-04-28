# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |inner_hash|
  inner_hash.all? do |_, inner_array|
    inner_array.all? do |num|
      num.even?
    end
  end
end

p new_arr

# This one stumped me a bit.