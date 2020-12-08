defmodule ProjectEuler.MixProject do
  use Mix.Project

  def project do
    [
      app: :project_euler,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: false,
      deps: []
    ]
  end

  def application, do: []
end
