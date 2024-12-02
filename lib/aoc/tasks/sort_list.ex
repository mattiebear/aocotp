defmodule Aoc.Tasks.SortList do
  @behaviour Aoc.Day

  # TODO: Clean up and add docs
  def difference(input) do
    input
    |> to_split_lists()
    |> (&{Enum.sort(elem(&1, 0)), Enum.sort(elem(&1, 1))}).()
    |> (&Enum.zip(elem(&1, 0), elem(&1, 1))).()
    |> Enum.reduce(0, fn {a, b}, acc -> acc + abs(a - b) end)
  end

  def similarity(input) do
    {source, comp} = to_split_lists(input)

    Enum.map(source, fn n ->
      x = Enum.count(comp, &(&1 == n))
      n * x
    end)
    |> Enum.sum()
  end

  def runners do
    {&difference/1, &similarity/1}
  end

  defp to_split_lists(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({[], []}, fn line, {list1, list2} ->
      [a, b] = String.split(line, " ", trim: true) |> Enum.map(&String.to_integer/1)
      {[a | list1], [b | list2]}
    end)
  end
end
