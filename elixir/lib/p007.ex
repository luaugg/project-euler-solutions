# Find 10,001st prime number
# We will just use trial division for this. Sieves would also work but they're more
# complicated to implement.

# We only need to check prime factors up to the square root of the number.

defmodule P007 do
  @moduledoc false

  defp divide_inner(value, divisor) do
    if rem(value, divisor) == 0 do
      {:halt, divisor}
    else
      {:cont, divisor}
    end
  end

  defp divide(10001, value, _),
    do: value - 2

  defp divide(index, value, divisors) do
    # Only checking primes up to the square root.
    sqrt = :math.sqrt(value)
    reduced = divisors
      |> Enum.reverse
      |> Enum.filter(&(&1 <= sqrt))
      |> Enum.reduce_while(0, fn divisor, _ -> divide_inner(value, divisor) end)

    if rem(value, reduced) != 0 do
        # prime branch
        divide(index + 1, value + 2, [value | divisors])
    else
        # composite branch
        divide(index, value + 2, divisors)
    end
  end

  def start,
    do: divide(4, 9, [7, 5, 3, 2])
end

# IO.inspect P007.start, label: "10,001st prime number"
