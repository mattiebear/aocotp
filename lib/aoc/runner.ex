defmodule Aoc.Runner do
  alias Aoc.Util.FileLoader

  def run_day(day_number) do
    FileLoader.load(day_number)
    |> Aoc.Tasks.SortList.difference()
    |> IO.inspect()
  end
end
