# Given this nested Hash: figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum = 0
munsters.each do |k, v|
  sum += munsters[k]["age"] if munsters[k]["gender"] == "male"
end
p sum == 444

# Solution from LS used munsters.each_value do |details| where details = inner hash