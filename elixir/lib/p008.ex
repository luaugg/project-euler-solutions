# Find the 13 adjacent products in <number> that have the greatest product.
# What is the value?

defmodule P008 do
  @moduledoc false

  defp scan(string, largest \\ 0)
  defp scan(string, largest) when byte_size(string) < 13, do: largest
  defp scan(string, largest) do
    largest = string
      |> String.slice(0..12)
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
      |> Common.product
      |> max(largest)

    string
      |> String.slice(1..-1)
      |> scan(largest)
  end

  def start(value) when is_number(value), do: start(to_string(value))
  def start(value), do: scan(value)
end
