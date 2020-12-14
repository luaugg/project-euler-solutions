# Largest palindrome made from the product of two three-digit numbers.

defmodule P004 do
  @moduledoc false

  defp palindrome?(number) do
    as_str = to_string(number)
    String.reverse(as_str) == as_str
  end

  def find do
    999..1
      |> Enum.reduce(0, fn elem, acc ->
        list = elem..1
          |> Enum.map(&(&1 * elem))
          |> Enum.filter(&palindrome?/1)

        if list == [], do: acc, else: max(Enum.max(list), acc)
      end)
  end
end