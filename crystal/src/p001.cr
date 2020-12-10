# Find the sum of all multiples of 3 and 5 below 1000.

def sum
  sum = 0

  (1..1000).each do |i|
    sum += i if i % 3 == 0 || i % 5 == 0
  end

  sum
end

# puts sum