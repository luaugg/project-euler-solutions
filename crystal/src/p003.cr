# Largest prime factor of 600,851,475,143
# Uses Pollard's rho algorithm.
# This requires installation of GMP.

require "big"

def g(x, number)
  (x * x + 1).remainder(number)
end

def largest_prime_factor(number)
  x = y = BigInt.new(2)
  divisor = 1

  while divisor == 1
    x = g(x, number)
    y = g(g(y, number), number)
    divisor = (x - y).gcd(number)
  end

  # Can do ternary here but this is cleaner.
  if number == divisor
    divisor
  else
    largest_prime_factor(number // divisor)
  end
end

# puts largest_prime_factor(BigInt.new(600_851_475_143))