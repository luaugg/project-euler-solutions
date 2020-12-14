# Sum all primes below two million.

defmodule P010 do
  @moduledoc false

  def sequence(limit \\ 2_000_000) do
    limit
      |> Common.primes_upto
      |> Enum.sum
  end
end