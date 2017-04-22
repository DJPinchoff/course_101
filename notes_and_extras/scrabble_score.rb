=begin
A, E, I, O, U, L, N, R, S, T,   1
D, G                            2
B, C, M, P                      3
F, H, V, W, Y                   4
K                               5
J, X                            8
Q, Z                            10
=end


def score(string)
  array = string.downcase.chars
  sum = 0
  array.each do |letter|
    if ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'].include?(letter)
      sum += 1
    elsif ['d', 'g'].include?(letter)
      sum += 2
    elsif ['b', 'c', 'm', 'p'].include?(letter)
      sum += 3
    elsif ['f', 'h', 'v', 'w', 'y'].include?(letter)
      sum += 4
    elsif letter == 'k'
      sum += 5
    elsif ['j', 'x'].include?(letter)
      sum += 8
    elsif ['q', 'z'].include?(letter)
      sum += 10
    end
  end
  sum
end



puts score('a') == 1
puts score('cabbage') == 14
puts score('Cabbage') == 14
