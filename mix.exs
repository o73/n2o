defmodule Sample.Mixfile do
  use Mix.Project
  def project do [ app: :n2o_elixir, version: "0.0.1", deps: deps ] end
  def application do [ mod: { Sample, [] }, applications: [:cowboy, :n2o] ] end
  defp deps do [ {:n2o, github: "5HT/n2o"} ] end
end
