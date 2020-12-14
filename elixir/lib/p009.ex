# Find product of Pythagorean triplet for which a+b+c = 1000.
# This takes advantage of a < 333.3 and b < 500.

defmodule P009 do
  @moduledoc false

  defguardp is_triple(a, b) when (a * a) + (b * b) == (1000 - a - b) * (1000 - a - b)
  
  def find(a \\ 1, b \\ 1)
  def find(a, 500), do: find(a + 1, 1)
  def find(334, _), do: :error
  def find(a, b) when is_triple(a, b), do: a * b * (1000 - a - b)
  def find(a, b), do: find(a, b + 1)
end
