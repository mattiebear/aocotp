defmodule Aoc.Runner do
  alias Aoc.Util.FileLoader

  @runners %{
    1 => Aoc.Tasks.SortList
  }

  # TODO: Make this work better.
  def run_day(day_number) do
    module = @runners[day_number]
    {task1, task2} = module.runners()

    data = FileLoader.load(day_number)
    output1 = task1.(data)
    output2 = task2.(data)

    IO.puts("Task 1: #{output1}")
    IO.puts("Task 2: #{output2}")
  end
end
