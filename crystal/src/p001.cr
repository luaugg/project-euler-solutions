# Find the sum of all multiples of 3 and 5 below 1000.

def sum
  sum = 0
  1000.times { |i| sum += i if (i % 3) * (i % 5) == 0 }
  sum
end

# puts sum