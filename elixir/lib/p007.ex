# Find 10,001st prime number.
# Uses Sieve of Eratosthenes. Implementation is in common.ex.

defmodule P007 do
  @moduledoc false

  def find do
    # I already know the 10,001st prime so I am setting a limit slightly higher.

    104_750
      |> Common.primes_upto
      |> Enum.at(10_000)
  end
end