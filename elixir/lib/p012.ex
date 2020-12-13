# Find first triangle number with 500 divisors.

defmodule P012 do
  @moduledoc false

  defp iterate(i) do
    number = div(i * (i + 1), 2)
    divisors = 1..ceil(:math.sqrt(number))
      |> Enum.filter(&rem(number, &1) == 0)
      |> Enum.reduce(0, fn _, acc -> acc + 2 end)

    if divisors > 500, do: number, else: iterate(i + 1)
  end

  def start,
    do: iterate(500)
end

# IO.inspect P012.start, label: "Number"
