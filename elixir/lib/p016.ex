# Sum of digits of number 2^1000

defmodule P016 do
  @moduledoc false

  def sum(number \\ 2, exponent \\ 1000) do
    1..exponent - 1
      |> Enum.reduce(number, fn _, acc -> acc * 2 end)
      |> to_string
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum
  end
end