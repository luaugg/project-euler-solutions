# Number of ways to go from top left to bottom right in a 20x20 grid, only using R/D movements.
# This is just nCr.

defmodule P015 do
  @moduledoc false

  defp factorial(n), do: Enum.reduce(n..1, 1, &(&1 * &2))

  def paths(grid_size \\ 20) do
    grid_fact = factorial(grid_size)
    twice_grid_fact = factorial(grid_size * 2)
    div(twice_grid_fact, grid_fact * grid_fact)
  end
end
