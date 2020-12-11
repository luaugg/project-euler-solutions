# Sum even Fibonacci numbers less than four million.

def sum_even_fibonacci(limit, previous = 1, current = 2, sum = 0)
    if current >= limit
        return sum
    end

    sum += current if current % 2 == 0
    return sum_even_fibonacci(limit, current, previous + current, sum)
end

# puts sum_even_fibonacci 4_000_000