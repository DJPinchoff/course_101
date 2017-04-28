=begin
Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
Turn this array into a hash where the names are the keys and the values are the positions in the array.
=end

def hash_with_index_from_array(array)
  hash = {}
  array.each_with_index { |name, index| hash[name] = index }
  hash
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p hash_with_index_from_array(flintstones)
