def substrings(string)
  answer_array = []
  char_array = string.chars
  char_array.each_index do |sub_i|
    index = 1
    while index <= string.length - sub_i
      answer_array << string.slice(sub_i, index)
      index += 1
    end
  end
  answer_array
end


puts substrings('abcde') == [ 'a', 'ab', 'abc', 'abcd', 'abcde',
                              'b', 'bc', 'bcd', 'bcde', 
                              'c', 'cd', 'cde', 
                              'd', 'de', 
                              'e']