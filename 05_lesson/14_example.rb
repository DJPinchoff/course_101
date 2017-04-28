# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


array = []

hsh.each_value do |inner_hsh|
  if inner_hsh[:type] == 'fruit'
    array << inner_hsh[:colors].map do |element|
      element.capitalize
    end
  else
    array << inner_hsh[:size].upcase
  end
end

p array
# The return value should look like this:
p array == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]