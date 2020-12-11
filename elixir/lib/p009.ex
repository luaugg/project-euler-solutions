# Find product of Pythagorean triplet for which a+b+c = 1000.
# This takes advantage of a < 333.3 and b < 500.

defmodule P009 do
  @moduledoc false

  defp find(a, 500),
    do: find(a + 1, 1)

  defp find(334, _),
    do: :error

  defp find(a, b) when (a * a) + (b * b) != (1000 - a - b) * (1000 - a - b),
    do: find(a, b + 1)

  defp find(a, b),
    do: a * b * (1000 - a - b)

  def start,
    do: find 1,1
end

# IO.inspect P009.start, label: "Product"
