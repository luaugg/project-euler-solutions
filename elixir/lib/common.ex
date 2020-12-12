defmodule Common do
  @moduledoc false

  # reduce_while compatible impl for even dividing
  def divides_evenly_rw(value, divisor) when rem(value, divisor) == 0,
    do: {:halt, divisor}
  def divides_evenly_rw(_, divisor),
    do: {:cont, divisor}

  def is_prime(value, divisors) do
    sqrt = :math.sqrt value
    reduced = divisors
      |> Enum.reverse
      |> Enum.filter(&(&1 < sqrt))
      |> Enum.reduce_while(0, fn divisor, _ -> divides_evenly_rw value, divisor end)

    rem(value, reduced) != 0
  end
end
