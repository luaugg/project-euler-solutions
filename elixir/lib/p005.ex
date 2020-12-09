# Smallest positive integer evenly divisible by numbers 1-20.

defmodule P005 do
  @moduledoc false

  defguardp divisible(number, by)
    when rem(number, by) == 0 and number > by

  # We do not need to check all numbers from 1-20 because, for example:
  # all numbers divisible by 20 are also divisible by all of 20's factors.
  defp iterate(number)
    when divisible(number, 20)
    and divisible(number, 19)
    and divisible(number, 18)
    and divisible(number, 17)
    and divisible(number, 16)
    and divisible(number, 15)
    and divisible(number, 14)
    and divisible(number, 13)
    and divisible(number, 12)
    and divisible(number, 11),
    do: number

  defp iterate(number),
    do: iterate(number + 1)

  def start,
    do: iterate(1)
end

# IO.inspect P005.start, label: "Number"
