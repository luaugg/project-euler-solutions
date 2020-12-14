# Smallest positive integer evenly divisible by numbers 1-20.

defmodule P005 do
  @moduledoc false

  def find(number) do
    result = 20..11
      |> Enum.map(&rem(number, &1) == 0 and number > &1)
      |> Enum.any?(&(!&1))

    if result, do: find(number + 1), else: number
  end
end
