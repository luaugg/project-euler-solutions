# Find earliest number under a million that produces the longest Collatz sequence.

defmodule P014 do
  @moduledoc false

  defp g(x) when rem(x, 2) == 0, do: div(x, 2)
  defp g(x), do: 3 * x + 1

  defp chain_length(x, state \\ 0) do
    case g(x) do
      1 -> state + 2
      value -> chain_length(value, state + 1)
    end
  end

  def longest_chain(pair \\ {0, 0}, i \\ 2)
  def longest_chain({earliest, _}, 1_000_000), do: earliest
  def longest_chain(pair = {_, longest}, i) do
    length = chain_length(i)
    pair = if length > longest, do: {i, length}, else: pair
    longest_chain(pair, i + 1)
  end
end
