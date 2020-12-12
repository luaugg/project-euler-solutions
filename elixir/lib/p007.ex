# Find 10,001st prime number.
# We will just use trial division for this. Sieves would also work but they're more complicated to implement.
# We only need to check prime factors up to the square root of the number.

defmodule P007 do
  @moduledoc false

  defp divide(10001, value, _),
    do: value - 2

  defp divide(index, value, divisors) do
    if Common.is_prime(value, divisors) do
        divide index + 1, value + 2, [value | divisors]
    else
        divide index, value + 2, divisors
    end
  end

  def start,
    do: divide 4, 9, [7, 5, 3, 2]
end

# IO.inspect P007.start, label: "10,001st prime number"
