defmodule Aoc.Util.FileLoader do
  def load(day_number) do
    File.read!("data/input" <> ensure_string(day_number) <> ".txt")
  end

  defp ensure_string(data) when is_binary(data), do: data
  defp ensure_string(data) when is_integer(data), do: Integer.to_string(data)
end
