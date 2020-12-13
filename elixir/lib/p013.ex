# First 10 digits of <sum of 100 50-digit numbers>.

defmodule P013 do
  @moduledoc false

  def start do
    {:ok, etf} = File.read("resources/p013_list.data")

    etf
      |> :erlang.binary_to_term
      |> Enum.sum
      |> Integer.to_string
      |> String.slice(0..9)
      |> Integer.parse
  end
end

# IO.inspect P013.start, label: "First 10 digits"
