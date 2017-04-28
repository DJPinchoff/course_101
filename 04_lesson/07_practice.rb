=begin
Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
=end

statement = "The Flintstones Rock"
char_array = statement.chars
char_count_hash = Hash.new(0)

p char_array.each { |char| char_count_hash[char] += 1 unless char == " " }
p char_count_hash.sort.to_h