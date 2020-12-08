# Find the difference between the:
# - sum of the squares of the first 100 numbers
# - square of the sum of the first 100 numbers
# effectively 1^2 + 2^2 + ... - (1 + 2 + ...)^2

defmodule P006 do
  @moduledoc false

  defp iter_sum_square(101, sum),
    do: sum

  defp iter_sum_square(current, sum),
    do: iter_sum_square(current + 1, sum + current * current)

  defp iter_square_sum(101, sum),
    do: sum * sum

  defp iter_square_sum(current, sum),
    do: iter_square_sum(current + 1, sum + current)

  def start,
    do: iter_square_sum(1, 0) - iter_sum_square(1, 0)
end

IO.inspect P006.start, label: "Difference"
