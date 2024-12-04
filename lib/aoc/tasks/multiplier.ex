defmodule Aoc.Tasks.Multiplier do
  @behaviour Aoc.Task

  def runners do
    {&multiply/1, &multiply/1}
  end

  @spec multiply(binary()) :: integer()
  def multiply(input) do
    Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, input)
    |> Enum.map(&multiply_captures/1)
    |> Enum.sum()
  end

  defp multiply_captures([_cap | [a, b]]) do
    String.to_integer(a) * String.to_integer(b)
  end
end
