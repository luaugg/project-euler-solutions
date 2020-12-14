# First 10 digits of <sum of 100 50-digit numbers>.

defmodule P013 do
  @moduledoc false

  defp sum(etf) do
    :erlang.binary_to_term(etf)
      |> Enum.sum
      |> Integer.to_string
      |> String.slice(0..9)
      |> Integer.parse
  end

  def start do
    {:ok, etf} = File.read("resources/p013_list.data")
    sum(etf)
  end
end
