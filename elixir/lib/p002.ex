# Sum of even-valued Fibonacci numbers less than four million.

defmodule P002 do
  @moduledoc false

  defp sum(_, value, state) when value >= 4000000,
    do: state

  defp sum(previous, value, state) when rem(value, 2) == 0,
    do: sum(value, previous + value, state + value)

  defp sum(previous, value, state),
    do: sum(value, previous + value, state)

  def sum,
    do: sum(1, 1, 0)
end

IO.inspect P002.sum, label: "Sum"
