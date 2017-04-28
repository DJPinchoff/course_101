# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each_value do |string_array|
  string_array.each do |string|
    vowel_array = []
    string.chars.each do |char|
      vowel_array << char if vowels.include?(char)
    end
    puts '"' + string + '": ' + vowel_array.join(" ")
  end
end


