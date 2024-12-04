defmodule Aoc do
  def run_day(day_number) when is_integer(day_number) do
    result = Aoc.Runner.run_day(day_number)

    IO.puts("Result for day #{day_number}")
    IO.puts("---------------------")
    IO.puts("Task 1: #{result.task1}")
    IO.puts("Task 2: #{result.task2}")
  end
end
