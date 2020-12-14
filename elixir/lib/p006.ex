# Find the difference between the:
# - sum of the squares of the first 100 numbers
# - square of the sum of the first 100 numbers
# effectively 1^2 + 2^2 + ... - (1 + 2 + ...)^2

defmodule P006 do
  @moduledoc false

  def difference do
    sum_squares = 1..100
      |> Enum.map(&(&1 * &1))
      |> Enum.sum

    square_sum = Enum.sum(1..100) * Enum.sum(1..100)
    sum_squares - square_sum
  end
end
