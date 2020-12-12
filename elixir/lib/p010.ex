# Sum all primes below two million.
# Uses the Sieve of Eratosthenes.
# As Elixir has no native array structure, I am using a map. This causes a significant performance hit, but
# still quite a lot faster than trial division. This took about a minute on an average computer.

defmodule P010 do
  @moduledoc false

  defp sequence(limit) do
    sieve = 2..limit
      |> Enum.reduce(%{}, &Map.put(&2, &1, true))

    2..trunc(:math.sqrt(limit))
      |> Enum.filter(&Map.get(sieve, &1))
      |> Enum.reduce(sieve, fn elem, acc ->
        elem * elem..limit
          |> Enum.take_every(elem)
          |> Enum.reduce(acc, &Map.delete(&2, &1))
      end)
      |> Map.keys
      |> Enum.filter(&(&1))
      |> Enum.sum
  end

  def start,
    do: sequence 2_000_000
end

# IO.inspect P010.start, label: "Sum"
