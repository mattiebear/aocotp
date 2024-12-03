defmodule Aoc.Tasks.ReactorReport do
  @moduledoc """
  Reactor report tasks.
  """

  @behaviour Aoc.Day

  def runners do
    {&safe_reports/1, &dampener_reports/1}
  end

  @spec safe_reports(binary()) :: integer()
  def safe_reports(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&to_int_list/1)
    |> Enum.filter(&is_safe/1)
    |> Enum.count()
  end

  @spec dampener_reports(binary()) :: integer()
  def dampener_reports(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&to_int_list/1)
    |> Enum.filter(&is_damp_safe/1)
    |> Enum.count()
  end

  defp to_int_list(line) do
    line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp is_safe(line) do
    diffs =
      Enum.zip(Enum.drop(line, -1), Enum.drop(line, 1))
      |> Enum.map(&to_diff/1)

    all_positive_or_negative?(diffs) and within_delta_bound?(diffs)
  end

  defp to_diff({a, b}) do
    a - b
  end

  defp all_positive_or_negative?(line) do
    Enum.all?(line, &(&1 >= 0)) or Enum.all?(line, &(&1 <= 0))
  end

  defp within_delta_bound?(line) do
    Enum.all?(line, fn x -> abs(x) >= 1 and abs(x) <= 3 end)
  end

  defp is_damp_safe(line) do
    lines = Enum.map(0..(length(line) - 1), fn n -> List.delete_at(line, n) end)
    Enum.any?(lines, &is_safe/1)
  end
end
