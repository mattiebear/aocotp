defmodule Aoc.Runner do
  alias Aoc.Util.FileLoader

  # TODO: Make this work better.
  def run_day(day_number) do
    FileLoader.load(day_number)
    |> Aoc.Tasks.SortList.similarity()
    |> IO.inspect()
  end
end
