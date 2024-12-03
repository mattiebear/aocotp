defmodule Aoc.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Aoc.Registry,
      Aoc.Runner
    ]

    opts = [strategy: :one_for_one, name: Aoc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
