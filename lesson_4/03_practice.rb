

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Throw out the really old people (age 100 or older).

p ages.reject { |_, value| value >= 100 }