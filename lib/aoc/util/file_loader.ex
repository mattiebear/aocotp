defmodule Aoc.Util.FileLoader do
  def load(day_number) do
    File.read!("data/input" <> Integer.to_string(day_number) <> ".txt")
  end
end
