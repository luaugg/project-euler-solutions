defmodule P017 do
  @moduledoc false

  defp to_words(1000, _), do: "onethousand"

  defp to_words(number, map) when rem(number, 100) == 0 do
    to_words(div(number, 100), map) <> "hundred"
  end

  defp to_words(number, map) when number > 99 do
    remainder = rem(number, 100)
    to_words(number - remainder, map) <> "and" <> to_words(remainder, map)
  end

  defp to_words(number, map)
      when rem(number, 10) == 0
      when number <= 19 do
    Map.get(map, number)
  end

  defp to_words(number, map) do
    remainder = rem(number, 10)
    to_words(number - remainder, map) <> to_words(remainder, map)
  end

  def start do
    {:ok, etf} = File.read("resources/p017_words.data")
    map = :erlang.binary_to_term(etf)

    1..1000
      |> Enum.map(&to_words(&1, map))
      |> Enum.map(&String.length/1)
      |> Enum.sum
  end
end
