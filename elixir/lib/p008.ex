# Find the 13 adjacent products in <number> that have the greatest product.
# What is the value?

defmodule P008 do
  @moduledoc false

  defp reduce_product(string) do
    string
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce(1, &(&1 * &2))
  end

  defp scan(string, largest) when byte_size(string) < 13,
    do: largest

  defp scan(string, largest) do
    largest = string
      |> String.slice(0..12)
      |> reduce_product
      |> max(largest)

    string
      |> String.slice(1..-1)
      |> scan(largest)
  end

  def start(number) do
    number
      |> to_string
      |> scan(0)
  end
end

# IO.inspect P008.start(1_234_567_890_987_654_321)
# the real number is 1000 digits long. this is an example.
