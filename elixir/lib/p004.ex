# Largest palindrome made from the product of two three-digit numbers.

defmodule P004 do
  @moduledoc false

  defp update_pair({1, _}),
    do: :ok

  defp update_pair({x, 1}),
    do: {:update, {x - 1, 999}}

  defp update_pair({x, y}),
    do: {:update, {x, y - 1}}

  defp multiply(largest, pair = {x, y}) do
    product = x * y
    pair = update_pair(pair)
    str = to_string(product)

    largest = if String.reverse(str) == str do
      max(product, largest)
    else
      largest
    end

    case pair do
      :ok -> largest
      {:update, pair} -> multiply(largest, pair)
    end
  end

  def start,
    do: multiply(0, {999, 999})
end

# IO.inspect P004.start, label: "Largest palindrome"
