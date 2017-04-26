=begin
Exercise for the reader: What if we wanted to transform the numbers
based on their position in the array rather than their value?

Try coding a solution that doubles the numbers that have odd indices
=end

def double_odd_index(array)
  counter = 0
  selected_doubles = []

  array.each do |num|
    counter.odd? ? selected_doubles << num * 2 : selected_doubles << num
    counter += 1
  end

  selected_doubles
end

numbers = [1, 2, 3, 4, 5]
p double_odd_index(numbers)
p numbers