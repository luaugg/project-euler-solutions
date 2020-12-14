# Number of ways to go from top left to bottom right in a 20x20 grid, only using R/D movements.
# This is just nCr.

defmodule P015 do
  @moduledoc false

  def paths(grid_size \\ 20) do
    grid_fact = Common.product(grid_size..1)
    twice_grid_fact = Common.product(grid_size * 2..1)
    div(twice_grid_fact, grid_fact * grid_fact)
  end
end
