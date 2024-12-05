defmodule Aoc.Tasks.Multiplier do
  @behaviour Aoc.Task

  def runners do
    {&multiply/1, &conditional_multiply/1}
  end

  @spec multiply(binary()) :: integer()
  def multiply(input) do
    Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, input)
    |> Enum.map(&multiply_captures/1)
    |> Enum.sum()
  end

  def conditional_multiply(input) do
    input = String.replace(input, "\n", "")

    break_commands(input)
    |> Enum.filter(&String.match?(&1, ~r/^(?!don't).+/))
    |> Enum.join()
    |> multiply()
  end

  defp multiply_captures([_cap | [a, b]]) do
    String.to_integer(a) * String.to_integer(b)
  end

  defp break_commands(input) do
    do_break_commands(input, [])
  end

  defp do_break_commands(text, list) do
    case Regex.run(~r/.don't\(\)|.do\(\)/, text, return: :index) do
      [{index, _}] ->
        {head, tail} = String.split_at(text, index + 1)
        do_break_commands(tail, [head | list])

      _ ->
        [text | list]
    end
  end
end
