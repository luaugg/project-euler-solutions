# Sum of even-valued Fibonacci numbers less than four million.

defmodule P002 do
  def sum(_, value, state) when value >= 4000000, do: state

  def sum(previous, value, state) when rem(value, 2) == 0 do
    sum(value, previous + value, state + value)
  end

  def sum(previous, value, state), do: sum(value, previous + value, state)
end

IO.puts P002.sum(1, 1, 0)
