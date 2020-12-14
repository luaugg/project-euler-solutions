# Sum of even-valued Fibonacci numbers less than four million.

defmodule P002 do
  @moduledoc false

  def sum(previous \\ 1, value \\ 1, state \\ 0)
  def sum(_, value, state) when value >= 4_000_000, do: state
  def sum(prev, val, state) when rem(val, 2) == 0, do: sum(val, prev + val, state + val)
  def sum(prev, val, state), do: sum(val, prev + val, state)
end
