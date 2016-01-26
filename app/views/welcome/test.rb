# PROBLEM: Find greatest value in array without sort
# input: [90, 30, 32, 1000, 399, 1329,39, 1]

# iterate over array 
input = [90, 30, 32, 1000, 399, 1329, 39, 1]
max_value = 0
input.each do |number|
  max_value = number unless max_value > number
end
puts max_value