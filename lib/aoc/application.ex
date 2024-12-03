defmodule Aoc.Application do
  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Application starting")

    children = [
      Aoc.Registry
    ]

    opts = [strategy: :one_for_one, name: Aoc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
