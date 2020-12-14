# Find greatest product of four adjacent numbers in same direction in <grid>.
# There are probably more efficient ways to do this but /shrug.
# The matrix ETF data is in the resources folder. It is just a map of index to grid value.

defmodule P011 do
  @moduledoc false

  defp product(map, index, largest, fun) do
    1 .. 3
      |> Enum.map(&Map.get(map, fun.(&1)))
      |> Enum.reject(&is_nil/1)
      |> Common.product(Map.get(map, index))
      |> max(largest)
  end

  def largest_product(_map, 400, largest),
    do: largest
  def largest_product(map, index, largest) do
    # UP/DOWN/LEFT/RIGHT
    largest = product(map, index, largest, &(index - &1 * 20))
    largest = product(map, index, largest, &(index + &1 * 20))
    largest = product(map, index, largest, &(index - &1))
    largest = product(map, index, largest, &(index + &1))

    # DIAGONALS
    largest = product(map, index, largest, &(index - &1 * 19))
    largest = product(map, index, largest, &(index + &1 * 19))
    largest = product(map, index, largest, &(index - &1 * 21))
    largest = product(map, index, largest, &(index + &1 * 21))

    largest_product(map, index + 1, largest)
  end

  def start do
    {:ok, etf} = File.read("resources/p011_map.data")

    etf
      |> :erlang.binary_to_term
      |> largest_product(0, 0)
  end
end

# IO.inspect P011.start, label: "Product"