defmodule Aoc.Tasks.SortList do
  def difference(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({[], []}, fn line, {list1, list2} ->
      [a, b] = String.split(line, " ", trim: true) |> Enum.map(&String.to_integer/1)
      {[a | list1], [b | list2]}
    end)
    |> (&{Enum.sort(elem(&1, 0)), Enum.sort(elem(&1, 1))}).()
    |> (&Enum.zip(elem(&1, 0), elem(&1, 1))).()
    |> Enum.reduce(0, fn {a, b}, acc -> acc + abs(a - b) end)
  end

  def similarity(input) do
    {source, comp} =
      input
      |> String.split("\n", trim: true)
      |> Enum.reduce({[], []}, fn line, {list1, list2} ->
        [a, b] = String.split(line, " ", trim: true) |> Enum.map(&String.to_integer/1)
        {[a | list1], [b | list2]}
      end)

    Enum.map(source, fn n ->
      x = Enum.count(comp, &(&1 == n))
      n * x
    end)
    |> Enum.sum()
  end
end
