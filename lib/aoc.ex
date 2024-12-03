defmodule Aoc do
  def day(day_number) when is_integer(day_number) do
    Aoc.Runner.run_day(day_number)
  end
end
