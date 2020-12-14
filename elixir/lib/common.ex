defmodule Common do
  @moduledoc false

  def product(enumerable, acc \\ 1), do: Enum.reduce(enumerable, acc, &(&1 * &2))

  def primes_upto(value) do
    sieve = 2..value
      |> Enum.reduce(%{}, &Map.put(&2, &1, true))

    2..trunc(:math.sqrt(value))
      |> Enum.filter(&Map.get(sieve, &1))
      |> Enum.reduce(sieve, fn elem, acc ->
        elem * elem..value
          |> Enum.take_every(elem)
          |> Enum.reduce(acc, &Map.delete(&2, &1))
      end)
      |> Map.keys
  end
end
